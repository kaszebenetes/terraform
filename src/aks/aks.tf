# 750 hours each of B1s, B2pts v2 (Arm-based), and B2ats v2 (AMD-based) burstable VMs
# Standard_B2ats_v2
# Standard_B1s
# 4GB Standard_B2als_v2

resource "azurerm_kubernetes_cluster" "aks" {
  name                = "${var.project_prefix}-aks"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "kaszebe-aks"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_B2als_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = var.tags
}
