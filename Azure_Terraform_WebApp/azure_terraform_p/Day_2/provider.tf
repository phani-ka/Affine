terraform {
  required_providers {
    azurerm = {
        source = "hashicorp/azurerm"
        version = "~>4.26.0"
    }
 
  }
}

provider "azurerm" {
    features {}
    subscription_id = "cb5ac1da-39ac-4bb2-9d42-9c50b7e1b071"
  
}