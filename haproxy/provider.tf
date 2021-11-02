terraform {
    required_version = "~>1.0.0"
    required_providers {
        # See https://registry.terraform.io/providers/hashicorp/helm/2.3.0/docs
        helm = {
            source = "hashicorp/helm"
            version = "2.3.0"
        }
    }
}
provider "helm" {}