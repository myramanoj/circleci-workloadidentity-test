provider "google" {
  project = var.project_id
  region  = var.region
}
  
provider "google-beta" {
  project = var.project_id
  region  = var.region
}

terraform {
  required_version = "1.0.9"
  required_providers {
    google = {
      version = "4.48.0"
    }
    google-beta = {
      version = "4.48.0"
    }
  }
}