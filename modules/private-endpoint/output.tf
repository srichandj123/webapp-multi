# Private Endpoint DNS Configuration
output "pe_dns" {
  value       = azurerm_private_endpoint.pe.private_dns_zone_configs
  description = "DNS Zone Configuration of private Endpoint"
}

# A network_interface block.
output "pe_network_interface" {
  value = azurerm_private_endpoint.pe.network_interface
}

# A custom_dns_configs block.
output "pe_custom_dns_configs" {
  value = azurerm_private_endpoint.pe.custom_dns_configs
}

# A ip_configuration block.
output "pe_ip_configuration" {
  value = azurerm_private_endpoint.pe.ip_configuration
}
