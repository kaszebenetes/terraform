# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs
# https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/ready/azure-best-practices/resource-naming
# https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/ready/azure-best-practices/resource-abbreviations

resource "azurerm_resource_group" "rg-tfstates" {
  name     = "terraform-tfstates"
  location = var.region

  tags = var.tags
}
