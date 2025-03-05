# Create Resource Group
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

module "vnet" {
  source              = "./vnet"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
}

module "nsg" {
  source              = "./nsg"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
}

module "vm" {
  source                    = "./vm"
  resource_group_name       = azurerm_resource_group.rg.name
  location                  = azurerm_resource_group.rg.location
  vm_username               = var.vm_username
  vm_password               = var.vm_password
  subnet_id                 = module.vnet.subnet_id
  public_ip_address_id      = module.vnet.public_ip_address_id
  network_security_group_id = module.nsg.network_security_group_id
}