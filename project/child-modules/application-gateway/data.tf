data "azurerm_subnet" "appgateway" {
  for_each = var.test10

  name                 = "prott3backendsubnet"
  virtual_network_name = "prott-network"
  resource_group_name  = "rg-prott"
}

data "azurerm_public_ip" "appgateway" {
  for_each = var.test10

  name                = "appgateway-pip"
  resource_group_name = "rg-prott"
}