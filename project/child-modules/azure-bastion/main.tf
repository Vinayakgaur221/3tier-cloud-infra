resource "azurerm_public_ip" "example" {
    for_each = var.test11
  name                = each.value.publicc_bastion_name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  allocation_method   = each.value.allocation_method_name
  sku                 = each.value.sku_namee

  
}



resource "azurerm_bastion_host" "example" {
    for_each = var.test11
  name                = each.value.bastion_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                 = "configuration"
    subnet_id            =  data.azurerm_subnet.bastionway[each.key].id
    public_ip_address_id = azurerm_public_ip.example[each.key].id
  }
}