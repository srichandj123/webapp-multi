
# Create a key vault with access policies which allow for the current user to get, list, create, delete, update, recover, purge and getRotationPolicy for the key vault key and also add a key vault access policy for the Microsoft Sql Server instance User Managed Identity to get, wrap, and unwrap key(s)
resource "azurerm_key_vault" "kv" {
  name                        = "acme-prodkv01"
  location                    = module.rg.location
  resource_group_name         = module.rg.rg_name
  enabled_for_disk_encryption = true
  tenant_id                   = azurerm_user_assigned_identity.admin.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = true

  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = ["Get", "List", "Create", "Delete", "Update", "Recover", "Purge", "GetRotationPolicy"]
  }

  access_policy {
    tenant_id = azurerm_user_assigned_identity.admin.tenant_id
    object_id = azurerm_user_assigned_identity.admin.principal_id

    key_permissions = ["Get", "List", "Create", "WrapKey", "UnwrapKey"]
  }
}
data "azurerm_client_config" "current" {}

resource "azurerm_key_vault_key" "sqlkey" {
  depends_on   = [azurerm_key_vault.kv]
  name         = "sql-key"
  key_vault_id = azurerm_key_vault.kv.id
  key_type     = "RSA"
  key_size     = 2048
  key_opts     = ["unwrapKey", "wrapKey"]
}

data "azurerm_key_vault_secret" "uname" {
  name         = "sql-admin"
  key_vault_id = data.azurerm_key_vault.existing.id
}

data "azurerm_key_vault_secret" "pass" {
  name         = "sql-pass"
  key_vault_id = data.azurerm_key_vault.existing.id
}
