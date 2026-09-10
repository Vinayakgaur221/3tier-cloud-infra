resource "azurerm_virtual_network" "exvn" {
  for_each            = var.test2
  name                = each.value.vnet_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  address_space       = each.value.address_space
}



 
