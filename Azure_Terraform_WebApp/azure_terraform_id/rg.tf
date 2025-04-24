resource "azurerm_resource_group" "rg" {
  name     = "${var.env}-sg"
  location = var.location
}

resource "azurerm_resource_group" "rg1" {
  name     = "${var.env}-rg"
  location = var.location
}