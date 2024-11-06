

resource "azurerm_container_registry" "acr" {
  name                = "containerRegistry1"
  resource_group_name = azurerm_resource_group.az_rg.name
  location            = azurerm_resource_group.az_rg.location
  sku                 = "Premium"

  identity {
    type = "UserAssigned"
    identity_ids = [
      azurerm_user_assigned_identity.u_a_id.id
    ]
  }

  encryption {
    key_vault_key_id   = data.azurerm_key_vault_key.key_vault.id
    identity_client_id = azurerm_user_assigned_identity.u_a_id.client_id
  }

}

resource "azurerm_user_assigned_identity" "u_a_id" {
  resource_group_name = azurerm_resource_group.az_rg.name
  location            = azurerm_resource_group.az_rg.location

  name = "registry-uai"
}

data "azurerm_key_vault_key" "example" {
  name         = "super-secret"
  key_vault_id = data.azurerm_key_vault.existing.id
}





