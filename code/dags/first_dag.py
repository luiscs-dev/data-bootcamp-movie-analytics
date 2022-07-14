from airflow import DAG
from airflow.operators.bash import BashOperator
from airflow.operators.dummy import DummyOperator
from airflow.utils.dates import days_ago

DAG_NAME = 'all_tasks_in_one_dag'
args = {'owner': 'airflow', 'start_date': days_ago(1), 'schedule_interval': "@once"}

with DAG(dag_id=DAG_NAME, default_args=args) as dag:

    start = DummyOperator(
        task_id='start'
    )

    task_1 = BashOperator(
        task_id='op-1',
        bash_command='echo "My first DAG running."',
        dag=dag)

    end = DummyOperator(
        task_id='end'
    )

    start >> task_1 >> end
