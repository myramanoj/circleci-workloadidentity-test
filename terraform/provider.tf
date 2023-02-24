provider "google" {
  credentials = file("de-manoj-kumar-c2ff3bc080fe.json")
  project = var.project_id
  region  = var.region
}
  
provider "google-beta" {
  credentials = file("de-manoj-kumar-c2ff3bc080fe.json")
  project = var.project_id
  region  = var.region
}
