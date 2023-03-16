data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}

resource "azurerm_container_registry" "acr" {
  name                = var.name
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = data.azurerm_resource_group.rg.location
  sku                 = var.sku
  admin_enabled       = var.admin_enabled

  dynamic "georeplications" {
    #for_each = var.georeplications
    for_each = each.value.georeplications == null ? [] : ["georeplications"]

    content {
      location                  = eachs.value.location
      zone_redundancy_enabled   = eachs.value.zone_redundancy_enabled
      regional_endpoint_enabled = eachs.value.regional_endpoint_enabled
      tags                      = eachs.value.tags
    }
  }

  tags = var.tags
}
