from airflow import DAG
from airflow.operators.dummy import DummyOperator
from airflow.utils.dates import days_ago

DAG_NAME = ""
dag_args = {
        "owner":"airflow",
        "start_date": days_ago(1), 
        "schedule_interval": "@daily"
    }

with DAG(dag_id = DAG_NAME, default_args = dag_args) as dag:

    init = DummyOperator(
            task_id="start"
    )
    
    list_bucket = GoogleCloudStorageListOperator(
        task_id="list_gcp_filess",
        bucket="{{ var.value.get('raw_bucket', 'default_bucket') }}",
        gcp_conn_id="my_gcp"
)
    init >> list_bucket
