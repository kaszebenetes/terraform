output "bastion_pip" {
  value = azurerm_public_ip.vm-pip-bastion.ip_address
}

output "lb_pip" {
  value = azurerm_public_ip.vm-pip-lb.ip_address
}
