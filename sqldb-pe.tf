resource "azurerm_private_dns_zone" "dnsprivatezonesql" {
  name                = "privatelink.database.windows.net"
  resource_group_name = module.rg.rg_name
}

resource "azurerm_private_dns_zone_virtual_network_link" "dnszonelinksql" {
  name                  = "dnszonelinksql"
  resource_group_name   = module.rg.rg_name
  private_dns_zone_name = azurerm_private_dns_zone.dnsprivatezonesql.name
  virtual_network_id    = module.prodvnet.vnet_id
}

resource "azurerm_private_endpoint" "sqlprivateendpoint" {
  name                = "sqldb-privateendpoint"
  location            = module.rg.location
  resource_group_name = module.rg.rg_name
  subnet_id           = module.subnet.snet_id[1]

  private_dns_zone_group {
    name                 = "sqlprivatednszonegroup"
    private_dns_zone_ids = [azurerm_private_dns_zone.dnsprivatezonesql.id]
  }

  private_service_connection {
    name                           = "sqlprivateendpointconnection"
    private_connection_resource_id = module.mid-webapp.app_service_id
    subresource_names              = ["sqlServer"]
    is_manual_connection           = false
  }
}

