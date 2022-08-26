terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.20.0"
    }

    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.0.1"
    }
  }
}

# Use provided kubeconfig that are passed in at run time from Terraform Cloud
provider "kubernetes" {
  config_context_auth_info = var.KUBE_CONFIG_CONTEXT_AUTH_INFO
  token                    = var.KUBE_TOKEN
  cluster_ca_certificate   = var.KUBE_CLUSTER_CA_CERT_DATA
}

