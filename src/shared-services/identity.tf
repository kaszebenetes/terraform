resource "azurerm_user_assigned_identity" "uai" {
  name                = "test-uai"
  resource_group_name = azurerm_resource_group.rg-tfstates.name
  location            = azurerm_resource_group.rg-tfstates.location
}

data "azurerm_subscription" "current" {}


data "azurerm_role_definition" "contributor" {
  name = "Contributor"
}

resource "azurerm_role_assignment" "example" {
  scope              = data.azurerm_subscription.current.id
  role_definition_id = "${data.azurerm_subscription.current.id}${data.azurerm_role_definition.contributor.id}"
  principal_id       = azurerm_user_assigned_identity.uai.principal_id
}
