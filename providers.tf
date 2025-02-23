terraform {
  required_version = "~> 1.9"
  #Used Terraform Cloud to deploy the Terraform Code
  cloud {
    organization = "jakka"
    workspaces {
      name = "webapp-multi"
    }
  }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0.0"
    }
  }
}

provider "azurerm" {
  features {
  }
}
