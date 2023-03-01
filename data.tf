
resource "azurerm_cosmosdb_account" "example" {
  name                = "${var.project_name}-cosmosdb"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  offer_type          = "Standard"
  kind                = "GlobalDocumentDB"
  enable_automatic_failover = false
  
  consistency_policy {
    consistency_level = "Session"
  }

  capabilities {
    name = "EnableTable"
  }

  virtual_network_rule {
    id                            = azurerm_subnet.example.id
    ignore_missing_vnet_service_endpoint = true
  }
}
