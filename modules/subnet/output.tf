# Subnet Ids
output "snet_id" {
  value       = azurerm_subnet.snet[*].id
  description = "The id of Subnets"
}

