
data "azurerm_storage_account" "asa" {
  name                = "phaniazure"
  resource_group_name = var.resourcegroup
}


resource "azurerm_storage_container" "azureblob" {
  name                  = "content"
  storage_account_id    = data.azurerm_storage_account.asa.id
  container_access_type = "container"
}


resource "azurerm_storage_share" "fileshare" {
  name               = "fileshare"
  storage_account_id = data.azurerm_storage_account.asa.id
  quota              = 50

}