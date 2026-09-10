data "azurerm_private_dns_zone" "postgres" {
  for_each = var.test9
  name                = "privatelink.postgres.database.azure.com"
  resource_group_name = "rg-prott"
}

data "azurerm_virtual_network" "example" {
  for_each = var.test9
  name                = "prott-network"
  resource_group_name = "rg-prott"
}

data "azurerm_subnet" "postgres" {

  for_each = var.test9

  name                 = "prott2frontendsubnet"
  virtual_network_name = "prott-network"
  resource_group_name  = "rg-prott"
}