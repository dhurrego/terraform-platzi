resource "azurecaf_name" "resource_group_name" {
  name = "test"
  resource_type = "azurerm_resource_group"
  prefixes = ["rg"]
  suffixes = ["y", "z"]
  random_length = 3
  clean_input = true
}

resource "azurerm_resource_group" "rg" {
  name = azurecaf_name.resource_group_name.result
  location = "eastus"
}

resource "azurecaf_name" "storage_name" {
  name = "test"
  resource_type = "azurerm_storage_account"
  prefixes = ["st"]
  random_length = 3
  clean_input = true
}

resource "azurerm_storage_account" "storage_account" {
  name                     = azurecaf_name.storage_name.result
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
  public_network_access_enabled = false

  tags = {
    environment = "staging"
  }
}