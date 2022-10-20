terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~> 3.27"
    }

    helm = {
      source = "hashicorp/helm"
      version = "~> 2.6"
    }

    kubectl = {
      source  = "gavinbunney/kubectl"
      version = ">= 1.7.0"
    }
  }

  required_version = "~> 1.3"

  cloud {
    organization = "kumojin"

    workspaces {
      name = "test-azure-aks"
    }
  }

}