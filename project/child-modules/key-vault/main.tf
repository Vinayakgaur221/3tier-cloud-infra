data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "exkeyvault" {
  for_each = var.test7
  name                       = each.value.key_vault_name
  location                   = each.value.location
  resource_group_name        = each.value.resource_group_name
  rbac_authorization_enabled = false
  tenant_id                  = data.azurerm_client_config.current.tenant_id
  sku_name                   = each.value.sku_name
  soft_delete_retention_days = each.value.soft_delete_retention_days

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Create",
      "Get",            
    ]

    secret_permissions = [
      "Set",
      "Get",
      "Delete",
      "Purge",
      "Recover"
    ]
  }
} 

resource "azurerm_key_vault_secret" "vm_admin_username" {
  for_each = var.test7
  name         = "vm-admin-username"
  value        = each.value.vm_admin_username
  key_vault_id = azurerm_key_vault.exkeyvault[each.key].id
}
resource "azurerm_key_vault_secret" "vm_admin_password" {
  for_each = var.test7
  name         = "vm-admin-password"
  value        = each.value.vm_admin_password
  key_vault_id = azurerm_key_vault.exkeyvault[each.key].id
}
resource "azurerm_key_vault_secret" "db_admin_username" {
  for_each = var.test7
  name         = "db-admin-username"
  value        = each.value.db_admin_username
  key_vault_id = azurerm_key_vault.exkeyvault[each.key].id
}
resource "azurerm_key_vault_secret" "db_admin_password" {
  for_each = var.test7
  name         =  "db-admin-password"
  value        = each.value.db_admin_password
  key_vault_id = azurerm_key_vault.exkeyvault[each.key].id
}
