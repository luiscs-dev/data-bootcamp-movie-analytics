resource "google_storage_bucket" "raw_bucket" {
  name = "${var.project_id}-raw"
  location = var.region
}

resource "google_storage_bucket" "staging_bucket" {
  name = "${var.project_id}-staging"
  location = var.region
}
