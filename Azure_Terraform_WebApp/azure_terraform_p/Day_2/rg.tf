resource "azurerm_resource_group" "rg" {
  #count    = 1
  #name     = "dev-${(count.index)}"
  name = "dev-nsg"
  location = "east us"
  lifecycle {
    create_before_destroy = true
  }
}