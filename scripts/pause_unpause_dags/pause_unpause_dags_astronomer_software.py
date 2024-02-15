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
        dags = requests.get(
            f'{self.url}?limit=999999',
            headers={'Authorization': self.api_key}
        )
        dags = dags.json()['dags']
        return [dag['dag_id'] for dag in dags]

    def pause_dags(self, dag_ids: List[str] = []) -> None:
        if not dag_ids:
            dag_ids = self._get_all_dag_ids()
        for dag_id in dag_ids:
            response = requests.patch(
                url=f"{self.url}/{dag_id}",
                headers={'Content-Type': 'application/json', 'Authorization': self.api_key},
                data=json.dumps({"is_paused": True})
            )

    def unpause_dags(self, dag_ids: List[str] = []) -> None:
        if not dag_ids:
            dag_ids = self._get_all_dag_ids()
        for dag_id in dag_ids:
            response = requests.patch(
                url=f"{self.url}/{dag_id}",
                headers={'Content-Type': 'application/json', 'Authorization': self.api_key},
                data=json.dumps({"is_paused": False})
            )

if __name__ == "__main__":
    import argparse
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "--action",
        choices=["pause", "unpause"],
        help="Choose to pause or unpause a list of DAGs. Choices: ['pause', 'unpause']",
        required=True
    )
    parser.add_argument(
        "--api_key",
        help="Astronomer service account API key",
        required=True
    )
    parser.add_argument(
        "--deployment",
        help="The Astronomer deployment whose DAGs you wish to pause or unpause",
        required=True
    )
    parser.add_argument(
        "--domain",
        help="The base domain for your Astronomer installation, e.g. `astronomer.mycompany.com`",
        required=True
    )
    parser.add_argument(
        "--dag_ids",
        nargs="+",
        help="Optional: Space separated list of DAG IDs that you'd like to pause or unpause, e.g. dag1 dag2 dag3"
    )
    args = parser.parse_args()
    if not args.dag_ids:
        args.dag_ids = []

    pause_unpause_dags = PauseUnpauseDags(
        api_key=args.api_key,
        deployment=args.deployment,
        domain=args.domain
    )
    if args.action == "pause":
        print("Pausing DAG(s)...")
        pause_unpause_dags.pause_dags(args.dag_ids)
    else:
        print("Unpausing DAG(s)...")
        pause_unpause_dags.unpause_dags(args.dag_ids)
