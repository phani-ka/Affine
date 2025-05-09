resource "azurerm_network_security_group" "nsg" {
  name                = (var.env == "dev" ? "dev-nsg" : "prod-ng")
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  dynamic "security_rule" {
    for_each = var.ports
    content {
      name                       = security_rule.value.name
      priority                   = security_rule.value.priority
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = security_rule.value.port
      destination_port_range     = security_rule.value.port
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }

  }
  tags = {
    name        = "${var.env}-nsg"
    environment = var.env
  }

}