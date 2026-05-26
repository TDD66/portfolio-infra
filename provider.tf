terraform {
  required_version = ">= 1.5"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 6.0"
    }
  }
  backend "gcs" {
    bucket = "portfolio-497109-tfstate"
    prefix = "portfolio-infra"
  }
}

provider "google" {
  project = "portfolio-497109"
  region  = "europe-west2"
}