terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.43.0"
    }
  }
  cloud {

    organization = "PersonalOrg28082024"

    workspaces {
      name = "Azure-Storage-Using-Private-Module"
    }
  }
}

provider "azurerm" {
  features {}
  skip_provider_registration = true
}

resource "azurerm_resource_group" "rg" {
  name     = "813-e180be8c-hands-on-with-terraform-on-azure"
  location = "South Central US"
}

module "securestorage" {
  source  = "app.terraform.io/PersonalOrg28082024/securestorage/azurerm"
  version = "1.0.0"
  # insert required variables here
  location = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  storage_account_name = "stg90453u667797"
}