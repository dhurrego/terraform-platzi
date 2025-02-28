terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.21.0"
    }
  }
}

provider "azurerm" {
    features {}
    subscription_id = "648d3639-fe4f-4670-a2f3-d29c21f1a60d"
}

resource "azurerm_resource_group" "rg" {
  name = var.rg_storage
  location = "eastus"
}

resource "azurerm_storage_account" "storage_account" {
  name                     = "devstorageaccountplatzi"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
  public_network_access_enabled = false

  tags = {
    environment = "staging"
  }
}

output "conexion" {
    value = azurerm_storage_account.storage_account.primary_connection_string
    sensitive = true
}