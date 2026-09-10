resource "azurerm_subnet" "sbxx" {
    for_each = var.test3
  name                 = each.value.sub_name
  resource_group_name  = each.value.resource_group_name
  virtual_network_name = each.value.virtual_network_name
  address_prefixes     = each.value.address_prefixes
} 
