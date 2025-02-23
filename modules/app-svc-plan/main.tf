#Module for App SVC Plan

resource "azurerm_service_plan" "app_svcplan" {
  name                = var.apsvc_name
  location            = var.location
  resource_group_name = var.rg_name
  os_type             = var.os_type
  sku_name            = var.sku_name
}

