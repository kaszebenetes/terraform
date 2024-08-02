resource "azurerm_user_assigned_identity" "uai" {
  name                = "test-uai"
  resource_group_name = azurerm_resource_group.rg-tfstates.name
  location            = azurerm_resource_group.rg-tfstates.location
}
