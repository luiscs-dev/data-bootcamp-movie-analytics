resource "google_bigquery_dataset" "default" {
  dataset_id = var.dataset_id
  location = var.location

  labels = {
    env = "default"
  }
}

resource "google_bigquery_table" "fact_movie" {
  dataset_id = google_bigquery_dataset.default.dataset_id
  table_id = var.table_id

  labels = {
    env = "default"
  }

  schema = <<EOF
[
  {
    "name": "customer_id",
    "type": "INTEGER",
    "mode": "REQUIRED",
    "description": "Customer ID"
  },
  {
    "name": "id_dim_device",
    "type": "INTEGER",
    "mode": "REQUIRED",
    "description": "Devices dimension"
  },
  {
    "name": "id_dim_location",
    "type": "INTEGER",
    "mode": "REQUIRED",
    "description": "Locations dimension"
  },
  {
    "name": "id_dim_os",
    "type": "INTEGER",
    "mode": "REQUIRED",
    "description": "OSes dimension"
  },
  {
    "name": "id_dim_browser",
    "type": "INTEGER",
    "mode": "REQUIRED",
    "description": "Browsers dimension"
  },
  {
    "name": "amount_spent",
    "type": "NUMERIC",
    "mode": "NULLABLE",
    "description": "Devices dimension"
  },
  {
    "name": "review_score",
    "type": "INTEGER",
    "mode": "NULLABLE",
    "description": "Devices dimension"
  },
  {
    "name": "review_count",
    "type": "INTEGER",
    "mode": "NULLABLE",
    "description": "Devices dimension"
  },
  {
    "name": "insert_date",
    "type": "DATE",
    "mode": "REQUIRED",
    "description": "Devices dimension"
  }
]
EOF

}


