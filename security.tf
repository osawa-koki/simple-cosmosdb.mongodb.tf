
resource "azurerm_network_security_group" "example" {
  name                = "${var.project_name}-nsg"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  security_rule {
    name                       = "AllowVNet"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "*"
    source_address_prefix      = var.allowed_ip_address
    source_port_range          = "*"
    destination_address_prefix = azurerm_cosmosdb_account.example.endpoint
    destination_port_range     = "*"
  }

  security_rule {
    name                       = "AllowOutbound"
    priority                   = 200
    direction                  = "Outbound"
    access                     = "Allow"
    protocol                   = "*"
    source_address_prefix      = "*"
    source_port_range          = "*"
    destination_address_prefix = "*"
    destination_port_range     = "*"
  }
}
