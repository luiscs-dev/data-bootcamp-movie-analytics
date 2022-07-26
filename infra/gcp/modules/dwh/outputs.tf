output "bigquery_fact_movie_table" {
  value = google_bigquery_table.fact_movie.table_id
  description = "Bigquery Fact Movie table"
}
