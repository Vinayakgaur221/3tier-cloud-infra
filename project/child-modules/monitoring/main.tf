resource "azurerm_log_analytics_workspace" "loganalyt" {
  for_each = var.test8
  name                = each.value.workspace_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  sku                 = each.value.sku
  retention_in_days   = each.value.retention_in_days
}



resource "azurerm_monitor_diagnostic_setting" "appgw" {
  for_each = var.test8
  name                       = each.value.diagnostic_setting_name
  target_resource_id         = data.azurerm_application_gateway.appgw[each.key].id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.loganalyt[each.key].id

  enabled_log {
    category = "ApplicationGatewayAccessLog"
  }

  enabled_log {
    category = "ApplicationGatewayPerformanceLog"
  }

  enabled_metric {
    category = "AllMetrics"
  }
} 

