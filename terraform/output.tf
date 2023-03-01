
output "cosmosdb_connection_string" {
  value = "mongodb://${azurerm_cosmosdb_account.example.name}:${azurerm_cosmosdb_account.example.primary_key}@${azurerm_cosmosdb_account.example.name}.mongo.cosmos.azure.com:10255/?ssl=true&replicaSet=globaldb&retrywrites=false&maxIdleTimeMS=120000&appName=@${azurerm_cosmosdb_account.example.name}@"
  sensitive = true
}
