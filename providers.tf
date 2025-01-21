terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.20.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>4.1.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "2.17.0"
    }
    kubectl = {
      source  = "alekc/kubectl"
      version = "2.0.4"
    }
    keycloak = {
      source  = "mrparkers/keycloak"
      version = "4.4.0"
    }
  }
  required_version = ">= 1.3.9"
}

# terraform {
#   backend "azurerm" {}
# }

provider "keycloak" {
  client_id                = var.keycloak_client_id
  username                 = var.keycloak_username
  password                 = var.keycloak_password
  url                      = var.keycloak_url
  tls_insecure_skip_verify = true
}

provider "kubernetes" {
  config_path    = var.kube_config
  config_context = var.kube_context
}

provider "helm" {
  kubernetes {
    config_path = var.kube_config
  }
}
