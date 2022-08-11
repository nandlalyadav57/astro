#!/bin/bash
for NS in $(kubectl get ns --no-headers|grep astronomer | awk '{print $1}'); 
  do 
    for jobs in $(kubectl get cronjobs --no-headers -n $NS | awk '{print $1}') ; do
      echo $jobs;kubectl patch cronjobs $jobs -p '{"spec" : {"suspend" : false }}' -n $NS
    done
done