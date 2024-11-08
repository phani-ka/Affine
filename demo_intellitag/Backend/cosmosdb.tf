

resource "azurerm_cosmosdb_account" "cdb" {
  name                  = "cosmosdbai"
  location              = azurerm_resource_group.az_rg.location
  resource_group_name   = azurerm_resource_group.az_rg.name
  default_identity_type = join("=", ["UserAssignedIdentity", azurerm_user_assigned_identity.u_a_id.id])
  offer_type            = "Standard"
  kind                  = "MongoDB"
  automatic_failover_enabled = true
  capabilities {
    name = "EnableMongo"
  }

  consistency_policy {
    consistency_level = "Strong"
  }

  geo_location {
    location          = azurerm_resource_group.az_rg.location
    failover_priority = 1
  }
  geo_location {
    location          = "westus"
    failover_priority = 0
  }

  identity {
    type         = "UserAssigned"
    identity_ids = [azurerm_user_assigned_identity.u_a_id.id]
  }
}