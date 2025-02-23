resource "azurerm_windows_web_app" "windows_app" {
  name                = var.webapp_name
  location            = var.location
  resource_group_name = var.rg_name
  service_plan_id     = var.svc_plan_id
  site_config {
  }
  public_network_access_enabled = var.public_access
}
