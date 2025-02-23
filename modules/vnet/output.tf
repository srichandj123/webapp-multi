#Resourcegroup 
output "rg_name" {
  value       = azurerm_resource_group.rg.name
  description = "Name of the resource group"
}

#Resource Group location
output "location" {
  value       = azurerm_resource_group.rg.location
  description = "location of the resource group"
}

#Resourcegroup Tags
output "tags" {
  value       = azurerm_resource_group.rg.tags
  description = "location of the resource group"
}

#Resourcegroup ID
output "rg_id" {
  value       = azurerm_resource_group.rg.id
  description = "location of the resource group"
}

