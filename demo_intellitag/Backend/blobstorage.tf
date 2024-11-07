resource "azurerm_storage_account" "sa" {
  name                     = "imagestorage"
  resource_group_name      = azurerm_resource_group.az_rg.name
  location                 = azurerm_resource_group.az_rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind = "BlobStorage"
}

resource "azurerm_storage_container" "scontainer" {
  name                  = "content"
  storage_account_name  = azurerm_storage_account.sa.name
  container_access_type = "private"
}


resource "azurerm_storage_account_network_rules" "sanr" {
  storage_account_id         = azurerm_storage_account.sa.id

  default_action             = "Allow"
  ip_rules                   = ["127.0.0.1"]
  virtual_network_subnet_ids = [azurerm_virtual_network.vnetbackend.subnet[0].id]
  bypass                     = ["Metrics"]
}