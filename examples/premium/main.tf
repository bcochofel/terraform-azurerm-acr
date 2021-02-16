provider "azurerm" {
  features {}
}

module "rg" {
  source  = "bcochofel/resource-group/azurerm"
  version = "1.2.0"

  name     = "rg-acr-premium-example"
  location = "North Europe"
}

module "acr" {
  source = "../.."

  name                = "acrpremiumexample"
  resource_group_name = module.rg.name

  sku                      = "Premium"
  admin_enabled            = true
  georeplication_locations = ["West Europe"]

  depends_on = [module.rg]
}
