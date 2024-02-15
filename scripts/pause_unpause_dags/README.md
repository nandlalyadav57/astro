Pause/Unpause DAGs Script Readme
Goal
This script provides a convenient way to programmatically pause and unpause DAGs in an Airflow instance. It can be used for both general Airflow instances and specifically for Astronomer deployments.

Steps
Prerequisites
Before using this script, ensure you have an API key for the respective Astronomer product. You can generate this key by following the instructions in the Airflow API documentation.

Usage
Python + Airflow REST API (Astro)
bash
Copy code
# Pause all DAGs
# To unpause, change the action arg to "unpause"
python3 pause_unpause_dags_cloud.py \
  --action pause \
  --airflow_url <Airflow URL> \
  --token <token generated from API key/secret>

# Pause a list of DAGs
# To unpause, change the action arg to "unpause"
python3 pause_unpause_dags_cloud.py \
  --action pause \
  --airflow_url <Airflow URL> \
  --token <token generated from API key/secret> \
  --dag_ids dag_id_1 dag_id_2 dag_id_3
Astronomer Software
bash
Copy code
# Pause all DAGs
# To unpause, change the action arg to "unpause"
python3 pause_unpause_dags_astronomer_software.py \
  --action pause \
  --api_key <api key> \
  --deployment <deployment name> \
  --domain <Astronomer software base domain>

# Pause a list of DAGs
# To unpause, change the action arg to "unpause"
python3 pause_unpause_dags_astronomer_software.py \
  --action pause \
  --api_key <api key> \
  --deployment <deployment name> \
  --domain <Astronomer software base domain> \
  --dag_ids dag_id_1 dag_id_2 dag_id_3
Custom Airflow Operator
The provided custom Airflow operator, PauseDagsOperator, allows you to integrate DAG pausing/unpausing into your Airflow DAGs.

Usage in a DAG
python
Copy code
from datetime import datetime
from time import sleep
from airflow.operators.python import PythonOperator
from airflow.models import DAG
from plugins.pause_controller import Operation, PauseDagsOperator

default_args = {
    'owner': 'airflow',
    'depends_on_past': False,
    'email_on_failure': False,
    'email_on_retry': False,
}

with DAG(
    dag_id="test_pausing_dags",
    default_args=default_args,
    catchup=False,
    schedule_interval=None,
    start_date=datetime(1970, 1, 1),
    render_template_as_native_obj=True,
) as dag:
    get_unpaused_dags = PauseDagsOperator(
        task_id="get_unpaused_dags",
        operation=Operation.GET
    )

    pause_dags = PauseDagsOperator(
        task_id="pause_running_dags",
        operation=Operation.PAUSE,
        pause=True,
        dag_list="{{ ti.xcom_pull(task_ids='get_unpaused_dags', key='paused_dags') }}"
    )

    just_sleep = PythonOperator(
        task_id="just_sleep_and_wait",
        python_callable=lambda: sleep(15)
    )

    unpause_the_dags_that_were_paused = PauseDagsOperator(
        task_id="unpause_the_dags_that_were_paused",
        operation=Operation.PAUSE,
        pause=False,
        dag_list="{{ ti.xcom_pull(task_ids='get_unpaused_dags', key='paused_dags') }}"
    )

    get_unpaused_dags >> pause_dags >> just_sleep >> unpause_the_dags_that_were_paused
Feel free to adapt and extend this script and the provided custom operator based on your specific requirements.