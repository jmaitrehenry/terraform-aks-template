resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.aks_name
  location            = azurerm_resource_group.rg_aks.location
  resource_group_name = azurerm_resource_group.rg_aks.name
  dns_prefix          = var.aks_name

  default_node_pool {
    name       = var.aks_default_node_pool_name
    node_count = var.aks_default_node_pool_size
    vm_size    = var.aks_default_node_pool_vm_size
  }

  identity {
    type = "SystemAssigned"
  }

  depends_on = [
    azurerm_container_registry.acr
  ]
}

# resource "azurerm_kubernetes_cluster_node_pool" "production" {
#   name                  = "internal"
#   kubernetes_cluster_id = azurerm_kubernetes_cluster.aks.id
#   vm_size               = "Standard_DS2_v2"
#   node_count            = 1

#   tags = {
#     Environment = "Production"
#   }
# }

# Add AKS permission to pull image from the container registry
resource "azurerm_role_assignment" "aks" {
  principal_id                     = azurerm_kubernetes_cluster.aks.kubelet_identity[0].object_id
  role_definition_name             = "AcrPull"
  scope                            = azurerm_container_registry.acr.id
  skip_service_principal_aad_check = true
}
