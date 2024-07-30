# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs

# Create a resource group
resource "azurerm_resource_group" "rg" {
  name     = "tf-test"
  location = "UK South"

  tags = {
    environment = "Production"
  }
}
resource "azurerm_storage_account" "diagstorage" {
  name                     = "bootdiagstoragekobeep"
  resource_group_name      = "${azurerm_resource_group.rg.name}"
  location                 = "${azurerm_resource_group.rg.location}"
  account_tier             = "${element(split("_", var.boot_diagnostics_sa_type),0)}"
  account_replication_type = "${element(split("_", var.boot_diagnostics_sa_type),1)}"
}

resource "azurerm_storage_container" "diag" {
  name                  = "content"
  storage_account_name  = azurerm_storage_account.diagstorage.name
  container_access_type = "private"
}

resource "azurerm_storage_blob" "diag_blob" {
  name                   = "bootdiagnostic"
  storage_account_name   = azurerm_storage_account.diagstorage.name
  storage_container_name = azurerm_storage_container.diag.name
  type                   = "Block"
}
