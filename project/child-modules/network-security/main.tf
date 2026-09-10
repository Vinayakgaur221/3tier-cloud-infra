resource "azurerm_network_security_group" "exnsg" {
  for_each = var.test4
  name                = each.value.network_security_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  security_rule {
    name                       = "${each.value.network_security_name}-rule"  
     priority                   = each.value.priority
    direction                  = each.value.direction
    access                     = each.value.access
    protocol                   = each.value.protocol
    source_port_range          = each.value.source_port_range
    destination_port_range     = each.value.destination_port_range
    source_address_prefix      = each.value.source_address_prefix
    destination_address_prefix = each.value.destination_address_prefix
  }


}