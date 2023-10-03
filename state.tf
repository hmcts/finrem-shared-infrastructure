terraform {
  backend "azurerm" {}

  required_providers {
    azuread = {
      source  = "hashicorp/azuread"
      version = "1.6.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.45.1"
    }
    random = {
      source = "hashicorp/random"
    }
  }
}
