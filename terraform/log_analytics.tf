resource "azurerm_log_analytics_workspace" "application" {
  name                = "log-${var.project_name}-${terraform.workspace}"
  resource_group_name = azurerm_resource_group.rg-main-application.name
  location            = azurerm_resource_group.rg-main-application.location
  sku                 = "PerGB2018"
  retention_in_days   = 30
}

resource "azurerm_monitor_diagnostic_setting" "storage_logs" {
  name                       = "diag-${var.project_name}-${terraform.workspace}"
  target_resource_id         = "${azurerm_storage_account.application.id}/blobServices/default/"
  log_analytics_workspace_id = azurerm_log_analytics_workspace.application.id

  enabled_log {
    category = "StorageRead"
  }

  enabled_log {
    category = "StorageWrite"
  }

  enabled_log {
    category = "StorageDelete"
  }

  metric {
    category = "Transaction"
  }
}