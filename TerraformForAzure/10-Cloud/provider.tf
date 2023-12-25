terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.85.0"
    }
  }

  cloud {
    organization = "sudiptorg"

    workspaces {
      name = "TerraformAzureCourse"
    }
  }
}

provider "azurerm" {
  features {}
}
