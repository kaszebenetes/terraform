output "ip_address" {
  value = var.pip_enabled ? azurerm_public_ip.vm-pip[0].ip_address : null
}
output "network_interface_id" {
  value = azurerm_network_interface.vm-nic.id
}
