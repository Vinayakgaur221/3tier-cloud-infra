resource "azurerm_private_dns_zone_virtual_network_link" "example" {

  for_each = var.test9

  name                  = "${each.value.server_name}-dns-link"
  private_dns_zone_id = data.azurerm_private_dns_zone.postgres[each.key].id
  virtual_network_id = data.azurerm_virtual_network.example[each.key].id
  registration_enabled = false
}



resource "azurerm_postgresql_flexible_server" "exdat" {
  for_each = var.test9
  name                          = each.value.server_name 
  resource_group_name           = each.value.resource_group_name
  location                      = each.value.location
  version                       = each.value.version
  delegated_subnet_id = data.azurerm_subnet.postgres[each.key].id
  private_dns_zone_id = data.azurerm_private_dns_zone.postgres[each.key].id
  public_network_access_enabled = false
  administrator_login           = each.value.administrator_login
  administrator_password        = each.value.administrator_password

  zone                          = each.value.zone
  storage_mb   = each.value.storage_mb
  storage_tier = each.value.storage_tier

  sku_name   = each.value.sku_name
  depends_on = [azurerm_private_dns_zone_virtual_network_link.example]

}

resource "azurerm_postgresql_flexible_server_database" "appdb" {
  for_each  = var.test9
  name      = each.value.database_name
  server_id = azurerm_postgresql_flexible_server.exdat[each.key].id

  charset   = "UTF8"
  collation = "en_US.utf8"
}