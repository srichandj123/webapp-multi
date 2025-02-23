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
  apsvc_name = var.fe_apsvc_plan
  rg_name    = module.rg.rg_name
  location   = module.rg.location
  os_type    = "Windows"
  sku_name   = "P0v3"
}

module "fe-webapp" {
  source        = "./modules/windows-webap"
  webapp_name   = var.fe_webapi_name
  location      = module.rg.location
  rg_name       = module.rg.rg_name
  svc_plan_id   = module.fe-webapsvcplan.appsvc_plan_id
  public_access = true

}

resource "azurerm_app_service_virtual_network_swift_connection" "vnetintegrationconnection" {
  app_service_id = module.fe-webapp.app_service_id
  subnet_id      = azurerm_subnet.front-integrationsubnet.id
}
