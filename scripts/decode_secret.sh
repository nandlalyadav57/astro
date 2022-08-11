#!/bin/bash

astro_release=$1

release_name=$2

echo "display all pods in release $astro_release-$release_name"
kubectl get pods  -n $astro_release-$release_name


echo "#####################################################"
echo "               display ssl job pod                   "
echo "#####################################################"
echo ""
kubectl get pods  -n $astro_release-$release_name | grep "Completed"
echo ""

echo "#####################################################"
echo "              display cerficate                      "
echo "#####################################################"
echo ""
kubectl get secret $release_name-pgbouncer-client-certificates -o json -n $astro_release-$release_name   | jq '.data '
echo ""


echo "######################################################"
echo "#############show volume mounts#######################"
echo "######################################################"
echo ""
kubectl get deploy $release_name-pgbouncer -n $astro_release-$release_name -o json | jq '.spec.template.spec.containers[0].volumeMounts'
echo ""


echo "######################################################"
echo "################show volume###########################"
echo "######################################################"
echo ""
kubectl get deploy $release_name-pgbouncer -n $astro_release-$release_name -o json | jq '.spec.template.spec.volumes'
echo ""


echo "######################################################"
echo "#############Decode pgbouncer config##################"
echo "######################################################"
echo ""
kubectl get secret $release_name-pgbouncer-config -n $astro_release-$release_name  -o=go-template='{{index .data "pgbouncer.ini"}}' | base64 -d
echo ""


echo "######################################################"
echo "#############Decode metrics exprter config############"
echo "######################################################"
echo ""
kubectl get secret $release_name-pgbouncer-stats -n $astro_release-$release_name  -o=go-template='{{index .data "connection"}}' | base64 -d
echo ""

echo "######################################################"
echo "#############Decode airflow meta #####################"
echo "######################################################"
echo ""
kubectl get secret $release_name-airflow-metadata -n $astro_release-$release_name  -o=go-template='{{index .data "connection"}}' | base64 -d

echo "######################################################"
echo "#############Decode airflow result backend  ############"
echo "######################################################"
echo ""
kubectl get secret $release_name-airflow-metadata -n $astro_release-$release_name  -o=go-template='{{index .data "connection"}}' | base64 -d
echo ""
