resource "azurerm_application_insights" "appinsights" {
  name                = "${var.product}-${var.env}"
  location            = var.appinsights_location
  resource_group_name = azurerm_resource_group.rg.name
  application_type    = var.application_type

  lifecycle {
    ignore_changes = [
      application_type,
    ]
  }
}

output "appInsightsInstrumentationKey" {
  sensitive = true
  value = azurerm_application_insights.appinsights.instrumentation_key
}

resource "azurerm_key_vault_secret" "app_insights_connection_string" {
  name         = "app-insights-connection-string"
  value        = azurerm_application_insights.appinsights.connection_string
  key_vault_id = module.finrem-vault.key_vault_id
}