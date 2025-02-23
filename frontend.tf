resource "azurerm_subnet" "front-integrationsubnet" {
  name                 = "integrationsubnet"
  resource_group_name  = module.rg.rg_name
  virtual_network_name = module.prodvnet.vnet_name
  address_prefixes     = ["10.0.1.0/24"]
  delegation {
    name = "delegation"
    service_delegation {
      name = "Microsoft.Web/serverFarms"
    }
  }
}

module "fe-webapsvcplan" {
  source     = "./modules/app-svc-plan"
  apsvc_name = "fe-webapi-svc-plan"
  location   = module.rg.location
  os_type    = "Windows"
  sku_name   = "P1V2"
}



resource "azurerm_windows_web_app" "frontwebapp" {
  name                = "acme-corp-fe-webapi"
  location            = module.rg.location
  resource_group_name = module.rg.rg_name
  service_plan_id     = module.fe-webapsvcplan.appsvc_plan_id

  site_config {}
  app_settings = {
    # "WEBSITE_DNS_SERVER" : "168.63.129.16",
    # "WEBSITE_VNET_ROUTE_ALL" : "1"
  }
}

resource "azurerm_app_service_virtual_network_swift_connection" "vnetintegrationconnection" {
  app_service_id = azurerm_windows_web_app.frontwebapp.id
  subnet_id      = azurerm_subnet.ifront-integrationsubnet.id
}
