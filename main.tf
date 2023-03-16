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

    #    for_each = var.georeplications == null && var.sku == "Premium" ? [] : ["georeplications"]
    #    content {
    #      location = georeplications.value["location"]
    #      #zone_redundancy_enabled   = each.value.georeplications.zone_redundancy_enabled
    #      #regional_endpoint_enabled = each.value.georeplications.regional_endpoint_enabled
    #      #tags                      = each.value.georeplications.tags
    #    }

    for_each = var.georeplications
    content {
      location = georeplications.value["location"]
    }

  }

  tags = var.tags
}
