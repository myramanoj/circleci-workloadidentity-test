provider "google" {
  project = var.project_id
  region  = var.region
}
  
provider "google-beta" {
  project = var.project_id
  region  = var.region
}

terraform {
  required_version = "1.3.7"
  required_providers {
    google = {
      version = "4.31.0"
    }
    google-beta = {
      version = "4.31.0"
    }
  }
}