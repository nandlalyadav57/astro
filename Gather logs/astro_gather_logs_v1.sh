#!/bin/bash
timestamp=`date '+%d/%m/%Y %H:%M:%S'`
# Put the name of the astronomer ASTRONOMER_NAMESPACE below
export ASTRONOMER_NAMESPACE=astronomer
#Get Astronomer Release name
export ASTRONOMER_RELEASE=$(helm ls -A|grep -i "astronomer"|head -n1 | awk '{ print $2}')
# Put the name of the deployment ASTRONOMER_NAMESPACE 1 where we are having issues
export DEPLOYMENT_NS1=astronomer-combusting-plane-6703
# removing and putting as release name
export Release1=$(echo $DEPLOYMENT_NS1| cut -c 12-)
echo $ASTRONOMER_NAMESPACE
echo $ASTRONOMER_RELEASE
echo $DEPLOYMENT_NS1
echo $Release1
mkdir -p /tmp/astro_logs
chmod -R 777 /tmp/astro_logs
cd /tmp/astro_logs
#Gather logs now
kubectl config set-context --current --namespace=$ASTRONOMER_NAMESPACE
echo "Gathering $ASTRONOMER_NAMESPACE events & logs"
kubectl -n $ASTRONOMER_NAMESPACE get pods -o wide > pods_$ASTRONOMER_NAMESPACE.log
kubectl -n $ASTRONOMER_NAMESPACE get events  > events_$ASTRONOMER_NAMESPACE.log
kubectl -n $ASTRONOMER_NAMESPACE get secrets  > secrets_$ASTRONOMER_NAMESPACE.log
kubectl get nodes -o wide > nodes.log
kubectl -n $ASTRONOMER_NAMESPACE logs deployment/astronomer-houston > houston_$ASTRONOMER_NAMESPACE.log
kubectl -n $ASTRONOMER_NAMESPACE logs deployment/astronomer-astro-ui  > astro-ui_$ASTRONOMER_NAMESPACE.log
kubectl -n $ASTRONOMER_NAMESPACE logs deployment/astronomer-commander > commander_$ASTRONOMER_NAMESPACE.log
kubectl -n $ASTRONOMER_NAMESPACE logs deployment/astronomer-elasticsearch-client > elasticsearch-client_$ASTRONOMER_NAMESPACE.log
kubectl -n $ASTRONOMER_NAMESPACE logs deployment/astronomer-houston-worker > houston-worker_$ASTRONOMER_NAMESPACE.log
kubectl -n $ASTRONOMER_NAMESPACE logs deployment/astronomer-nginx > nginx_$ASTRONOMER_NAMESPACE.log
kubectl -n $ASTRONOMER_NAMESPACE logs deployment/astronomer-grafana > grafana_$ASTRONOMER_NAMESPACE.log
kubectl -n $ASTRONOMER_NAMESPACE logs deployment/astronomer-kibana > kibana_$ASTRONOMER_NAMESPACE.log
kubectl -n $ASTRONOMER_NAMESPACE logs deployment/astronomer-kube-state > kube-state_$ASTRONOMER_NAMESPACE.log
kubectl -n $ASTRONOMER_NAMESPACE logs sts/astronomer-registry > registry_$ASTRONOMER_NAMESPACE.log
kubectl -n $ASTRONOMER_NAMESPACE logs sts/astronomer-elasticsearch-data  > elasticsearch-data_$ASTRONOMER_NAMESPACE.log   
kubectl -n $ASTRONOMER_NAMESPACE logs sts/astronomer-elasticsearch-master > elasticsearch-master_$ASTRONOMER_NAMESPACE.log
kubectl -n $ASTRONOMER_NAMESPACE logs sts/astronomer-nats -c nats > nats_$ASTRONOMER_NAMESPACE.log
kubectl -n $ASTRONOMER_NAMESPACE logs sts/astronomer-prometheus -c prometheus > prometheus_container_$ASTRONOMER_NAMESPACE.log
kubectl -n $ASTRONOMER_NAMESPACE logs sts/astronomer-stan -c stan > stan_contatiner_$ASTRONOMER_NAMESPACE.log

echo "Gathering Helm logs"
helm ls -A > helm_status.log
helm history $ASTRONOMER_RELEASE -n $ASTRONOMER_NAMESPACE > helm_history_$ASTRONOMER_RELEASE.log
helm history $Release1 -n $DEPLOYMENT_NS1 > helm_history_$Release1.log
helm get values $ASTRONOMER_RELEASE -n $ASTRONOMER_NAMESPACE -o yaml > helm_values_$ASTRONOMER_RELEASE.yaml 
helm get values $Release1 -n $DEPLOYMENT_NS1 -o yaml > helm_values_$Release1.yaml 


echo "Gathering $DEPLOYMENT_NS1 events & logs"
kubectl config set-context --current --namespace=$DEPLOYMENT_NS1
kubectl -n $DEPLOYMENT_NS1 get pods -o wide > pods_$DEPLOYMENT_NS1.log
kubectl -n $DEPLOYMENT_NS1 get events  > events_$DEPLOYMENT_NS1.log
kubectl -n $DEPLOYMENT_NS1 get secrets  > secrets_$DEPLOYMENT_NS1.log
kubectl -n $DEPLOYMENT_NS1 logs deployment/$Release1-scheduler -c scheduler > scheduler_$Release1.log
kubectl -n $DEPLOYMENT_NS1 logs deployment/$Release1-worker -c worker > worker_$Release1.log
kubectl -n $DEPLOYMENT_NS1 logs deployment/$Release1-webserver -c webserver > webserver_$Release1.log
kubectl -n $DEPLOYMENT_NS1 logs deployment/$Release1-triggerer -c triggerer > triggerer$Release1.log
kubectl -n $DEPLOYMENT_NS1 logs deployment/$Release1-pgbouncer -c pgbouncer > pgbouncer$Release1.log
kubectl -n $DEPLOYMENT_NS1 logs deployment/$Release1-flower > flower_$Release1.log
kubectl -n $DEPLOYMENT_NS1 logs deployment/$Release1-statsd > statsd_$Release1.log
kubectl -n $DEPLOYMENT_NS1 logs sts/$Release1-redis > redis_$Release1.log





tar -czvf /tmp/astro_logs_$(date +%F).tar.gz /tmp/astro_logs
zip -r /tmp/astro_logs.zip /tmp/astro_logs


##send us the zip and .gz files##
