terraform {
  backend "azurerm" {
    storage_account_name = "terraformst"
    container_name       = "states"
    key                  = "estados.tfstate"
  }
}