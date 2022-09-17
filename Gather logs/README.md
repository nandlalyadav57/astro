

****cre_astro_gather_logs****

We have to make sure to add below paramters in script.
Astronomer namespace (Astronomer Namespace to collect logs)
DIR (local directory to export the logs)

~~~
ASTRONOMER_NAMESPACE=
export DIR=
~~~

Usage: Just run the shell script as below and you will get required log files.

~~~
[root@DESKTOP-JJ9MM59 Gather logs]# sh cre_astro_gather_logs.sh
You have specied astronomer as a namespace where all the core Astronomer platform pods are running.Please make sure it's correctly specified.
Your astronomer release name is astronomer.
The path where logs would be stored is /tmp/n.
creating namespace astronomer Directory
creating namespace astronomer-atomic-protoplanet-2502 Directory
creating namespace astronomer-combusting-plane-6703 Directory
Gathering All the astronomer namespace logs
Getting Pod Running status in astronomer Namespace
Getting events in astronomer Namespace
Getting secrets in astronomer Namespace
Getting logs of worker in astronomer Namespace
Found 2 pods, using pod/astronomer-houston-cf67c758-qb5xj
Getting logs of webserverin astronomer Namespace
Found 2 pods, using pod/astronomer-astro-ui-5b44b44f4-bztlk
Getting logs of triggerer in astronomer Namespace
Found 2 pods, using pod/astronomer-commander-57559fc99f-7g5bx
Getting logs of pgbouncer in astronomer Namespace
Found 2 pods, using pod/astronomer-elasticsearch-client-6f8f4f5897-f946l
Getting logs of statsd in astronomer Namespace
Found 2 pods, using pod/astronomer-nginx-df4b74944-psjjf
Getting logs of redis in astronomer Namespace
Getting secrets in astronomer Namespace
Found 3 pods, using pod/astronomer-stan-0
Getting logs of worker in astronomer Namespace
Getting logs of webserverin astronomer Namespace
Found 3 pods, using pod/astronomer-nats-0
Getting logs of triggerer in astronomer Namespace
Found 3 pods, using pod/astronomer-elasticsearch-master-0
Getting logs of pgbouncer in astronomer Namespace
Found 2 pods, using pod/astronomer-elasticsearch-data-0
Getting logs of flower  in astronomer Namespace
Getting logs of statsd in astronomer Namespace
Getting logs of redis in astronomer Namespace
Collecting Some General enviornment Information Now
Getting Node Status
Getting Astro version status
Getting Astro version status
Getting helm status
Getting helm history in astronomer Namespace
Getting helm values from astronomer Namespace
Gathering All the Deployment namespace logs
Getting Pod Running status in astronomer-atomic-protoplanet-2502 Namespace
Getting events in astronomer-atomic-protoplanet-2502 Namespace
Getting secrets in astronomer-atomic-protoplanet-2502 Namespace
export release name
Your Release_Name in current namespace is atomic-protoplanet-2502.
Getting logs of scheduler in astronomer-atomic-protoplanet-2502 Namespace
Getting logs of worker in astronomer-atomic-protoplanet-2502 Namespace
Getting logs of webserverin astronomer-atomic-protoplanet-2502 Namespace
Getting logs of triggerer in astronomer-atomic-protoplanet-2502 Namespace
Getting logs of pgbouncer in astronomer-atomic-protoplanet-2502 Namespace
Getting logs of flower  in astronomer-atomic-protoplanet-2502 Namespace
Getting logs of statsd in astronomer-atomic-protoplanet-2502 Namespace
Getting logs of redis in astronomer-atomic-protoplanet-2502 Namespace
Getting helm history in astronomer-atomic-protoplanet-2502 Namespace
Getting helm values from astronomer-atomic-protoplanet-2502 Namespace
Getting Pod Running status in astronomer-combusting-plane-6703 Namespace
Getting events in astronomer-combusting-plane-6703 Namespace
Getting secrets in astronomer-combusting-plane-6703 Namespace
export release name
Your Release_Name in current namespace is combusting-plane-6703.
Getting logs of scheduler in astronomer-combusting-plane-6703 Namespace
Getting logs of worker in astronomer-combusting-plane-6703 Namespace
Found 2 pods, using pod/combusting-plane-6703-worker-5b78b88546-8lhv7
Getting logs of webserverin astronomer-combusting-plane-6703 Namespace
Getting logs of triggerer in astronomer-combusting-plane-6703 Namespace
Getting logs of pgbouncer in astronomer-combusting-plane-6703 Namespace
Getting logs of flower  in astronomer-combusting-plane-6703 Namespace
Getting logs of statsd in astronomer-combusting-plane-6703 Namespace
Getting logs of redis in astronomer-combusting-plane-6703 Namespace
Getting helm history in astronomer-combusting-plane-6703 Namespace
Getting helm values from astronomer-combusting-plane-6703 Namespace
creating GZ and zip files
tar: Removing leading `/' from member names
/tmp/n/
/tmp/n/nodes.log
/tmp/n/astronomer-combusting-plane-6703/
/tmp/n/astronomer-combusting-plane-6703/helm_values_combusting-plane-6703.yaml
/tmp/n/astronomer-combusting-plane-6703/pgbouncer _astronomer-combusting-plane-6703.log
/tmp/n/astronomer-combusting-plane-6703/triggerer astronomer-combusting-plane-6703.log
/tmp/n/astronomer-combusting-plane-6703/statsd_astronomer-combusting-plane-6703.log
/tmp/n/astronomer-combusting-plane-6703/pods_astronomer-combusting-plane-6703.log
/tmp/n/astronomer-combusting-plane-6703/redis_astronomer-combusting-plane-6703.log
/tmp/n/astronomer-combusting-plane-6703/webserverastronomer-combusting-plane-6703.log
/tmp/n/astronomer-combusting-plane-6703/helm_history_combusting-plane-6703.yaml
/tmp/n/astronomer-combusting-plane-6703/events_astronomer-combusting-plane-6703.log
/tmp/n/astronomer-combusting-plane-6703/scheduler_astronomer-combusting-plane-6703.log
/tmp/n/astronomer-combusting-plane-6703/flower _astronomer-combusting-plane-6703.log
/tmp/n/astronomer-combusting-plane-6703/worker_astronomer-combusting-plane-6703.log
/tmp/n/astronomer-combusting-plane-6703/secrets_astronomer-combusting-plane-6703.log
/tmp/n/astronomer/
/tmp/n/astronomer/pgbouncer _astronomer.log
/tmp/n/astronomer/nodes.log
/tmp/n/astronomer/kube-state_astronomer.log
/tmp/n/astronomer/secrets_astronomer.log
/tmp/n/astronomer/nginx_astronomer.log
/tmp/n/astronomer/kibana_astronomer.log
/tmp/n/astronomer/stan_contatiner_astronomer.log
/tmp/n/astronomer/helm_history_astronomer.log
/tmp/n/astronomer/helm_values_astronomer.yaml
/tmp/n/astronomer/prometheus_container_astronomer.log
/tmp/n/astronomer/elasticsearch-master_astronomer.log
/tmp/n/astronomer/helm_status.log
/tmp/n/astronomer/events_astronomer.log
/tmp/n/astronomer/registry_astronomer.log
/tmp/n/astronomer/worker_astronomer.log
/tmp/n/astronomer/webserverastronomer.log
/tmp/n/astronomer/elasticsearch-data_astronomer.log
/tmp/n/astronomer/nats_astronomer.log
/tmp/n/astronomer/triggerer astronomer.log
/tmp/n/astronomer/pods_astronomer.log
/tmp/n/astronomer/Enviornment_Info.log
/tmp/n/astronomer/grafana_astronomer.log
/tmp/n/astronomer-atomic-protoplanet-2502/
/tmp/n/astronomer-atomic-protoplanet-2502/flower _astronomer-atomic-protoplanet-2502.log
/tmp/n/astronomer-atomic-protoplanet-2502/pgbouncer _astronomer-atomic-protoplanet-2502.log
/tmp/n/astronomer-atomic-protoplanet-2502/pods_astronomer-atomic-protoplanet-2502.log
/tmp/n/astronomer-atomic-protoplanet-2502/helm_history_atomic-protoplanet-2502.yaml
/tmp/n/astronomer-atomic-protoplanet-2502/helm_values_atomic-protoplanet-2502.yaml
/tmp/n/astronomer-atomic-protoplanet-2502/worker_astronomer-atomic-protoplanet-2502.log
/tmp/n/astronomer-atomic-protoplanet-2502/triggerer astronomer-atomic-protoplanet-2502.log
/tmp/n/astronomer-atomic-protoplanet-2502/statsd_astronomer-atomic-protoplanet-2502.log
/tmp/n/astronomer-atomic-protoplanet-2502/events_astronomer-atomic-protoplanet-2502.log
/tmp/n/astronomer-atomic-protoplanet-2502/redis_astronomer-atomic-protoplanet-2502.log
/tmp/n/astronomer-atomic-protoplanet-2502/webserverastronomer-atomic-protoplanet-2502.log
/tmp/n/astronomer-atomic-protoplanet-2502/secrets_astronomer-atomic-protoplanet-2502.log
/tmp/n/astronomer-atomic-protoplanet-2502/scheduler_astronomer-atomic-protoplanet-2502.log
  adding: tmp/n/ (stored 0%)
  adding: tmp/n/nodes.log (stored 0%)
  adding: tmp/n/astronomer-combusting-plane-6703/ (stored 0%)
  adding: tmp/n/astronomer-combusting-plane-6703/helm_values_combusting-plane-6703.yaml (deflated 78%)
  adding: tmp/n/astronomer-combusting-plane-6703/pgbouncer _astronomer-combusting-plane-6703.log (deflated 89%)
  adding: tmp/n/astronomer-combusting-plane-6703/triggerer astronomer-combusting-plane-6703.log (deflated 84%)
  adding: tmp/n/astronomer-combusting-plane-6703/statsd_astronomer-combusting-plane-6703.log (deflated 49%)
  adding: tmp/n/astronomer-combusting-plane-6703/pods_astronomer-combusting-plane-6703.log (deflated 75%)
  adding: tmp/n/astronomer-combusting-plane-6703/redis_astronomer-combusting-plane-6703.log (deflated 90%)
  adding: tmp/n/astronomer-combusting-plane-6703/webserverastronomer-combusting-plane-6703.log (deflated 97%)
  adding: tmp/n/astronomer-combusting-plane-6703/helm_history_combusting-plane-6703.yaml (deflated 63%)
  adding: tmp/n/astronomer-combusting-plane-6703/events_astronomer-combusting-plane-6703.log (deflated 87%)
  adding: tmp/n/astronomer-combusting-plane-6703/scheduler_astronomer-combusting-plane-6703.log (deflated 93%)
  adding: tmp/n/astronomer-combusting-plane-6703/flower _astronomer-combusting-plane-6703.log (deflated 65%)
  adding: tmp/n/astronomer-combusting-plane-6703/worker_astronomer-combusting-plane-6703.log (deflated 96%)
  adding: tmp/n/astronomer-combusting-plane-6703/secrets_astronomer-combusting-plane-6703.log (deflated 85%)
  adding: tmp/n/astronomer/ (stored 0%)
  adding: tmp/n/astronomer/pgbouncer _astronomer.log (deflated 88%)
  adding: tmp/n/astronomer/nodes.log (deflated 85%)
  adding: tmp/n/astronomer/kube-state_astronomer.log (deflated 55%)
  adding: tmp/n/astronomer/secrets_astronomer.log (deflated 85%)
  adding: tmp/n/astronomer/nginx_astronomer.log (deflated 94%)
  adding: tmp/n/astronomer/kibana_astronomer.log (deflated 98%)
  adding: tmp/n/astronomer/stan_contatiner_astronomer.log (deflated 88%)
  adding: tmp/n/astronomer/helm_history_astronomer.log (deflated 74%)
  adding: tmp/n/astronomer/helm_values_astronomer.yaml (deflated 44%)
  adding: tmp/n/astronomer/prometheus_container_astronomer.log (deflated 92%)
  adding: tmp/n/astronomer/elasticsearch-master_astronomer.log (deflated 87%)
  adding: tmp/n/astronomer/helm_status.log (deflated 62%)
  adding: tmp/n/astronomer/events_astronomer.log (deflated 76%)
  adding: tmp/n/astronomer/registry_astronomer.log (deflated 98%)
  adding: tmp/n/astronomer/worker_astronomer.log (deflated 93%)
  adding: tmp/n/astronomer/webserverastronomer.log (deflated 98%)
  adding: tmp/n/astronomer/elasticsearch-data_astronomer.log (deflated 87%)
  adding: tmp/n/astronomer/nats_astronomer.log (deflated 73%)
  adding: tmp/n/astronomer/triggerer astronomer.log (deflated 91%)
  adding: tmp/n/astronomer/pods_astronomer.log (deflated 87%)
  adding: tmp/n/astronomer/Enviornment_Info.log (deflated 61%)
  adding: tmp/n/astronomer/grafana_astronomer.log (deflated 75%)
  adding: tmp/n/astronomer-atomic-protoplanet-2502/ (stored 0%)
  adding: tmp/n/astronomer-atomic-protoplanet-2502/flower _astronomer-atomic-protoplanet-2502.log (deflated 63%)
  adding: tmp/n/astronomer-atomic-protoplanet-2502/pgbouncer _astronomer-atomic-protoplanet-2502.log (deflated 89%)
  adding: tmp/n/astronomer-atomic-protoplanet-2502/pods_astronomer-atomic-protoplanet-2502.log (deflated 74%)
  adding: tmp/n/astronomer-atomic-protoplanet-2502/helm_history_atomic-protoplanet-2502.yaml (deflated 65%)
  adding: tmp/n/astronomer-atomic-protoplanet-2502/helm_values_atomic-protoplanet-2502.yaml (deflated 78%)
  adding: tmp/n/astronomer-atomic-protoplanet-2502/worker_astronomer-atomic-protoplanet-2502.log (deflated 96%)
  adding: tmp/n/astronomer-atomic-protoplanet-2502/triggerer astronomer-atomic-protoplanet-2502.log (deflated 85%)
  adding: tmp/n/astronomer-atomic-protoplanet-2502/statsd_astronomer-atomic-protoplanet-2502.log (deflated 48%)
  adding: tmp/n/astronomer-atomic-protoplanet-2502/events_astronomer-atomic-protoplanet-2502.log (deflated 87%)
  adding: tmp/n/astronomer-atomic-protoplanet-2502/redis_astronomer-atomic-protoplanet-2502.log (deflated 90%)
  adding: tmp/n/astronomer-atomic-protoplanet-2502/webserverastronomer-atomic-protoplanet-2502.log (deflated 97%)
  adding: tmp/n/astronomer-atomic-protoplanet-2502/secrets_astronomer-atomic-protoplanet-2502.log (deflated 85%)
  adding: tmp/n/astronomer-atomic-protoplanet-2502/scheduler_astronomer-atomic-protoplanet-2502.log (deflated 93%)
Please attach the zip file or .gz file created in /tmp to the zendesk ticket for reference.
~~~














Regarding other Shell Script
****astro_gather_logs_v1****

You need to replace below parameters:

Astronomer namespace (Astronomer Namespace to collect logs)
Deployment namespace (Deployment Namespace to collect logs)
DIR (local directory to export the logs)


~~~
ASTRONOMER_NAMESPACE=
DEPLOYMENT_NS1=
export DIR=
~~~



Copy the script content from [here](https://github.com/nandlalyadav57/astro/blob/main/Gather%20logs/astro_gather_logs_v1.sh) and run it in the command line to get the necessary logs.




Expected output: Log GZ file inside $DIR & A Log zip file containing same list of files which are pod logs,node status,events,helm values etc. in the required namespaces.


![image](https://user-images.githubusercontent.com/33649510/190684618-33486992-f732-460d-b340-d593f34f73ab.png)
![image](https://user-images.githubusercontent.com/33649510/190684736-1a1be75e-f3cc-4dde-a414-04c23a855b14.png)


~~~~
[root@DESKTOP-JJ9MM59 tmp]# #!/bin/bash
[root@DESKTOP-JJ9MM59 tmp]# timestamp=`date '+%d/%m/%Y %H:%M:%S'`
 the name of the astronomer ASTRONOMER_NAMESPACE bel[root@DESKTOP-JJ9MM59 tmp]# # Put the name of the astronomer ASTRONOMER_NAMESPACE below
t AST[root@DESKTOP-JJ9MM59 tmp]# export ASTRONOMER_NAMESPACE=astronomer
Get As[root@DESKTOP-JJ9MM59 tmp]# #Get Astronomer Release name
xport A[root@DESKTOP-JJ9MM59 tmp]# export ASTRONOMER_RELEASE=$(helm ls -A|grep -i "astronomer"|head -n1 | awk '{ print $2}')
 Put the name of the deployment ASTRONOMER_NAMESPACE 1 where we are having issues
export DEPLOYMENT_NS1=astronomer-combusting-plane-6703
# removing astronomer- and putting as release name
export Release1=$(echo $DEPLOYMENT_NS1| cut -c 12-)
#setting log directory
export DIR=/tmp/astro_logs
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
#####====================================================================================================================================================#####
#####====================================================================================================================================================#####
echo "Gathering Helm logs"
#####====================================================================================================================================================#####
helm ls -A > helm_status.log
helm history $ASTRONOMER_RELEASE -n $ASTRONOMER_NAMESPACE > helm_history_$ASTRONOMER_RELEASE.log
helm history $Release1 -n $DEPLOYMENT_NS1 > helm_history_$Release1.log
helm get values $ASTRONOMER_RELEASE -n $ASTRONOMER_NAMESPACE -o yaml > helm_values_$ASTRONOMER_RELEASE.yaml
helm get values $Release1 -n $DEPLOYMENT_NS1 -o yaml > helm_values_$Release1.yaml
#####=============================================================[root@DESKTOP-JJ9MM59 tmp]# # Put the name of the deployment ASTRONOMER_NAMESPACE 1 where we are having issues
[root@DESKTOP-JJ9MM59 tmp]# export DEPLOYMENT_NS1=astronomer-combusting-plane-6703
[root@DESKTOP-JJ9MM59 tmp]# # removing astronomer- and putting as release name
[root@DESKTOP-JJ9MM59 tmp]# export Release1=$(echo $DEPLOYMENT_NS1| cut -c 12-)
[root@DESKTOP-JJ9MM59 tmp]# #setting log directory
ather[root@DESKTOP-JJ9MM59 tmp]# export DIR=/tmp/astro_logs
[root@DESKTOP-JJ9MM59 tmp]# #####====================================================================================================================================================#####
[root@DESKTOP-JJ9MM59 tmp]# echo $ASTRONOMER_NAMESPACE
=astronomer
[root@DESKTOP-JJ9MM59 tmp]# echo $ASTRONOMER_RELEASE
astronomer
[root@DESKTOP-JJ9MM59 tmp]# echo $DEPLOYMENT_NS1
astronomer-combusting-plane-6703
[root@DESKTOP-JJ9MM59 tmp]# echo $Release1
combusting-plane-6703
[root@DESKTOP-JJ9MM59 tmp]# echo $DIR
/tmp/astro_logs
LOYMENT_NS[root@DESKTOP-JJ9MM59 tmp]# #####====================================================================================================================================================#####
[root@DESKTOP-JJ9MM59 tmp]# mkdir -p $DIR
[root@DESKTOP-JJ9MM59 tmp]# chmod -R 777 $DIR
[root@DESKTOP-JJ9MM59 tmp]# cd $DIR
 -n $DEP[root@DESKTOP-JJ9MM59 astro_logs]# #####====================================================================================================================================================#####
[root@DESKTOP-JJ9MM59 astro_logs]# kubectl config set-context --current --namespace=$ASTRONOMER_NAMESPACE
Context "arn:aws:eks:us-east-2:913240246008:cluster/astronomer-HBXZOtyA" modified.
[root@DESKTOP-JJ9MM59 astro_logs]# echo "Gathering $ASTRONOMER_NAMESPACE events & logs"
Gathering astronomer events & logs
[root@DESKTOP-JJ9MM59 astro_logs]# #####====================================================================================================================================================#####
[root@DESKTOP-JJ9MM59 astro_logs]# kubectl -n $ASTRONOMER_NAMESPACE get pods -o wide > pods_$ASTRONOMER_NAMESPACE.log
[root@DESKTOP-JJ9MM59 astro_logs]# kubectl -n $ASTRONOMER_NAMESPACE get events  > events_$ASTRONOMER_NAMESPACE.log
[root@DESKTOP-JJ9MM59 astro_logs]# kubectl -n $ASTRONOMER_NAMESPACE get secrets  > secrets_$ASTRONOMER_NAMESPACE.log
ment/$Release1-statsd > statsd_$Release1.log
kubectl -n $DEPLOYMENT_NS1 logs sts/$[root@DESKTOP-JJ9MM59 astro_logs]# kubectl get nodes -o wide > nodes.log
Release1-redis > redis_$Release1.log
#[root@DESKTOP-JJ9MM59 astro_logs]# kubectl -n $ASTRONOMER_NAMESPACE logs deployment/astronomer-houston > houston_$ASTRONOMER_NAMESPACE.log
=================================================================Found 2 pods, using pod/astronomer-houston-cf67c758-qb5xj
[root@DESKTOP-JJ9MM59 astro_logs]# kubectl -n $ASTRONOMER_NAMESPACE logs deployment/astronomer-astro-ui  > astro-ui_$ASTRONOMER_NAMESPACE.log
Found 2 pods, using pod/astronomer-astro-ui-5b44b44f4-bztlk
[root@DESKTOP-JJ9MM59 astro_logs]# kubectl -n $ASTRONOMER_NAMESPACE logs deployment/astronomer-commander > commander_$ASTRONOMER_NAMESPACE.log
=#####
ecFound 2 pods, using pod/astronomer-commander-57559fc99f-7g5bx
[root@DESKTOP-JJ9MM59 astro_logs]# kubectl -n $ASTRONOMER_NAMESPACE logs deployment/astronomer-elasticsearch-client > elasticsearch-client_$ASTRONOMER_NAMESPACE.log
Found 2 pods, using pod/astronomer-elasticsearch-client-6f8f4f5897-f946l
[root@DESKTOP-JJ9MM59 astro_logs]# kubectl -n $ASTRONOMER_NAMESPACE logs deployment/astronomer-houston-worker > houston-worker_$ASTRONOMER_NAMESPACE.log
Found 2 pods, using pod/astronomer-houston-worker-f68cb689b-6cbdr
[root@DESKTOP-JJ9MM59 astro_logs]# kubectl -n $ASTRONOMER_NAMESPACE logs deployment/astronomer-nginx > nginx_$ASTRONOMER_NAMESPACE.log
Found 2 pods, using pod/astronomer-nginx-df4b74944-psjjf
[root@DESKTOP-JJ9MM59 astro_logs]# kubectl -n $ASTRONOMER_NAMESPACE logs deployment/astronomer-grafana > grafana_$ASTRONOMER_NAMESPACE.log
[root@DESKTOP-JJ9MM59 astro_logs]# kubectl -n $ASTRONOMER_NAMESPACE logs deployment/astronomer-kibana > kibana_$ASTRONOMER_NAMESPACE.log
[root@DESKTOP-JJ9MM59 astro_logs]# kubectl -n $ASTRONOMER_NAMESPACE logs deployment/astronomer-kube-state > kube-state_$ASTRONOMER_NAMESPACE.log
[root@DESKTOP-JJ9MM59 astro_logs]# kubectl -n $ASTRONOMER_NAMESPACE logs sts/astronomer-registry > registry_$ASTRONOMER_NAMESPACE.log
[root@DESKTOP-JJ9MM59 astro_logs]# kubectl -n $ASTRONOMER_NAMESPACE logs sts/astronomer-elasticsearch-data  > elasticsearch-data_$ASTRONOMER_NAMESPACE.log
Found 2 pods, using pod/astronomer-elasticsearch-data-0
[root@DESKTOP-JJ9MM59 astro_logs]# kubectl -n $ASTRONOMER_NAMESPACE logs sts/astronomer-elasticsearch-master > elasticsearch-master_$ASTRONOMER_NAMESPACE.log
Found 3 pods, using pod/astronomer-elasticsearch-master-0
[root@DESKTOP-JJ9MM59 astro_logs]# kubectl -n $ASTRONOMER_NAMESPACE logs sts/astronomer-nats -c nats > nats_$ASTRONOMER_NAMESPACE.log
Found 3 pods, using pod/astronomer-nats-0
[root@DESKTOP-JJ9MM59 astro_logs]# kubectl -n $ASTRONOMER_NAMESPACE logs sts/astronomer-prometheus -c prometheus > prometheus_container_$ASTRONOMER_NAMESPACE.log
[root@DESKTOP-JJ9MM59 astro_logs]# kubectl -n $ASTRONOMER_NAMESPACE logs sts/astronomer-stan -c stan > stan_contatiner_$ASTRONOMER_NAMESPACE.log
Found 3 pods, using pod/astronomer-stan-0
[root@DESKTOP-JJ9MM59 astro_logs]# #####====================================================================================================================================================#####
[root@DESKTOP-JJ9MM59 astro_logs]# #####====================================================================================================================================================#####
[root@DESKTOP-JJ9MM59 astro_logs]# echo "Gathering Helm logs"
Gathering Helm logs
[root@DESKTOP-JJ9MM59 astro_logs]# #####====================================================================================================================================================#####
[root@DESKTOP-JJ9MM59 astro_logs]# helm ls -A > helm_status.log
[root@DESKTOP-JJ9MM59 astro_logs]# helm history $ASTRONOMER_RELEASE -n $ASTRONOMER_NAMESPACE > helm_history_$ASTRONOMER_RELEASE.log
[root@DESKTOP-JJ9MM59 astro_logs]# helm history $Release1 -n $DEPLOYMENT_NS1 > helm_history_$Release1.log
[root@DESKTOP-JJ9MM59 astro_logs]# helm get values $ASTRONOMER_RELEASE -n $ASTRONOMER_NAMESPACE -o yaml > helm_values_$ASTRONOMER_RELEASE.yaml
[root@DESKTOP-JJ9MM59 astro_logs]# helm get values $Release1 -n $DEPLOYMENT_NS1 -o yaml > helm_values_$Release1.yaml
[root@DESKTOP-JJ9MM59 astro_logs]# #####====================================================================================================================================================#####
[root@DESKTOP-JJ9MM59 astro_logs]# #####====================================================================================================================================================#####
[root@DESKTOP-JJ9MM59 astro_logs]# echo "Gathering $DEPLOYMENT_NS1 events & logs"
Gathering astronomer-combusting-plane-6703 events & logs
[root@DESKTOP-JJ9MM59 astro_logs]# kubectl config set-context --current --namespace=$DEPLOYMENT_NS1
Context "arn:aws:eks:us-east-2:913240246008:cluster/astronomer-HBXZOtyA" modified.
[root@DESKTOP-JJ9MM59 astro_logs]# #####====================================================================================================================================================#####
[root@DESKTOP-JJ9MM59 astro_logs]# kubectl -n $DEPLOYMENT_NS1 get pods -o wide > pods_$DEPLOYMENT_NS1.log
[root@DESKTOP-JJ9MM59 astro_logs]# kubectl -n $DEPLOYMENT_NS1 get events  > events_$DEPLOYMENT_NS1.log
[root@DESKTOP-JJ9MM59 astro_logs]# kubectl -n $DEPLOYMENT_NS1 get secrets  > secrets_$DEPLOYMENT_NS1.log
[root@DESKTOP-JJ9MM59 astro_logs]# kubectl -n $DEPLOYMENT_NS1 logs deployment/$Release1-scheduler -c scheduler > scheduler_$Release1.log
[root@DESKTOP-JJ9MM59 astro_logs]# kubectl -n $DEPLOYMENT_NS1 logs deployment/$Release1-worker -c worker > worker_$Release1.log
Found 2 pods, using pod/combusting-plane-6703-worker-5b78b88546-8lhv7
[root@DESKTOP-JJ9MM59 astro_logs]# kubectl -n $DEPLOYMENT_NS1 logs deployment/$Release1-webserver -c webserver > webserver_$Release1.log
[root@DESKTOP-JJ9MM59 astro_logs]# kubectl -n $DEPLOYMENT_NS1 logs deployment/$Release1-triggerer -c triggerer > triggerer$Release1.log
[root@DESKTOP-JJ9MM59 astro_logs]# kubectl -n $DEPLOYMENT_NS1 logs deployment/$Release1-pgbouncer -c pgbouncer > pgbouncer$Release1.log
[root@DESKTOP-JJ9MM59 astro_logs]# kubectl -n $DEPLOYMENT_NS1 logs deployment/$Release1-flower > flower_$Release1.log
[root@DESKTOP-JJ9MM59 astro_logs]# kubectl -n $DEPLOYMENT_NS1 logs deployment/$Release1-statsd > statsd_$Release1.log
[root@DESKTOP-JJ9MM59 astro_logs]# kubectl -n $DEPLOYMENT_NS1 logs sts/$Release1-redis > redis_$Release1.log
[root@DESKTOP-JJ9MM59 astro_logs]# #####====================================================================================================================================================#####
[root@DESKTOP-JJ9MM59 astro_logs]# #####====================================================================================================================================================#####
[root@DESKTOP-JJ9MM59 astro_logs]# echo "creating GZ and zip files"
creating GZ and zip files
[root@DESKTOP-JJ9MM59 astro_logs]# #####====================================================================================================================================================#####
[root@DESKTOP-JJ9MM59 astro_logs]# tar -czvf $DIR_$(date +%F).tar.gz $DIR
tar: Removing leading `/' from member names
/tmp/astro_logs/
/tmp/astro_logs/houston-worker_astronomer.log
/tmp/astro_logs/helm_values_combusting-plane-6703.yaml
/tmp/astro_logs/nodes.log
/tmp/astro_logs/kube-state_astronomer.log
/tmp/astro_logs/secrets_astronomer.log
/tmp/astro_logs/nginx_astronomer.log
/tmp/astro_logs/triggerercombusting-plane-6703.log
/tmp/astro_logs/kibana_astronomer.log
/tmp/astro_logs/helm_history_combusting-plane-6703.log
/tmp/astro_logs/stan_contatiner_astronomer.log
/tmp/astro_logs/helm_history_astronomer.log
/tmp/astro_logs/houston_astronomer.log
/tmp/astro_logs/pods_astronomer-combusting-plane-6703.log
/tmp/astro_logs/helm_values_astronomer.yaml
/tmp/astro_logs/prometheus_container_astronomer.log
/tmp/astro_logs/elasticsearch-master_astronomer.log
/tmp/astro_logs/commander_astronomer.log
/tmp/astro_logs/helm_status.log
/tmp/astro_logs/events_astronomer.log
/tmp/astro_logs/worker_combusting-plane-6703.log
/tmp/astro_logs/registry_astronomer.log
/tmp/astro_logs/events_astronomer-combusting-plane-6703.log
/tmp/astro_logs/elasticsearch-data_astronomer.log
/tmp/astro_logs/elasticsearch-client_astronomer.log
/tmp/astro_logs/statsd_combusting-plane-6703.log
/tmp/astro_logs/astro-ui_astronomer.log
/tmp/astro_logs/nats_astronomer.log
/tmp/astro_logs/scheduler_combusting-plane-6703.log
/tmp/astro_logs/2022-09-16.tar.gz
tar: /tmp/astro_logs/2022-09-16.tar.gz: file changed as we read it
/tmp/astro_logs/pgbouncercombusting-plane-6703.log
/tmp/astro_logs/webserver_combusting-plane-6703.log
/tmp/astro_logs/flower_combusting-plane-6703.log
/tmp/astro_logs/redis_combusting-plane-6703.log
/tmp/astro_logs/pods_astronomer.log
/tmp/astro_logs/grafana_astronomer.log
/tmp/astro_logs/secrets_astronomer-combusting-plane-6703.log
[root@DESKTOP-JJ9MM59 astro_logs]# zip -r $DIR.zip $DIR
  adding: tmp/astro_logs/ (stored 0%)
  adding: tmp/astro_logs/houston-worker_astronomer.log (deflated 82%)
  adding: tmp/astro_logs/helm_values_combusting-plane-6703.yaml (deflated 78%)
  adding: tmp/astro_logs/nodes.log (deflated 85%)
  adding: tmp/astro_logs/kube-state_astronomer.log (deflated 55%)
  adding: tmp/astro_logs/secrets_astronomer.log (deflated 84%)
  adding: tmp/astro_logs/nginx_astronomer.log (deflated 93%)
  adding: tmp/astro_logs/triggerercombusting-plane-6703.log (deflated 83%)
  adding: tmp/astro_logs/kibana_astronomer.log (deflated 97%)
  adding: tmp/astro_logs/helm_history_combusting-plane-6703.log (deflated 63%)
  adding: tmp/astro_logs/stan_contatiner_astronomer.log (deflated 88%)
  adding: tmp/astro_logs/helm_history_astronomer.log (deflated 74%)
  adding: tmp/astro_logs/houston_astronomer.log (deflated 93%)
  adding: tmp/astro_logs/pods_astronomer-combusting-plane-6703.log (deflated 75%)
  adding: tmp/astro_logs/helm_values_astronomer.yaml (deflated 44%)
  adding: tmp/astro_logs/prometheus_container_astronomer.log (deflated 94%)
  adding: tmp/astro_logs/elasticsearch-master_astronomer.log (deflated 87%)
  adding: tmp/astro_logs/commander_astronomer.log (deflated 91%)
  adding: tmp/astro_logs/helm_status.log (deflated 62%)
  adding: tmp/astro_logs/events_astronomer.log (deflated 77%)
  adding: tmp/astro_logs/worker_combusting-plane-6703.log (deflated 96%)
  adding: tmp/astro_logs/registry_astronomer.log (deflated 98%)
  adding: tmp/astro_logs/events_astronomer-combusting-plane-6703.log (deflated 85%)
  adding: tmp/astro_logs/elasticsearch-data_astronomer.log (deflated 87%)
  adding: tmp/astro_logs/elasticsearch-client_astronomer.log (deflated 88%)
  adding: tmp/astro_logs/statsd_combusting-plane-6703.log (deflated 49%)
  adding: tmp/astro_logs/astro-ui_astronomer.log (deflated 98%)
  adding: tmp/astro_logs/nats_astronomer.log (deflated 73%)
  adding: tmp/astro_logs/scheduler_combusting-plane-6703.log (deflated 93%)
  adding: tmp/astro_logs/2022-09-16.tar.gz (deflated 9%)
  adding: tmp/astro_logs/pgbouncercombusting-plane-6703.log (deflated 89%)
  adding: tmp/astro_logs/webserver_combusting-plane-6703.log (deflated 97%)
  adding: tmp/astro_logs/flower_combusting-plane-6703.log (deflated 65%)
  adding: tmp/astro_logs/redis_combusting-plane-6703.log (deflated 90%)
  adding: tmp/astro_logs/pods_astronomer.log (deflated 88%)
  adding: tmp/astro_logs/grafana_astronomer.log (deflated 75%)
  adding: tmp/astro_logs/secrets_astronomer-combusting-plane-6703.log (deflated 85%)
[root@DESKTOP-JJ9MM59 astro_logs]# #####====================================================================================================================================================#####
[root@DESKTOP-JJ9MM59 astro_logs]# echo "Share the log or zip file for troubleshooting"
Share the log or zip file for troubleshooting
[root@DESKTOP-JJ9MM59 astro_logs]# #####====================================================================================================================================================#####
~~~


