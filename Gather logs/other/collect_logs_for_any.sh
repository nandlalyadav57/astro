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




####creating namespace Directories###
for NS in $(kubectl get ns --no-headers|grep astronomer | awk '{print $1}'); do
    echo "creating namespace $NS Directory ";mkdir $NS 
    done


####Gathering All the Deployment namespace logs###
echo "Gathering All the $ASTRONOMER_NAMESPACE namespace logs"
for $ASTRONOMER_NAMESPACE
      echo "Getting Pod Running status in $ASTRONOMER_NAMESPACE Namespace";kubectl get pods -o wide > "$ASTRONOMER_NAMESPACE/pods_$ASTRONOMER_NAMESPACE.log" -n $ASTRONOMER_NAMESPACE
      echo "Getting events in $ASTRONOMER_NAMESPACE Namespace ";kubectl get events > "$ASTRONOMER_NAMESPACE/events_$ASTRONOMER_NAMESPACE.log" -n $ASTRONOMER_NAMESPACE
      echo "Getting secrets in $ASTRONOMER_NAMESPACE Namespace ";kubectl get secrets > "$ASTRONOMER_NAMESPACE/secrets_$ASTRONOMER_NAMESPACE.log" -n $ASTRONOMER_NAMESPACE
      echo "Getting logs of worker in $ASTRONOMER_NAMESPACE Namespace ";kubectl logs deployment/astronomer-houston  > "$ASTRONOMER_NAMESPACE/worker_$ASTRONOMER_NAMESPACE.log" -n $ASTRONOMER_NAMESPACE
      echo "Getting logs of webserverin $ASTRONOMER_NAMESPACE Namespace ";kubectl logs deployment/astronomer-astro-ui > "$ASTRONOMER_NAMESPACE/webserver$ASTRONOMER_NAMESPACE.log" -n $ASTRONOMER_NAMESPACE
      echo "Getting logs of triggerer in $ASTRONOMER_NAMESPACE Namespace ";kubectl logs deployment/astronomer-commander  > "$ASTRONOMER_NAMESPACE/triggerer $ASTRONOMER_NAMESPACE.log" -n $ASTRONOMER_NAMESPACE
      echo "Getting logs of pgbouncer in $ASTRONOMER_NAMESPACE Namespace ";kubectl logs deployment/astronomer-elasticsearch-client > "$ASTRONOMER_NAMESPACE/pgbouncer _$ASTRONOMER_NAMESPACE.log" -n $ASTRONOMER_NAMESPACE    
      echo "Getting logs of flower  in $ASTRONOMER_NAMESPACE Namespace ";kubectl logs deployment/astronomer-houston-worker> "$ASTRONOMER_NAMESPACE/flower _$ASTRONOMER_NAMESPACE.log" -n $ASTRONOMER_NAMESPACE
      echo "Getting logs of statsd in $ASTRONOMER_NAMESPACE Namespace ";kubectl logs deployment/astronomer-nginx > "$ASTRONOMER_NAMESPACE/nginx_$ASTRONOMER_NAMESPACE.log" -n $ASTRONOMER_NAMESPACE
      echo "Getting logs of redis in $ASTRONOMER_NAMESPACE Namespace ";kubectl logs deployment/astronomer-grafana > "$ASTRONOMER_NAMESPACE/grafana_$ASTRONOMER_NAMESPACE.log" -n $ASTRONOMER_NAMESPACE
      echo "Getting secrets in $ASTRONOMER_NAMESPACE Namespace ";kubectl logs sts/astronomer-stan -c stan > "$ASTRONOMER_NAMESPACE/stan_contatiner_$ASTRONOMER_NAMESPACE.log" -n $ASTRONOMER_NAMESPACE
      echo "Getting logs of worker in $ASTRONOMER_NAMESPACE Namespace ";kubectl logs sts/astronomer-prometheus -c prometheus   > "$ASTRONOMER_NAMESPACE/prometheus_container_$ASTRONOMER_NAMESPACE.log" -n $ASTRONOMER_NAMESPACE
      echo "Getting logs of webserverin $ASTRONOMER_NAMESPACE Namespace ";kubectl logs sts/astronomer-nats -c nats  > "$ASTRONOMER_NAMESPACE/nats_$ASTRONOMER_NAMESPACE.log" -n $ASTRONOMER_NAMESPACE
      echo "Getting logs of triggerer in $ASTRONOMER_NAMESPACE Namespace ";kubectl logs sts/astronomer-elasticsearch-master > "$ASTRONOMER_NAMESPACE/elasticsearch-master_$ASTRONOMER_NAMESPACE.log" -n $ASTRONOMER_NAMESPACE
      echo "Getting logs of pgbouncer in $ASTRONOMER_NAMESPACE Namespace ";kubectl logs sts/astronomer-elasticsearch-data > "$ASTRONOMER_NAMESPACE/elasticsearch-data_$ASTRONOMER_NAMESPACE.log" -n $ASTRONOMER_NAMESPACE    
      echo "Getting logs of flower  in $ASTRONOMER_NAMESPACE Namespace ";kubectl logs sts/astronomer-registry > "$ASTRONOMER_NAMESPACE/registry_$ASTRONOMER_NAMESPACE.log" -n $ASTRONOMER_NAMESPACE
      echo "Getting logs of statsd in $ASTRONOMER_NAMESPACE Namespace ";kubectl logs deployment/astronomer-kube-state > "$ASTRONOMER_NAMESPACE/kube-state_$ASTRONOMER_NAMESPACE.log" -n $ASTRONOMER_NAMESPACE
      echo "Getting logs of redis in $ASTRONOMER_NAMESPACE Namespace ";kubectl logs deployment/astronomer-kibana > "$ASTRONOMER_NAMESPACE/kibana_$ASTRONOMER_NAMESPACE.log" -n $ASTRONOMER_NAMESPACE
      echo "Collecting Some General enviornment Information Now"
      echo "Getting Node Status";kubectl get nodes -o wide > nodes.log > "$ASTRONOMER_NAMESPACE/nodes.log"
      echo "Getting Astro version status";astro version > Enviornment_Info.log > "$ASTRONOMER_NAMESPACE/nodes.log"
      echo "=================================================================================================" >> Enviornment_Info.log
      echo "Getting Astro version status";docker version >> Enviornment_Info.log > "$ASTRONOMER_NAMESPACE/nodes.log"
    done

 > houston_$ASTRONOMER_NAMESPACE.log
  > astro-ui_$ASTRONOMER_NAMESPACE.log
  > commander_$ASTRONOMER_NAMESPACE.log
  > elasticsearch-client_$ASTRONOMER_NAMESPACE.log
  > houston-worker_$ASTRONOMER_NAMESPACE.log
 > $ASTRONOMER_NAMESPACE.log
  > ASTRONOMER_NAMESPACE.log
 > $ASTRONOMER_NAMESPACE.log
   > $ASTRONOMER_NAMESPACE.log
 > $ASTRONOMER_NAMESPACE.log
 > $ASTRONOMER_NAMESPACE.log   
 






####Gathering All the Deployment namespace logs###
echo "Gathering All the Deployment namespace logs"
for NS in $(kubectl get ns --no-headers|grep -i "$ASTRONOMER_NAMESPACE-" | awk '{print $1}'); do
      echo "Getting Pod Running status in $NS Namespace";kubectl get pods -o wide > "$NS/pods_$NS.log" -n $NS
      echo "Getting events in $NS Namespace ";kubectl get events > "$NS/events_$NS.log" -n $NS
      echo "Getting secrets in $NS Namespace ";kubectl get secrets > "$NS/secrets_$NS.log" -n $NS
      echo "export release name ";export Release_Name=$(echo $NS| cut -c 12-)
      echo "Getting logs of scheduler in $NS Namespace ";kubectl logs deployment/$Release_Name-scheduler -c scheduler > "$NS/scheduler_$NS.log" -n $NS  
      echo "Getting logs of worker in $NS Namespace ";kubectl logs deployment/$Release_Name-worker -c worker > "$NS/worker_$NS.log" -n $NS
      echo "Getting logs of webserverin $NS Namespace ";kubectl logs deployment/$Release_Name-webserver -c webserver > "$NS/webserver$NS.log" -n $NS
      echo "Getting logs of triggerer in $NS Namespace ";kubectl logs deployment/$Release_Name-triggerer -c triggerer > "$NS/triggerer $NS.log" -n $NS
      echo "Getting logs of pgbouncer in $NS Namespace ";kubectl logs deployment/$Release_Name-pgbouncer -c pgbouncer > "$NS/pgbouncer _$NS.log" -n $NS    
      echo "Getting logs of flower  in $NS Namespace ";kubectl logs deployment/$Release_Name-flower > "$NS/flower _$NS.log" -n $NS
      echo "Getting logs of statsd in $NS Namespace ";kubectl logs deployment/$Release_Name-statsd > "$NS/statsd_$NS.log" -n $NS
      echo "Getting logs of redis in $NS Namespace ";kubectl logs sts/$Release_Name-redis > "$NS/redis_$NS.log" -n $NS
    done






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









echo "Gathering All the Deployment namespace logs"
for NS in $(kubectl get ns --no-headers|grep -i "$ASTRONOMER_NAMESPACE-" | awk '{print $1}'); do
      echo "Getting Pod Running status in $NS Namespace";kubectl get pods -o wide > "$NS/pods_$NS.log" -n $NS
      echo "Getting events in $NS Namespace ";kubectl get events > "$NS/events_$NS.log" -n $NS
      echo "Getting secrets in $NS Namespace ";kubectl get secrets > "$NS/secrets_$NS.log" -n $NS
      echo "export release name ";export Release_Name=$(echo $NS| cut -c 12-)
      echo "Getting logs of scheduler in $NS Namespace ";kubectl logs deployment/$Release_Name-scheduler -c scheduler > "$NS/scheduler_$NS.log" -n $NS  
      echo "Getting logs of worker in $NS Namespace ";kubectl logs deployment/$Release_Name-worker -c worker > "$NS/worker_$NS.log" -n $NS
      echo "Getting logs of webserverin $NS Namespace ";kubectl logs deployment/$Release_Name-webserver -c webserver > "$NS/webserver$NS.log" -n $NS
      echo "Getting logs of triggerer in $NS Namespace ";kubectl logs deployment/$Release_Name-triggerer -c triggerer > "$NS/triggerer $NS.log" -n $NS
      echo "Getting logs of pgbouncer in $NS Namespace ";kubectl logs deployment/$Release_Name-pgbouncer -c pgbouncer > "$NS/pgbouncer _$NS.log" -n $NS    
      echo "Getting logs of flower  in $NS Namespace ";kubectl logs deployment/$Release_Name-flower > "$NS/flower _$NS.log" -n $NS
      echo "Getting logs of statsd in $NS Namespace ";kubectl logs deployment/$Release_Name-statsd > "$NS/statsd_$NS.log" -n $NS
      echo "Getting logs of redis in $NS Namespace ";kubectl logs sts/$Release_Name-redis > "$NS/redis_$NS.log" -n $NS
    done






kubectl get pods POD_NAME_HERE -o jsonpath='{.spec.containers[*].name}' -n $NS



kubectl get pods astronomer-prometheus-0 -o jsonpath='{.spec.containers[*].name}' -n astronomer







export POD_NAME=astronomer-prometheus-0
echo "Getting container name for $POD_NAME";export container_name=$(kubectl get pods $POD_NAME -o jsonpath='{.spec.containers[*].name}' -n astronomer|awk '{NF-=0; OFS="\n"; $1=$1}1' | sort| awk '{ print $2}')
printenv|grep container_name
echo "export release name ";export Release_Name=$(echo $NS| cut -c 12-)






































#!/bin/bash
for NS in $(kubectl get ns --no-headers|grep astronomer | awk '{print $1}'); 
  do 
    for jobs in $(kubectl get cronjobs --no-headers -n $NS | awk '{print $1}') ; do
      echo $jobs;kubectl patch cronjobs $jobs -p '{"spec" : {"suspend" : false }}' -n $NS
    done
done