output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

# output "client_certificate" {
#   value     = azurerm_kubernetes_cluster.clu.kube_config[0].client_certificate
#   sensitive = true
# }

output "kube_config" {
  value = azurerm_kubernetes_cluster.devclu.kube_config_raw

  sensitive = true
}