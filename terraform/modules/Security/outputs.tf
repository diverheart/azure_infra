output "ng_id" {
  value = azurerm_network_security_group.azure_ng_env.id
}

output "rg_name"{
  value = azurerm_resource_group.azure_rg_env.name
}