terraform {
  required_version = ">=0.13"

  required_providers {
    google = {
      source = "hashicorp/google"
      version = ">= 3.56"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = ">= 2.1"
    }
  }
}

data "google_client_config" "provider" {}
