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
    # ... (Enum for operations)

class PauseDagsOperator(BaseOperator):
    # ... (Operator code)
```

**Usage in DAG:**
```python
# ... (import statements and DAG definition)

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

# ... (other tasks in DAG)

get_unpaused_dags >> pause_dags >> just_sleep >> unpause_the_dags_that_were_paused
```

This how-to guide provides scripts and an Airflow operator to programmatically pause and unpause DAGs, along with usage examples.
```
