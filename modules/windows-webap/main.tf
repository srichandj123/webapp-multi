resource "azurerm_windows_web_app" "webapp"{
name = var.webapp_name
resource_group_name = var.rg_name
location = var.location
service_plan_id = var.service_plan_id
site_config {
  
}

}
  