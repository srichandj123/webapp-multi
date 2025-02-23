data "azurerm_network_interface" "pe_nic" {
  name                = azurerm_private_endpoint.privateendpoint.network_interface[0].name
  resource_group_name = module.rg.rg_name
}

resource "azurerm_network_security_group" "sql_nsg" {
  name                = "sql-nsg"
  location            = module.rg.location
  resource_group_name = module.rg.rg_name

  security_rule {
    name                       = "AllowWebSubnet"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "1433"
    source_address_prefix      = data.azurerm_network_interface.pe_nic.private_ip_address.value
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "DenyAllInbound"
    priority                   = 200
    direction                  = "Inbound"
    access                     = "Deny"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_subnet_network_security_group_association" "sql_subnet_association" {
  subnet_id                 = module.subnet.snet_id[1]
  network_security_group_id = azurerm_network_security_group.sql_nsg.id
}
