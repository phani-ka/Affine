terraform {
  #required_version = ">= 1.11.0"
  required_providers {
    azurerm = {
        source = "hashicorp/azurerm"
        version = "4.16.0"
    }

  }
}

provider "azurerm" {
    
}
