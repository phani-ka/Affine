resource "azurerm_resource_group" "rg" {
    name = var.resourcegroup.name
    location = var.resourcegroup.location
  
}