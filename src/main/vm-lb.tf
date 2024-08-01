resource "azurerm_public_ip" "vm-pip-lb" {
  name                = "tf-vm-nic-pip-lb"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  allocation_method   = "Static"

  tags = var.tags
}

resource "azurerm_network_interface" "vm-nic-lb" {
  name                = "vm-nic"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet[1].id
    public_ip_address_id          = azurerm_public_ip.vm-pip-lb.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "vm-linux-lb" {
  name                = "tf-vm-linux-lb"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  size                = "Standard_B2ats_v2"
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
    storage_account_uri = azurerm_storage_account.diagstorage.primary_blob_endpoint

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


  tags = var.tags
}

# # Standard_B2ats_v2
# count.index <= 1?  0 : default = count.index
