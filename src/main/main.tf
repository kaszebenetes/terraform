# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs
locals {
  subnets = {
    web_subnet = {
      name             = "web_subnet"
      address_prefixes = ["10.0.0.0/24"]
    }

    lb_subnet = {
      name             = "lb_subnet"
      address_prefixes = ["10.0.1.0/24"]
    }

    bastion_subnet = {
      name             = "bastion_subnet"
      address_prefixes = ["10.0.2.0/24"]
    }
  }
}
module "vnet" {
  source = "./modules/vnet"

  name                = "${var.project_prefix}-vnet"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  address_space       = ["10.0.0.0/16"]

  tags = var.tags
}

module "subnet" {
  source = "./modules/subnet"
  for_each = local.subnets

  name                = "${var.project_prefix}-${each.value["name"]}"
  resource_group_name = azurerm_resource_group.rg.name
  vnet_name           = module.vnet.vnet_name
  address_prefixes    = each.value["address_prefixes"]
  project_prefix      = var.project_prefix
  tags                = var.tags

}

module "web_vm" {
  source = "./modules/vm_linux"
  count  = 2

  # Vm config --->
  name                = "${var.project_prefix}-vm-linux-web${count.index + 1}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

  # NIC config --->
  private_ip_address = "10.0.0.${count.index + 4}"
<<<<<<< HEAD
  subnet_id          = module.subnet.web_subnet.id
=======
  subnet_id          = module.subnet[0].id
>>>>>>> c551f5b8652ccbd5803cdf48f7bb09d8e5def64c
  nsg_id             = azurerm_network_security_group.nsg-web.id

  # Bootdiagnostic--->
  boot_diagnostics_st_uri = azurerm_storage_account.diagstorage.primary_blob_endpoint

  tags = var.tags
}

# module "web_lb" {
#   source = "./modules/vm_linux"

#   # VM config --->
#   name                = "${var.project_prefix}-vm-linux-lb"
#   resource_group_name = azurerm_resource_group.rg.name
#   location            = azurerm_resource_group.rg.location
#   vm_size             = "Standard_B2ats_v2"

<<<<<<< HEAD
#   # NIC config  --->
#   private_ip_address = "10.0.1.4"
#   subnet_id          = module.subnet.lb_subnet.id
#   nsg_id             = azurerm_network_security_group.nsg-lb.id
#   # PIP config  --->
#   pip_enabled = true

#   # Bootdiagnostic--->
#   boot_diagnostics_st_uri = azurerm_storage_account.diagstorage.primary_blob_endpoint
=======
  # NIC config  --->
  private_ip_address = "10.0.1.4"
  subnet_id          = module.subnet[1].id
  nsg_id             = azurerm_network_security_group.nsg-lb.id
  # PIP config  --->
  pip_enabled = true
>>>>>>> c551f5b8652ccbd5803cdf48f7bb09d8e5def64c

#   tags = var.tags
# }

module "bastion" {
  source = "./modules/vm_linux"
  # VM config --->
  name                = "${var.project_prefix}-vm-linux-bastion"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

  # NIC config  --->
  private_ip_address = "10.0.2.4"
<<<<<<< HEAD
  subnet_id          = module.subnet.bastion_subnet.id
=======
  subnet_id          = module.subnet[2].id
>>>>>>> c551f5b8652ccbd5803cdf48f7bb09d8e5def64c
  nsg_id             = azurerm_network_security_group.nsg-bastion.id

  # PIP config  --->
  # pip_enabled = true

  # Bootdiagnostic--->
  boot_diagnostics_st_uri = azurerm_storage_account.diagstorage.primary_blob_endpoint

  tags = var.tags
}

resource "azurerm_subnet_network_security_group_association" "nsg_association_bastion" {
  subnet_id                 = module.subnet[2].id
  network_security_group_id = azurerm_network_security_group.nsg-bastion.id
}
resource "azurerm_subnet_network_security_group_association" "nsg_association_lb" {
  subnet_id                 = module.subnet[1].id
  network_security_group_id = azurerm_network_security_group.nsg-lb.id
}
resource "azurerm_subnet_network_security_group_association" "nsg_association_web" {
  subnet_id                 = module.subnet[0].id
  network_security_group_id = azurerm_network_security_group.nsg-web.id
}
