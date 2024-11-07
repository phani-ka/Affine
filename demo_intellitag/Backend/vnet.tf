resource "azurerm_network_security_group" "nsgbackend" {
  name                = "backendnsg-vnet-subnet"
  location            = azurerm_resource_group.az_rg.location
  resource_group_name = azurerm_resource_group.az_rg.name
}

resource "azurerm_virtual_network" "vnetbackend" {
  name                = "backend-network"
  location            = azurerm_resource_group.az_rg.location
  resource_group_name = azurerm_resource_group.az_rg.name
  address_space       = ["10.0.2.0/16"]
  dns_servers         = ["10.0.2.4", "10.0.2.5"]

  subnet {
    name             = "pubsubnetbackend"
    address_prefixes = ["10.0.3.0/24"]
    security_group   = azurerm_network_security_group.Backendnsg.id
    service_endpoints = ["Microsoft.storage"]
  }

  subnet {
    name             = "pvtsubnetbackend"
    address_prefixes = ["10.0.4.0/24"]
    
  }

  tags = {
    environment = "Dev"
  }
}