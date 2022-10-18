data "azurerm_kubernetes_cluster" "credentials" {
  name                = azurerm_kubernetes_cluster.aks.name
  resource_group_name = azurerm_resource_group.rg_aks.name
}
