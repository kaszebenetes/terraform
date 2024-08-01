output "bastion_pip" {
  value = module.bastion.ip_address

}

output "lb_pip" {
  value = module.web_lb.ip_address
}
