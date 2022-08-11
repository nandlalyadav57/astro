#!/usr/bin/env python3

"""
Delete the airflow.secret data from a deployment. THIS IS A DESTRUCTIVE TOOL and will
redeploy airflow in the given namespace. A backup of the helm values is taken in PWD.
"""

import argparse
import json
from copy import deepcopy
from datetime import datetime
from subprocess import call, check_output
from sys import exit


def fetch_deployment_json(namespace):
    """Return a json blob of helm values."""
    deployment = namespace.removeprefix("astronomer-")
    command = f"helm get values -n {namespace} {deployment} -o json"
    return check_output(
        command.split(),
    )


def write_original_values(namespace, unix_time, json_data):
    """Takes input data and writes a json blob of it."""
    with open(f"{namespace}-{unix_time}-original.json", "w") as f:
        f.write(json_data.decode())


def write_modified_data(namespace, unix_time, data):
    """Takes input data, delete the astronomer.secrets, and write it to a file."""
    with open(f"{namespace}-{unix_time}-modified.json", "w") as f:
        f.write(json.dumps(data))


def apply_helm_values(namespace, values_file):
    """helm upgrade the given namespace using the given values_file"""
    helm_release = namespace.removeprefix("astronomer-")
    # TODO: fix the below command to dynamically resolve the version of the chart for the given namespace
    command = f"helm upgrade -n {namespace} {helm_release} astronomer-internal/airflow --version 1.0.3 -f {values_file}"
    print(f"{command=}")
    # TODO: put the below command behind a --force flag as a hurdle to performing a destructive operation
    # call(command.split())


def delete_airflow_secret(namespace, data):
    """Delete the airflow.secret data if needed."""
    modified_data = deepcopy(data)
    try:
        del modified_data["airflow"]["secret"]
    except KeyError:
        print(f"{namespace=}: No airflow.secret data present.")
    return modified_data


def main():
    """Delete the airflow.secret key from a given namespace."""
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("namespace", type=str, help="Namespace")
    args = parser.parse_args()
    namespace = args.namespace
    if not namespace.startswith("astronomer-"):
        print(f"Prepending 'astronomer-' to {namespace}")
        namespace = f"astronomer-{namespace}"
    unix_time = datetime.now().strftime("%s")

    json_data = fetch_deployment_json(namespace)
    write_original_values(namespace=namespace, unix_time=unix_time, json_data=json_data)

    old_data = json.loads(json_data)

    new_data = delete_airflow_secret(namespace=namespace, data=old_data)

    write_modified_data(namespace=namespace, unix_time=unix_time, data=new_data)

    if old_data == new_data:
        print(f"{namespace=}: No changes necessary")
        exit(0)

    modified_values_file = f"{namespace}-{unix_time}-modified.json"
    apply_helm_values(namespace=namespace, values_file=modified_values_file)


if __name__ == "__main__":
    main()