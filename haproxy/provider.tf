terraform {
    required_version = "~>1.0.0"
    required_providers {
        # See https://registry.terraform.io/providers/hashicorp/helm/2.3.0/docs
        helm = {
            source = "hashicorp/helm"
            version = "2.3.0"
        }
        # See https://registry.terraform.io/providers/hashicorp/kubernetes/2.6.1/docs
        kubernetes = {
            source = "hashicorp/kubernetes"
            version = "2.6.1"
        }
    }
}
provider "kubernetes" {
    config_path     = var.config_path
    config_context  = var.config_context
}
provider "helm" {
    kubernetes {
        config_path     = var.config_path
        config_context  = var.config_context
    }
}