```markdown
# Airflow How-To: Programmatically Pause/Unpause DAGs



## Goal
Programmatically pause and unpause DAGs using the Airflow API.

## Prerequisites
- Generate an API key for the respective Astronomer product. Refer to the KB article for details.

## Python + Airflow REST API
**Script: `pause_unpause_dags_cloud.py`**

```python
"""
Programmatically pause and unpause DAGs
"""
import json
from typing import List
import requests

class PauseUnpauseDags:
    def __init__(
        self,
        url: str,
        token: str,
    ) -> None:
        self.url = f"{url}/api/v1/dags"
        self.token = token

    def _get_all_dag_ids(self) -> List[str]:
        # ... (code for getting DAG IDs)

    def pause_dags(self, dag_ids: List[str] = []) -> None:
        # ... (code for pausing DAGs)

    def unpause_dags(self, dag_ids: List[str] = []) -> None:
        # ... (code for unpausing DAGs)

if __name__ == "__main__":
    # ... (command-line argument parsing and execution)
```

**Usage:**
- Pause all DAGs:
  ```bash
  python3 pause_unpause_dags_cloud.py --action pause --airflow_url <Airflow URL> --token <token>
  ```
- Pause specific DAGs:
  ```bash
  python3 pause_unpause_dags_cloud.py --action pause --airflow_url <Airflow URL> --token <token> --dag_ids dag_id_1 dag_id_2 dag_id_3
  ```

**Astronomer Software**
**Script: `pause_unpause_dags_astronomer_software.py`**

```python
"""
Programmatically pause and unpause DAGs
"""
import json
from typing import List
import requests

class PauseUnpauseDags:
    def __init__(
        self,
        api_key: str,
        deployment: str,
        domain: str,
    ) -> None:
        self.api_key = api_key
        self.url = f"https://deployments.{domain}/{deployment}/airflow/api/v1/dags"

    def _get_all_dag_ids(self) -> List[str]:
        # ... (code for getting DAG IDs)

    def pause_dags(self, dag_ids: List[str] = []) -> None:
        # ... (code for pausing DAGs)

    def unpause_dags(self, dag_ids: List[str] = []) -> None:
        # ... (code for unpausing DAGs)

if __name__ == "__main__":
    # ... (command-line argument parsing and execution)
```

**Usage:**
- Pause all DAGs:
  ```bash
  python3 pause_unpause_dags_astronomer_software.py --action pause --api_key <api key> --deployment <deployment name> --domain <domain>
  ```
- Pause specific DAGs:
  ```bash
  python3 pause_unpause_dags_astronomer_software.py --action pause --api_key <api key> --deployment <deployment name> --domain <domain> --dag_ids dag_id_1 dag_id_2 dag_id_3
  ```

## Custom Airflow Operator
**Operator: `PauseDagsOperator`**

```python
from airflow.models.baseoperator import BaseOperator
from airflow.settings import Session
from airflow.models import DagModel
from enum import Enum
from typing import Union, List
from airflow.exceptions import AirflowBadRequest


class Operation(Enum):
    GET = 0
    PAUSE = 1


class PauseDagsOperator(BaseOperator):
    # required to be set in execute
    context = None

    def __init__(self, operation: Operation, pause: Union[bool, None] = None, dag_list: List[DagModel] = [], *args, **kwargs):
        super().__init__(*args, **kwargs)
        # do some checks to make sure that we get the right parameters
        if operation == Operation.GET and (pause is not None or len(dag_list) != 0):
            raise AirflowBadRequest(
                "If GET operation is desire, pause and dag_list parameters should not be set"
            )
        elif operation == Operation.PAUSE and (pause is None or len(dag_list) == 0):
            raise AirflowBadRequest(
                "If PAUSE or UNPAUSE operation is desired, pause and dag_list parameters should be set"
            )
        self.template_fields = ("dag_list",)
    
        self.operation = operation
        self.pause = pause
        self.dag_list = dag_list

    def _get_paused_dags_list(self):
        self.context["ti"].xcom_push(key="paused_dags", value=Session().query(DagModel).filter(
            DagModel.is_active,
            ~DagModel.is_paused,
            DagModel.dag_id != self.context["dag"].dag_id
        ).all())
    
    def _pause_dags_in_list(self):
        for dag in self.dag_list:
            dag.set_is_paused(self.pause)

    def execute(self, context):
        self.context = context
        operations_map = {
            Operation.GET: self._get_paused_dags_list,
            Operation.PAUSE: self._pause_dags_in_list,
        }
        operations_map[self.operation]()
```

The above operator can be used in a DAG as follows:

**Usage in DAG:**
```python
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
```

This how-to guide provides scripts and an Airflow operator to pause and unpause DAGs, along with usage examples programmatically.
```
