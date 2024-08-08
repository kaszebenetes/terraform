output "bastion_pip" {
  value = module.bastion.ip_address

}

output "lb_pip" {
  value = azurerm_public_ip.lb-pip.ip_address
}
