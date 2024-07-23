# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs

# Create a resource group
resource "azurerm_resource_group" "rg" {
  name     = "tf-test"
  location = "UK South"

  tags = {
    environment = "Production"
  }
}
