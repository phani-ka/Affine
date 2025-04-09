resource "azurerm_storage_account" "sa1" {
  name                     = var.storageaccountname
  resource_group_name      = var.resourcegroupname
  location                 = var.resourcegrouplocation
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = local.comman_tag.env
    Name = "${local.comman_tag.env}-${var.storageaccountname}"
  }
  }



resource "azurerm_storage_container" "blob" {
  name                  = var.blobname
  storage_account_id   = azurerm_storage_account.sa1.id
  container_access_type = "container"
  #tags = {
  #  Name = var.blobname
  #}
}