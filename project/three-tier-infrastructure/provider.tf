terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=5.0.0"
    }
  }
}


provider "azurerm" {
  features {}
  subscription_id = "cdff66fc-4d7e-40e4-8240-b6efe889082c"
}