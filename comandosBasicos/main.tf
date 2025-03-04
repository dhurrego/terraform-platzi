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

resource "azurerm_resource_group" "rg" {
  name     = var.rg_nombre
  location = "eastus"
}
