
locals {
  backend_pools = {
    web_pool = {
      name       = "web-backend-pool"
      protocol   = "Tcp"
      port       = 80
      probe_name = "web-probe"
      ip_address = ["10.0.0.4", "10.0.0.5"]
    }
    bastion_pool = {
      name       = "bastion-backend-pool"
      protocol   = "Tcp"
      port       = 22
      probe_name = "bastion-probe"
    }
  }
}

resource "azurerm_public_ip" "lb-pip" {
  name                = "${var.project_prefix}-lb-pip"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Static"
  sku                 = "Standard"
  zones               = ["1"]
}

resource "azurerm_lb" "lb" {
  name                = "lb"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku                 = "Standard"


  frontend_ip_configuration {
    name                 = "primary"
    public_ip_address_id = azurerm_public_ip.lb-pip.id
  }
}

resource "azurerm_network_interface" "nic" {
  name                = "${var.project_prefix}-lb-nic"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "config"
    subnet_id                     = module.subnet.lb_subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}

# Backend Pools
resource "azurerm_lb_backend_address_pool" "backend_pool" {
  for_each        = local.backend_pools
  loadbalancer_id = azurerm_lb.lb.id
  name            = each.value["name"]
}

# Health Probes
resource "azurerm_lb_probe" "probe" {
  for_each        = local.backend_pools
  loadbalancer_id = azurerm_lb.lb.id
  name            = each.value["probe_name"]
  port            = each.value["port"]
  protocol        = each.value["protocol"]
}

# Load Balancing Rules
resource "azurerm_lb_rule" "lb-rule" {
  for_each                 = local.backend_pools
  loadbalancer_id          = azurerm_lb.lb.id
  name                     = "${each.value["name"]}-rule"
  protocol                 = "Tcp"
  frontend_port            = each.value["port"]
  backend_port             = each.value["port"]
  backend_address_pool_ids = [azurerm_lb_backend_address_pool.backend_pool[each.key].id]
  probe_id                 = azurerm_lb_probe.probe[each.key].id

  frontend_ip_configuration_name = "primary"
}

resource "azurerm_network_interface_backend_address_pool_association" "web_servers" {
  count                   = 2
  network_interface_id    = module.web_vm[count.index].network_interface_id
  ip_configuration_name   = "internal"
  backend_address_pool_id = azurerm_lb_backend_address_pool.backend_pool["web_pool"].id
}

resource "azurerm_network_interface_backend_address_pool_association" "bastion" {
  network_interface_id    = module.bastion.network_interface_id
  ip_configuration_name   = "internal"
  backend_address_pool_id = azurerm_lb_backend_address_pool.backend_pool["bastion_pool"].id
}
