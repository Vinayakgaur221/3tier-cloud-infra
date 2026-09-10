data "azurerm_application_gateway" "appgw" {
    for_each = var.test8
  name                = "appgw-3tier-app"
  resource_group_name = "rg-prott"
}



