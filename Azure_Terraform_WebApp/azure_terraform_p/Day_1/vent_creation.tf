resource "azurerm_virtual_network" "vnet" {
   name    = ${var.env}-vnet
   location = var.rglocation
   resource_group_name = var.rgname
   address_space = ["192.168.0.0/16"]
    
}

resource "azurerm_subnet" "pubsubnet" {
  name = "pubsubnet"
  resource_group_name = var.rgname  
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes = ["192.168.0.0/24"]
}

resource "azurerm_subnet" "privatesubnet" {
  name = "privatesubnet"
  resource_group_name = var.rgname  
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes = ["192.168.0.0/24"]
}