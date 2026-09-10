data "azurerm_subnet" "bastionway" {
  for_each = var.test11

  name                 = "azurebastionsubnet"
  virtual_network_name = "prott-network"
  resource_group_name  = "rg-prott"
}

data "azurerm_public_ip" "bastionway" {
  for_each = var.test11

  name                = "bastion-3tier-app"
  resource_group_name = "rg-prott"
}