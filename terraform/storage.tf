resource "azurerm_storage_account" "application" {
  name                     = "stg${var.project_name}${terraform.workspace}"
  resource_group_name      = azurerm_resource_group.rg-main-application.name
  location                 = azurerm_resource_group.rg-main-application.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind = "StorageV2"

  tags = {
    environment = "staging"
  }
}

resource "azurerm_storage_account_static_website" "application-swebsite" {
  storage_account_id = azurerm_storage_account.application.id
  index_document = "index.html"
  error_404_document = "index.html"
}

output "storage_account_name" {
  value = azurerm_storage_account.application.name
}

output "static_website_url" {
  value = azurerm_storage_account.application.primary_web_endpoint
}