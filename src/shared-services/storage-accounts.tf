resource "azurerm_storage_account" "st" {
  name                     = "kaszebetfstates"
  resource_group_name      = azurerm_resource_group.rg-tfstates.name
  location                 = azurerm_resource_group.rg-tfstates.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = var.tags
}


resource "azurerm_storage_container" "st-container" {
  name                  = "tfstates"
  storage_account_name  = azurerm_storage_account.st.name
  container_access_type = "private"
}

resource "azurerm_storage_account" "st_function" {
  name                     = "kaszebefuncst2"
  resource_group_name      = azurerm_resource_group.rg-tfstates.name
  location                 = azurerm_resource_group.rg-tfstates.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = var.tags
}
