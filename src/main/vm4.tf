# resource "azurerm_network_interface" "vm-nic-bind" {
#   name                = "vm-nic-bind"
#   location            = azurerm_resource_group.rg.location
#   resource_group_name = azurerm_resource_group.rg.name
#   ip_configuration {
#     name                          = "internal"
#     subnet_id                     = azurerm_subnet.subnet[2].id
#     private_ip_address_allocation = "Dynamic"
#   }
# }

# resource "azurerm_linux_virtual_machine" "vm-linux-bind" {
#   name                = "tf-vm-linux-bind"
#   resource_group_name = azurerm_resource_group.rg.name
#   location            = azurerm_resource_group.rg.location
#   size                = "Standard_B1s"
#   admin_username      = "adminuser"
#   network_interface_ids = [
#     azurerm_network_interface.vm-nic-bind.id
#   ]

#   admin_ssh_key {
#     username   = "adminuser"
#     public_key = file("files/id_rsa.pub")
#   }

#   os_disk {
#     caching              = "ReadWrite"
#     storage_account_type = "Standard_LRS"
#   }

#   source_image_reference {
#     publisher = "Canonical"
#     offer     = "0001-com-ubuntu-server-jammy"
#     sku       = "22_04-lts"
#     version   = "latest"
#   }
# }

# # # Standard_B2ats_v2
# # count.index <= 1?  0 : default = count.index
