resource "azurerm_public_ip" "vm-pip-lb" {
  name                = var.pip_name
  resource_group_name = var.resource_group_name
  location            = var.location
  allocation_method   = var.allocation_method

  tags = var.tags
}

resource "azurerm_network_interface" "vm-nic-lb" {
  name                = var.nic_name
  resource_group_name = var.resource_group_name
  location            = var.location
  ip_configuration {
    name                          = var.type_of_nic
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = var.ip_allocation
    private_ip_address            = var.private_ip_address
    public_ip_address_id          = azurerm_public_ip.vm-pip-lb.id
  }
}

resource "azurerm_linux_virtual_machine" "vm-linux-lb" {
  name                = var.vm_name
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = var.vm_size
  admin_username      = "adminuser"
  network_interface_ids = [
    azurerm_network_interface.vm-nic-lb.id
  ]

  admin_ssh_key {
    username   = "adminuser"
    public_key = file("files/id_rsa.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
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
}

resource "azurerm_virtual_machine_extension" "vm-linux-lb-sh" {
  name                 = "vm-linux-lb-sh"
  virtual_machine_id   = azurerm_linux_virtual_machine.vm-linux-lb.id
  publisher            = "Microsoft.Azure.Extensions"
  type                 = "CustomScript"
  type_handler_version = "2.0"

  protected_settings = <<PROT
    {
        "script": "${base64encode(file("files/user_add.sh"))}"
    }
    PROT


}

# # Standard_B2ats_v2
# count.index <= 1?  0 : default = count.index
