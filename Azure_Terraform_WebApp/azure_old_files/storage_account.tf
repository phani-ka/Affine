resource "azurerm_storage_account" "state_account" {
    name = "threetierstorageaccount"
    resource_group_name = azurerm_resource_group.rg.name
    location = azurerm_resource_group.rg.location
    account_tier = "Standard"
    account_replication_type = "LRS"

}

resource "azurerm_storage_container" "state" {
    name = "threetiercontainer"
    storage_account_name = azurerm_storage_account.state_account.name
    container_access_type = "private"
}