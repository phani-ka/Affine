resource "azurerm_network_security_group" "nsg" {
  name                = "Backendnsg-vnet-subnet"
  location            = azurerm_resource_group.az_rg.location
  resource_group_name = azurerm_resource_group.az_rg.name
}

resource "azurerm_virtual_network" "vnet" {
  name                = "frontend-network"
  location            = azurerm_resource_group.az_rg.location
  resource_group_name = azurerm_resource_group.az_rg.name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]

  subnet {
    name             = "pubsubnet"
    address_prefixes = ["10.0.1.0/24"]
  }

  subnet {
    name             = "pvtsubnet"
    address_prefixes = ["10.0.2.0/24"]
    security_group   = azurerm_network_security_group.nsg-vnet-subnet.id
  }

  tags = {
    environment = "Dev"
  }
}