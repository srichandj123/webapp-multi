#Azure SQL DB Private End point configuration
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

resource "azurerm_private_endpoint" "sql" {
  name                = "sql-private-endpoint"
  resource_group_name = module.rg.rg_name
  location            = module.rg.location
  subnet_id           = module.subnet.snet_id[1]

  private_service_connection {
    name                           = "sql-privateserviceconnection"
    private_connection_resource_id = azurerm_mssql_server.mssql.id
    subresource_names              = ["sqlServer"]
    is_manual_connection           = false
  }
}
