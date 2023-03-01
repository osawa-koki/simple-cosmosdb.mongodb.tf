
output "cosmosdb_connection_string" {
  value = "mongodb://${azurerm_cosmosdb_account.example.name}.mongo.cosmos.azure.com:${azurerm_cosmosdb_account.example.primary_key}@${azurerm_cosmosdb_account.example.name}:10255/?ssl=true&retrywrites=false&replicaSet=globaldb&maxIdleTimeMS=120000&appName=@${azurerm_cosmosdb_account.example.name}@"
  sensitive = true
}
