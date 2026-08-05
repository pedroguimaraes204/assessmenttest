resource "azurerm_resource_group" "rg-main-application" {
  name     = "rg-${var.project_name}-${terraform.workspace}"
  location = var.azure_location
}