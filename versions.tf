terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~> 3.27"
    }
  }

  required_version = "~> 1.2"
  
  cloud {
    organization = "kumojin"

    workspaces {
      name = "test-azure-aks"
    }
  }

}