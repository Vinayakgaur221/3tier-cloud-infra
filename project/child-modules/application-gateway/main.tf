resource "azurerm_public_ip" "appgateway" {
  for_each = var.test10
  name                = each.value.public_ip_name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  allocation_method   = each.value.allocation_method
  sku                 = each.value.sku_name1

  
}




resource "azurerm_application_gateway" "exnetwork" {
    for_each = var.test10
  name                = each.value.application_gateway_name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location

  sku {
    name     = each.value.sku_name
    tier     = each.value.sku_tier
    capacity = each.value.capacity
  }

  gateway_ip_configuration {
    name      = each.value.gateway_ip_configuration_name
    subnet_id = data.azurerm_subnet.appgateway[each.key].id
  }

  frontend_port {
    name = each.value.frontend_port_name
    port = each.value.frontend_port
  }

  frontend_ip_configuration {
    name                 = each.value.frontend_ip_configuration_name
    public_ip_address_id = data.azurerm_public_ip.appgateway[each.key].id
  }

  backend_address_pool {
    name = each.value.backend_address_pool_name
  }

  backend_http_settings {
    name                  = each.value.http_setting_name
    cookie_based_affinity = "Disabled"
    path                  = each.value.backend_path
    port                  = 80
    protocol              = "Http"
    request_timeout       = 60
  }

  http_listener {
    name                           = each.value.listener_name
    frontend_ip_configuration_name = each.value.frontend_ip_configuration_name
    frontend_port_name             = each.value.frontend_port_name
    protocol                       = "Http"
  }

  request_routing_rule {
    name                       = each.value.request_routing_rule_name
    priority                   = each.value.priority    
    rule_type                  = "Basic"
    http_listener_name         = each.value.listener_name
    backend_address_pool_name  = each.value.backend_address_pool_name
    backend_http_settings_name = each.value.http_setting_name
  }
}