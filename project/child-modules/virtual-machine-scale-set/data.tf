data "azurerm_subnet" "vmss_subnet" {
    for_each = var.test6
  name                 = "prott1databasesubnet"
  virtual_network_name = "prott-network"
  resource_group_name  = "rg-prott"
}