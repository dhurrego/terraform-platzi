terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.21.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "648d3639-fe4f-4670-a2f3-d29c21f1a60d"
}

import {
  to = azurerm_storage_account.mi_cuenta
  id = "/subscriptions/648d3639-fe4f-4670-a2f3-d29c21f1a60d/resourceGroups/logs-group/providers/Microsoft.Storage/storageAccounts/salogsstorageaccount"
}

import {
  to = azurerm_resource_group.rg
  id = "/subscriptions/648d3639-fe4f-4670-a2f3-d29c21f1a60d/resourceGroups/logs-group"
}

resource "azurerm_resource_group" "rg" {
  name     = "logs-group"
  location = "eastus"  
}

resource "azurerm_storage_account" "mi_cuenta" {
  name                     = "salogsstorageaccount"
  resource_group_name      = "logs-group"
  location                 = "eastus"
  account_tier             = "Standard"
  account_replication_type = "LRS"
  
}