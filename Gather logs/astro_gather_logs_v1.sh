#!/bin/bash
timestamp=`date '+%d/%m/%Y %H:%M:%S'`
# Put the name of the astronomer ASTRONOMER_NAMESPACE below
export ASTRONOMER_NAMESPACE=astronomer
#Get Astronomer Release name
export ASTRONOMER_RELEASE=$(helm ls -A|grep -i "astronomer"|head -n1 | awk '{ print $2}')
# Put the name of the deployment ASTRONOMER_NAMESPACE 1 where we are having issues
export DEPLOYMENT_NS1=astronomer-combusting-plane-6703
# removing astronomer- and putting as release name
export Release1=$(echo $DEPLOYMENT_NS1| cut -c 12-)
#setting log directory
export DIR=/tmp/astro_logs
#Kinfly set base domain info for your cluster 
##For e.g. I had a test cluster with the URL ```https://app.nandlal54.astro-cre.com`then my base domain is ```nandlal54.astro-cre.com``` ###
#export BASEDOMAIN=nandlal51.astro-cre.com
#astro auth login  $BASEDOMAIN
#####====================================================================================================================================================#####
echo $ASTRONOMER_NAMESPACE
echo $ASTRONOMER_RELEASE
echo $DEPLOYMENT_NS1
echo $Release1
echo $DIR
#####====================================================================================================================================================#####
mkdir -p $DIR
chmod -R 777 $DIR
cd $DIR
#####====================================================================================================================================================#####
kubectl config set-context --current --namespace=$ASTRONOMER_NAMESPACE
echo "Gathering $ASTRONOMER_NAMESPACE events & logs"
#####====================================================================================================================================================#####
kubectl get pods -o wide -n $ASTRONOMER_NAMESPACE > pods_$ASTRONOMER_NAMESPACE.log
kubectl get events -n $ASTRONOMER_NAMESPACE  > events_$ASTRONOMER_NAMESPACE.log
kubectl get secrets -n $ASTRONOMER_NAMESPACE  > secrets_$ASTRONOMER_NAMESPACE.log
kubectl get nodes -o wide > nodes.log
kubectl logs deployment/astronomer-houston -n $ASTRONOMER_NAMESPACE > houston_$ASTRONOMER_NAMESPACE.log
kubectl logs deployment/astronomer-astro-ui -n $ASTRONOMER_NAMESPACE  > astro-ui_$ASTRONOMER_NAMESPACE.log
kubectl logs deployment/astronomer-commander -n $ASTRONOMER_NAMESPACE  > commander_$ASTRONOMER_NAMESPACE.log
kubectl logs deployment/astronomer-elasticsearch-client -n $ASTRONOMER_NAMESPACE  > elasticsearch-client_$ASTRONOMER_NAMESPACE.log
kubectl logs deployment/astronomer-houston-worker -n $ASTRONOMER_NAMESPACE > houston-worker_$ASTRONOMER_NAMESPACE.log
kubectl logs deployment/astronomer-nginx -n $ASTRONOMER_NAMESPACE > nginx_$ASTRONOMER_NAMESPACE.log
kubectl logs deployment/astronomer-grafana -n $ASTRONOMER_NAMESPACE > grafana_$ASTRONOMER_NAMESPACE.log
kubectl logs deployment/astronomer-kibana -n $ASTRONOMER_NAMESPACE > kibana_$ASTRONOMER_NAMESPACE.log
kubectl logs deployment/astronomer-kube-state -n $ASTRONOMER_NAMESPACE  > kube-state_$ASTRONOMER_NAMESPACE.log
kubectl logs sts/astronomer-registry -n $ASTRONOMER_NAMESPACE > registry_$ASTRONOMER_NAMESPACE.log
kubectl logs sts/astronomer-elasticsearch-data -n $ASTRONOMER_NAMESPACE  > elasticsearch-data_$ASTRONOMER_NAMESPACE.log   
kubectl logs sts/astronomer-elasticsearch-master -n $ASTRONOMER_NAMESPACE > elasticsearch-master_$ASTRONOMER_NAMESPACE.log
kubectl logs sts/astronomer-nats -c nats -n $ASTRONOMER_NAMESPACE > nats_$ASTRONOMER_NAMESPACE.log
kubectl logs sts/astronomer-prometheus -c prometheus -n $ASTRONOMER_NAMESPACE > prometheus_container_$ASTRONOMER_NAMESPACE.log
kubectl logs sts/astronomer-stan -c stan -n $ASTRONOMER_NAMESPACE > stan_contatiner_$ASTRONOMER_NAMESPACE.log
#####====================================================================================================================================================#####
#####====================================================================================================================================================#####
echo "Gathering Helm logs"
#####====================================================================================================================================================#####
helm ls -A > helm_status.log
helm history $ASTRONOMER_RELEASE -n $ASTRONOMER_NAMESPACE > helm_history_$ASTRONOMER_RELEASE.log
helm history $Release1 -n $DEPLOYMENT_NS1 > helm_history_$Release1.log
helm get values $ASTRONOMER_RELEASE -n $ASTRONOMER_NAMESPACE -o yaml > helm_values_$ASTRONOMER_RELEASE.yaml 
helm get values $Release1 -n $DEPLOYMENT_NS1 -o yaml > helm_values_$Release1.yaml 
#####====================================================================================================================================================#####
#####====================================================================================================================================================#####
echo "Gathering $DEPLOYMENT_NS1 events & logs"
kubectl config set-context --current --namespace=$DEPLOYMENT_NS1
#####====================================================================================================================================================#####
kubectl get pods -o wide -n $DEPLOYMENT_NS1 > pods_$DEPLOYMENT_NS1.log
kubectl get events -n $DEPLOYMENT_NS1 > events_$DEPLOYMENT_NS1.log
kubectl get secrets -n $DEPLOYMENT_NS1  > secrets_$DEPLOYMENT_NS1.log
kubectl logs deployment/$Release1-scheduler -c scheduler -n $DEPLOYMENT_NS1 > scheduler_$Release1.log
kubectl logs deployment/$Release1-worker -c worker -n $DEPLOYMENT_NS1 > worker_$Release1.log
kubectl logs deployment/$Release1-webserver -c webserver -n $DEPLOYMENT_NS1 > webserver_$Release1.log
kubectl logs deployment/$Release1-triggerer -c triggerer -n $DEPLOYMENT_NS1  > triggerer$Release1.log
kubectl logs deployment/$Release1-pgbouncer -c pgbouncer -n $DEPLOYMENT_NS1  > pgbouncer$Release1.log
kubectl logs deployment/$Release1-flower -n $DEPLOYMENT_NS1  > flower_$Release1.log
kubectl logs deployment/$Release1-statsd -n $DEPLOYMENT_NS1 > statsd_$Release1.log
kubectl logs sts/$Release1-redis -n $DEPLOYMENT_NS1 > redis_$Release1.log
#####====================================================================================================================================================#####
#####====================================================================================================================================================#####
echo "Collecting General enviornment Information"
astro version > Enviornment_Info.log
echo "=================================================================================================" >> Enviornment_Info.log
docker version >> Enviornment_Info.log
###=============================================================================#####
#####====================================================================================================================================================#####
echo "creating GZ and zip files"
#####====================================================================================================================================================#####
tar -czvf $DIR_$(date +%F).tar.gz $DIR
zip -r $DIR.zip $DIR
#####====================================================================================================================================================#####
echo "Share the log or zip file for troubleshooting"
#####====================================================================================================================================================#####
