#Module for Windows Web App (Dotnet - v7.0)
resource "azurerm_windows_web_app" "windows_app" {
  name                = var.webapp_name
  location            = var.location
  resource_group_name = var.rg_name
  service_plan_id     = var.svc_plan_id
  site_config {
    application_stack {
      current_stack  = "dotnet"
      dotnet_version = "v7.0"
    }

  }
  public_network_access_enabled = var.public_access
  app_settings = {
    "APPINSIGHTS_INSTRUMENTATIONKEY"        = azurerm_application_insights.app_insights.instrumentation_key
    "APPLICATIONINSIGHTS_CONNECTION_STRING" = azurerm_application_insights.app_insights.connection_string
  }
}

#Application Insights - Integrated with this WebApp module
resource "azurerm_application_insights" "app_insights" {
  name                = "acme-webapp-appinsights"
  location            = var.location
  resource_group_name = var.rg_name
  application_type    = "web"
}