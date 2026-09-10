resource "azurerm_resource_group" "exrg" {
  for_each = var.test1
  name     = each.value.name
  location = each.value.location
}