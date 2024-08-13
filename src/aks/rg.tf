# Create a resource group
resource "azurerm_resource_group" "rg" {
  name     = "${var.project_prefix}-rg"
  location = var.region

  tags = var.tags
}
