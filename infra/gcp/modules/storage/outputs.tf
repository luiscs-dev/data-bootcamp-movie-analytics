output "raw_bucket" {
  value = google_storage_bucket.raw_bucket.name
}

output "staging_bucket" {
  value = google_storage_bucket.staging_bucket.name
}
