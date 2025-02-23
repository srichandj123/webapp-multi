terraform {
  required_version = "~> 1.9"
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
    resource_group {
      prevent_deletion_if_contains_resources = false # This is to handle MCAPS or other policy driven resource creation.
    }
  }
}
