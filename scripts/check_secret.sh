#!/usr/bin/env bash
# Description: checks given namespace for the secret astronomer-houston-jwt-signing-certificate (kubed troubleshooting)
# Usage:
#   k get namespaces -o name | grep '^namespace/astronomer' | xargs -P10 -n1 bin/check_secret.sh
#
#   bin/get-astronomer-houston-jwt-signing-certificate.py | kubectl -n "$NEW_NAMESPACE" apply -f -
#
#   kubectl get namespaces -o name |
#     grep '^namespace/astronomer' |
#     xargs -P10 -n1 bin/check_secret.sh |
#     sed 's#.*namespace/##' |
#     while read -r target_namespace ; do
#       echo "Fixing namespace: $target_namespace"
#       bin/get-astronomer-houston-jwt-signing-certificate.py |
#       kubectl create -n $target_namespace -f -
#     done

[ $# -eq 1 ] || { echo "Please give one NS to check." ; exit 1 ; }
ns=$1
ns_age=$(kubectl get "$ns" -o jsonpath='{.metadata.creationTimestamp}')
kubectl -n "${ns#*/}" get secrets astronomer-houston-jwt-signing-certificate >/dev/null 2>&1 && exit 0
echo "ns_creation: $ns_age, state: missing, ns_name: $ns"
exit 1
