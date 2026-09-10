variable "test4" {
    type = map(object({
    network_security_name       = string
    resource_group_name         = string
    location                    = string
    priority                    = number
    direction                   = string
    access                      = string
    protocol                    = string
    source_port_range           = string
    destination_port_range      = string
    source_address_prefix       = string
    destination_address_prefix  = string
  }))
}