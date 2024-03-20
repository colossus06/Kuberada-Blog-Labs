terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.94.0"
    }
  }
}

provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
}

resource "random_string" "rnd" {
  length  = 5
  special = false
  upper   = false
}
resource "azurerm_resource_group" "rg" {
  location = var.dev-clu-location
  name     = var.rg-devclu
}



resource "azurerm_kubernetes_cluster" "devclu" {
  name                = var.aks
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "kuberadagt"
  sku_tier= "Free"

#compute resources
  default_node_pool {
    enable_auto_scaling= true
    name       = "default"
    min_count = 1
    max_count = 2
    node_count = 1
    max_pods = 30
    enable_node_public_ip= true
    vm_size    = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Dev"
  }
}

