terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.85.0"
    }
  }
  # backend "local" {
  #   path = "./secret/terraform.tfstate"
  # }

  backend "azurerm" {
    resource_group_name  = "value"
    storage_account_name = "value"
    container_name       = "value"
    key                  = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}
