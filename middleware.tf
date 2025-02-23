module "mid-webapsvcplan" {
  source     = "./modules/app-svc-plan"
  apsvc_name = mid_apsvc_plan
  rg_name    = module.rg.rg_name
  location   = module.rg.location
  os_type    = "Windows"
  sku_name   = "P0v3"
}

module "mid-webapp" {
  source        = "./modules/windows-webap"
  webapp_name   = mid_webapi_name
  location      = module.rg.location
  rg_name       = module.rg.rg_name
  svc_plan_id   = module.mid-webapsvcplan.appsvc_plan_id
  public_access = false

}

# module "mid-webapp-pe" {
#   source    = "./modules/private-endpoint"
#   pe_name   = "mid-webapp-pe"
#   location  = module.rg.location
#   rg_name   = module.rg.rg_name
#   subnet_id = module.subnet.snet_id[0]


#   private_service_connection = {
#     name                           = "midprivateendpointconnection"
#     is_manual_connection           = false
#     private_connection_resource_id = module.mid-webap.app_service_id
#     subresource_names              = ["sites"]
#   }
#  private_dns_zone_group = {
#     name                 = "privatednszonegroup"
#     private_dns_zone_ids = [azurerm_private_dns_zone.dnsprivatezone.id]
#  }

# }

resource "azurerm_private_dns_zone" "dnsprivatezone" {
  name                = "privatelink.azurewebsites.net"
  resource_group_name = module.rg.rg_name
}

resource "azurerm_private_dns_zone_virtual_network_link" "dnszonelink" {
  name                  = "dnszonelink"
  resource_group_name   = module.rg.rg_name
  private_dns_zone_name = azurerm_private_dns_zone.dnsprivatezone.name
  virtual_network_id    = module.prodvnet.vnet_id
}

resource "azurerm_private_endpoint" "privateendpoint" {
  name                = "mid-webappprivateendpoint"
  location            = module.rg.location
  resource_group_name = module.rg.rg_name
  subnet_id           = module.subnet.snet_id[0]

  private_dns_zone_group {
    name                 = "privatednszonegroup"
    private_dns_zone_ids = [azurerm_private_dns_zone.dnsprivatezone.id]
  }

  private_service_connection {
    name                           = "privateendpointconnection"
    private_connection_resource_id = module.mid-webapp.app_service_id
    subresource_names              = ["sites"]
    is_manual_connection           = false
  }
}