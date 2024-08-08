locals {
  ext_name = var.ext_name != null ? var.ext_name : "${var.name}-ext-sh"
  nic_name = var.nic_name != null ? var.nic_name : "${var.name}-nic"
  pip_name = var.pip_name != null ? var.pip_name : "${var.name}-nic-pip"
}

resource "azurerm_linux_virtual_machine" "vm-linux" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = var.vm_size
  admin_username      = "adminuser"
  zone = "1"

  network_interface_ids = [
    azurerm_network_interface.vm-nic.id
  ]

  admin_ssh_key {
    username   = "adminuser"
    public_key = file("files/id_rsa.pub")
  }


  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    disk_size_gb         = var.os_disk_size
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

  boot_diagnostics {
    storage_account_uri = var.boot_diagnostics_st_uri

  }

  tags = var.tags
}

resource "azurerm_public_ip" "vm-pip" {
  count               = var.pip_enabled ? 1 : 0
  name                = local.pip_name
  resource_group_name = var.resource_group_name
  location            = var.location
  allocation_method   = var.allocation_method

  tags = var.tags
}

resource "azurerm_network_interface" "vm-nic" {
  name                = local.nic_name
  resource_group_name = var.resource_group_name
  location            = var.location

  ip_configuration {
    name                          = var.type_of_nic
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = var.ip_allocation
    private_ip_address            = var.private_ip_address
    public_ip_address_id          = var.pip_enabled ? azurerm_public_ip.vm-pip[0].id : null
  }

  tags = var.tags
}

resource "azurerm_virtual_machine_extension" "vm-linux-sh" {
  name                 = local.ext_name
  virtual_machine_id   = azurerm_linux_virtual_machine.vm-linux.id
  publisher            = "Microsoft.Azure.Extensions"
  type                 = "CustomScript"
  type_handler_version = "2.0"

  protected_settings = <<PROT
    {
        "script": "${base64encode(file("files/user_add.sh"))}"
    }
    PROT

  tags = var.tags
}

# # Standard_B2ats_v2
# count.index <= 1?  0 : default = count.index
