
#App Service Plan
resource "azurerm_service_plan" "app_svcplan"{
name = var.name
location = var.location
resource_group_name = var.rg_name
os_type = var.os_type
sku_name = var.sku

#Optional
maximum_elastic_worker_count = var.maximum_elastic_worker_count
per_site_scaling_enabled = var.per_site_scaling_enabled

}

