terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.85.0"
    }
  }
  backend "local" {
    path = "./secret/terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}
