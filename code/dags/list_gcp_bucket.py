from airflow import DAG
from airflow.operators.dummy import DummyOperator
from airflow.utils.dates import days_ago
from airflow.providers.google.cloud.operators.gcs import GCSListObjectsOperator

DAG_NAME = "gcp_list_bucket"
dag_args = {
        "owner":"airflow",
        "start_date": days_ago(1), 
        "schedule_interval": "@daily"
    }

with DAG(dag_id = DAG_NAME, default_args = dag_args) as dag:

    init = DummyOperator(
            task_id="start"
    )
    
    list_bucket = GCSListObjectsOperator(
        task_id="list_gcp_filess",
        bucket="{{ var.value.get('raw_bucket', 'default_bucket') }}",
        gcp_conn_id="my_gcp"
)
    init >> list_bucket
