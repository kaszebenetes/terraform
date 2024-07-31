# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs

# Create a resource group
resource "azurerm_resource_group" "rg" {
  name     = "tf-test"
  location = "UK South"

  tags = {
    environment = "Production"
  }
}
module "vnet" {
  source              = "./modules/vnet"
  vnet_name           = "tf-vnet"
  address_space       = ["10.0.0.0/16"]
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

}
module "subnet" {
  count = 3
  source              = "./modules/subnet"
  name                = "tf-vnet-subnet-${count.index}"
  vnet_name           = module.vnet.vnet_name
  resource_group_name = azurerm_resource_group.rg.name
  address_prefixes    = ["10.0.${count.index}.0/24"]

}

module "web_vm" {
  count = 2
  source              = "./modules/web_vm"
  # Vm config --->
  vm_name             = "vm-linux_web${count.index}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  vm_size             = "Standard_B1s"
  # <---
  # NIC config --->
  type_of_nic         = "internal"
  nic_name            = "vm-nic-web${count.index}"
  ip_allocation       = "Static"
  private_ip_address  = "10.0.0.${count.index+3}"
  subnet_id           = module.subnet.azurerm_subnet.subnet[0].id
  # <---
  # Extension config --->
  ext_name            = "vm-linux-web${count.index}-sh"
  # <---

}
module "web_lb" {
  source              = "./modules/web_lb"
  # Vm config --->
  vm_name             = "vm-linux_lb"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  vm_size             = "Standard_B2ats_v2"
  # <---
  # NIC config  --->
  type_of_nic         = "internal"
  nic_name            = "vm-nic-lb"
  ip_allocation       = "Static"
  private_ip_address  = "10.0.1.4"
  subnet_id           = module.subnet.azurerm_subnet.subnet[1].id
  # <---
  # PIP config  --->
  pip_name            = "tf-vm-nic-pip-lb"
  allocation_method   = "Static"
  # <---

}
module "bastion" {
  source              = "./modules/bastion"
  vm_name             = "vm-linux_bastion"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  vm_size             = "Standard_B1s"
  # NIC config  --->
  type_of_nic         = "internal"
  nic_name            = "vm-nic-bastion"
  ip_allocation       = "Static"
  private_ip_address  = "10.0.2.4"
  subnet_id           = module.subnet.azurerm_subnet.subnet[2].id
  # <---
  # PIP config  --->
  pip_name            = "tf-vm-nic-pip-bastion"
  allocation_method   = "Static"
  # <---
}
resource "azurerm_storage_account" "diagstorage" {
  name                     = "bootdiagstoragekobeep"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = element(split("_", var.boot_diagnostics_sa_type), 0)
  account_replication_type = element(split("_", var.boot_diagnostics_sa_type), 1)
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
