# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs

module "vnet" {
  source              = "./modules/vnet"
  vnet_name           = "${var.project_prefix}-vnet"
  address_space       = ["10.0.0.0/16"]
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

}
module "subnet" {
  count               = 3
  source              = "./modules/subnet"
  name                = "${var.project_prefix}-vnet-subnet-${count.index}"
  vnet_name           = module.vnet.vnet_name
  resource_group_name = azurerm_resource_group.rg.name
  address_prefixes    = ["10.0.${count.index}.0/24"]

}

module "web_vm" {
  count  = 2
  source = "./modules/vm_linux"
  # Vm config --->
  vm_name             = "${var.project_prefix}-vm-linux-web${count.index + 1}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  # NIC config --->
  private_ip_address = "10.0.0.${count.index + 4}"
  subnet_id          = module.subnet[0].id
  # Bootdiagnostic--->
  boot_diagnostics_st_uri = azurerm_storage_account.diagstorage.primary_blob_endpoint

}
module "web_lb" {
  source = "./modules/vm_linux"
  # Vm config --->
  vm_name             = "${var.project_prefix}-vm-linux-lb"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  vm_size             = "Standard_B2ats_v2"
  # NIC config  --->
  private_ip_address = "10.0.1.4"
  subnet_id          = module.subnet[1].id
  # PIP config  --->
  pip_enabled = true
  # Bootdiagnostic--->
  boot_diagnostics_st_uri = azurerm_storage_account.diagstorage.primary_blob_endpoint


}

module "bastion" {
  source              = "./modules/vm_linux"
  vm_name             = "${var.project_prefix}-vm-linux-bastion"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  vm_size             = "Standard_B1s"
  # NIC config  --->
  private_ip_address = "10.0.2.4"
  subnet_id          = module.subnet[2].id
  # PIP config  --->
  pip_enabled = true
  # Bootdiagnostic--->
  boot_diagnostics_st_uri = azurerm_storage_account.diagstorage.primary_blob_endpoint

}
