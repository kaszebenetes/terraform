# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs

module "vnet" {
  source              = "./modules/vnet"
  vnet_name           = "tf-vnet"
  address_space       = ["10.0.0.0/16"]
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

}
module "subnet" {
  count               = 3
  source              = "./modules/subnet"
  name                = "tf-vnet-subnet-${count.index}"
  vnet_name           = module.vnet.vnet_name
  resource_group_name = azurerm_resource_group.rg.name
  address_prefixes    = ["10.0.${count.index}.0/24"]

}

module "web_vm" {
  count  = 2
  source = "./modules/vm_linux"
  # Vm config --->
  vm_name             = "vm-linux-web${count.index + 1}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  # <---
  # NIC config --->
  nic_name           = "vm-nic-web${count.index}"
  ip_allocation      = "Static"
  private_ip_address = "10.0.0.${count.index + 4}"
  subnet_id          = module.subnet[0].id
  # <---
  # Extension config --->
  ext_name = "vm-linux-web${count.index}-sh"
  # <---
  # Bootdiagnostic--->
  boot_diagnostics_st_uri = azurerm_storage_account.diagstorage.primary_blob_endpoint
  # <---

}
module "web_lb" {
  source = "./modules/vm_linux"
  # Vm config --->
  vm_name             = "vm-linux-lb"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  vm_size             = "Standard_B2ats_v2"
  # <---
  # NIC config  --->
  nic_name           = "vm-nic-lb"
  ip_allocation      = "Static"
  private_ip_address = "10.0.1.4"
  subnet_id          = module.subnet[1].id
  # <---
  # PIP config  --->
  pip_enabled = true
  # <---
  # Bootdiagnostic--->
  boot_diagnostics_st_uri = azurerm_storage_account.diagstorage.primary_blob_endpoint
  # <---
  ext_name = "vm-linux-lb-sh"

}
module "bastion" {
  source              = "./modules/vm_linux"
  vm_name             = "vm-linux-bastion"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  vm_size             = "Standard_B1s"
  # NIC config  --->
  nic_name           = "vm-nic-bastion"
  ip_allocation      = "Static"
  private_ip_address = "10.0.2.4"
  subnet_id          = module.subnet[2].id
  # <---
  # PIP config  --->
  pip_enabled = true
  pip_name    = "tf-vm-nic-pip-bastion"
  # <---
  # Bootdiagnostic--->
  boot_diagnostics_st_uri = azurerm_storage_account.diagstorage.primary_blob_endpoint
  # <---
  ext_name = "vm-linux-bastion-sh"

}
