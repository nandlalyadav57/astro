#!/usr/bin/env python
"""Output a valid astronomer-houston-jwt-signing-certificate secret to feed into kubectl create $target_namespace -f -"""


import json
from subprocess import check_output

secret = output = json.loads(
    check_output(
        "kubectl -n astronomer get secret astronomer-houston-jwt-signing-certificate -o json".split()
    )
)

base_keepers = ["apiVersion", "data", "type", "kind", "metadata"]
metadata_keepers = ["annotations", "labels", "name", "resourceVersion"]
annotation_keepers = [""]
label_keepers = [
    "velero.io/exclude-from-backup",
    "component",
    "heritage",
    "release",
    "tier",
]
new_labels = {
    "kubed.appscode.com/origin.cluster": "",
    "kubed.appscode.com/origin.name": "astronomer-houston-jwt-signing-certificate",
    "kubed.appscode.com/origin.namespace": "astronomer",
}


def filter_dict(the_dict, filter):
    for item in list(the_dict):
        if item not in filter:
            the_dict.pop(item, None)


filter_dict(secret, base_keepers)
filter_dict(secret["metadata"], metadata_keepers)
filter_dict(secret["metadata"]["labels"], label_keepers)
filter_dict(secret["metadata"]["annotations"], annotation_keepers)

secret["metadata"]["labels"].update(new_labels)

print(json.dumps(secret))
