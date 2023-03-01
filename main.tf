
provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "${var.project_name}-resources"
  location = "japaneast"
}
