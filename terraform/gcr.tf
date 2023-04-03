resource "google_container_registry" "prod_indep_eu_registry" {
  project  = var.project_id
  name     = "test"
  location = "EU"
}