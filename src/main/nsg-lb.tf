resource "azurerm_network_security_group" "nsg-lb" {
  name                = "${var.project_prefix}-nsg-lb"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  security_rule {
    name                       = "AllowHTTPInbound"
    priority                   = 200
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
    description                = "Allow HTTP traffic"
  }

  security_rule {
    name                       = "AllowEstablishedInbound"
    priority                   = 300
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
    description                = "Allow established connections"
  }

  security_rule {
    name                       = "AllowLoopbackInbound"
    priority                   = 400
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "127.0.0.1"
    destination_address_prefix = "127.0.0.1"
    description                = "Allow loopback traffic"
  }

  security_rule {
    name                       = "DropAllInbound"
    priority                   = 500
    direction                  = "Inbound"
    access                     = "Deny"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
    description                = "Deny all other inbound traffic"
  }

  security_rule {
    name                       = "AllowDNSTCPOutbound"
    priority                   = 100
    direction                  = "Outbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "53"
    source_address_prefix      = "*"
    destination_address_prefix = "168.63.129.16"
    description                = "Allow DNS over TCP to Azure DNS"
  }

  security_rule {
    name                       = "AllowSpecificTCPOutbound"
    priority                   = 200
    direction                  = "Outbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "168.63.129.16"
    description                = "Allow traffic for owner UID 0"
  }

  security_rule {
    name                       = "DropInvalidNewOutbound"
    priority                   = 300
    direction                  = "Outbound"
    access                     = "Deny"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "168.63.129.16"
    description                = "Drop invalid and new connections"
  }

  security_rule {
    name                       = "AllowDNSServerOutbound"
    priority                   = 400
    direction                  = "Outbound"
    access                     = "Allow"
    protocol                   = "Udp"
    source_port_range          = "*"
    destination_port_range     = "53"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
    description                = "Allow DNS over UDP"
  }

  security_rule {
    name                       = "AllowHTTPOutbound"
    priority                   = 500
    direction                  = "Outbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
    description                = "Allow HTTP traffic"
  }

  security_rule {
    name                       = "AllowHTTPSOutbound"
    priority                   = 600
    direction                  = "Outbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "443"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
    description                = "Allow HTTPS traffic"
  }

  security_rule {
    name                       = "AllowEstablishedOutbound"
    priority                   = 700
    direction                  = "Outbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
    description                = "Allow established connections"
  }

  security_rule {
    name                       = "AllowLoopbackOutbound"
    priority                   = 800
    direction                  = "Outbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "127.0.0.1"
    destination_address_prefix = "127.0.0.1"
    description                = "Allow loopback traffic"
  }

  security_rule {
    name                       = "AllowHTTPToWeb1"
    priority                   = 900
    direction                  = "Outbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "10.0.0.4"
    description                = "Allow HTTP traffic to web1"
  }

  security_rule {
    name                       = "AllowHTTPToWeb2"
    priority                   = 1000
    direction                  = "Outbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "10.0.0.5"
    description                = "Allow HTTP traffic to web2"
  }

  security_rule {
    name                       = "DropAllOutbound"
    priority                   = 1100
    direction                  = "Outbound"
    access                     = "Deny"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
    description                = "Deny all other outbound traffic"
  }


  tags = var.tags
}
