
resource "azurerm_mssql_server" "mssql" {
  name                         = "prod-sqlserver"
  resource_group_name          = module.rg.rg_name
  location                     = module.rg.location
  version                      = "12.0"
  administrator_login          = "4dm1n157r470r"
  administrator_login_password = "4-v3ry-53cr37-p455w0rd"
}

resource "azurerm_mssql_database" "mssqldb" {
  name           = "prod-db"
  server_id      = azurerm_mssql_server.mssql.id
  collation      = "SQL_Latin1_General_CP1_CI_AS"
  license_type   = "LicenseIncluded"
  max_size_gb    = 100
  read_scale     = true
  sku_name       = "P2"
  zone_redundant = true
  tags           = module.rg.tags
  identity {
    type         = "UserAssigned"
    identity_ids = [azurerm_user_assigned_identity.admin.id]
  }

  transparent_data_encryption_key_vault_key_id = azurerm_key_vault_key.sqlkey.id

  # prevent the possibility of accidental data loss
  lifecycle {
    prevent_destroy = true
  }
}
