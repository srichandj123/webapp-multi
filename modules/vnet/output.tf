#VNET Name
output "vnet_name" {
  value = azurerm_virtual_network.vnet.name
}

#VNET ID
output "vnet_id" {
  value = azurerm_virtual_network.vnet.id

}
