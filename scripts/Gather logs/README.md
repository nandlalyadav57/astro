
****cre_astro_gather_logs****
====================================

It will export pod logs,events,helm values,node status,secrets,rs,ingres,jobs etc. 
Also, it will include describe output of all the nodes & the status of pods that are in a bad state.


We have to make sure to add below paramters in script.

Astronomer namespace (Astronomer Namespace to collect logs)
DIR (local directory to export the logs)

~~~
ASTRONOMER_NAMESPACE=
export DIR=
~~~

Usage: Just run the shell script as below and you will get required log files.


Make sure your script is in unix format and executable:

~~~
dos2unix *.sh 
chmod 755 *.sh
~~~

Expected output:



![image](https://user-images.githubusercontent.com/33649510/190877157-16c08ecb-a20d-4e03-b578-04a5aa2317d6.png)
![image](https://user-images.githubusercontent.com/33649510/190877503-5ada590a-75cf-41bd-93e0-7b6d59bb7f2c.png)

![image](https://user-images.githubusercontent.com/33649510/190877507-43b1fbc5-b324-46ba-8c5d-3938778af85f.png)

![image](https://user-images.githubusercontent.com/33649510/190877494-200d7b26-2e78-439b-8e35-8c419aad3858.png)

![image](https://user-images.githubusercontent.com/33649510/190877458-1bb63236-141f-4f15-86e6-47a99023fc28.png)












~~~
[root@DESKTOP-JJ9MM59 Gather logs]# sh cre_astro_gather_logs.sh
====> Here is the list of Namespaces found:
NAME                                STATUS   AGE
astronomer                          Active   12d
astronomer-combusting-plane-6703    Active   11d
astronomer-flickering-rocket-1376   Active   12h
cluster-autoscaler                  Active   12d
default                             Active   12d
kube-node-lease                     Active   12d
kube-public                         Active   12d
kube-system                         Active   12d
====> You have specied astronomer as a namespace where all the core Astronomer platform pods are running.Please make sure it's correctly specified.
====> Your astronomer release name is astronomer.
====> The path where logs would be stored is /tmp/n.
====> Creating log file directory /tmp/n.
creating namespace astronomer Directory
creating namespace astronomer-combusting-plane-6703 Directory
creating namespace astronomer-flickering-rocket-1376 Directory
======================Gathering Describe output of Bad state pod======================
flickering-rocket-1376-scheduler-585bcfc49f-kmqnv pod is in bad state
Collecting Describe output of bad state pods in astronomer-flickering-rocket-1376 Namespace
flickering-rocket-1376-scheduler-585bcfc49f-x5txg pod is in bad state
Collecting Describe output of bad state pods in astronomer-flickering-rocket-1376 Namespace
No resources found in default namespace.
No resources found in kube-node-lease namespace.
No resources found in kube-public namespace.
======================Gathering Describe output of all the nodes======================
Collecting Describe output of Node ip-10-234-1-104.us-east-2.compute.internal
Collecting Describe output of Node ip-10-234-1-159.us-east-2.compute.internal
Collecting Describe output of Node ip-10-234-1-239.us-east-2.compute.internal
Collecting Describe output of Node ip-10-234-1-242.us-east-2.compute.internal
Collecting Describe output of Node ip-10-234-1-246.us-east-2.compute.internal
Collecting Describe output of Node ip-10-234-2-100.us-east-2.compute.internal
Collecting Describe output of Node ip-10-234-2-153.us-east-2.compute.internal
Collecting Describe output of Node ip-10-234-2-22.us-east-2.compute.internal
Collecting Describe output of Node ip-10-234-2-242.us-east-2.compute.internal
Collecting Describe output of Node ip-10-234-2-44.us-east-2.compute.internal
======================Gathering All the astronomer namespace logs======================
Gathering logs of houston in astronomer Namespace
Found 2 pods, using pod/astronomer-houston-cf67c758-qb5xj
Gathering logs of houston-worker in astronomer Namespace
Found 2 pods, using pod/astronomer-houston-worker-f68cb689b-6cbdr
Gathering logs of astro-ui in astronomer Namespace
Found 2 pods, using pod/astronomer-astro-ui-5b44b44f4-bztlk
Gathering logs of commander in astronomer Namespace
Found 2 pods, using pod/astronomer-commander-57559fc99f-7g5bx
Gathering logs of nginx in astronomer Namespace
Found 2 pods, using pod/astronomer-nginx-df4b74944-psjjf
Gathering logs of grafana in astronomer Namespace
Gathering logs of kube-state in astronomer Namespace
Gathering logs of kibana in astronomer Namespace
Gathering logs of nginx-default-backend in astronomer Namespace
Found 2 pods, using pod/astronomer-nginx-default-backend-864d4468b8-ckv6d
Gathering logs of elasticsearch-exporterin astronomer Namespace
Gathering logs of elasticsearch-nginx in astronomer Namespace
Gathering logs of cli-install in astronomer Namespace
Gathering logs of elasticsearch-client in astronomer Namespace
Found 2 pods, using pod/astronomer-elasticsearch-client-6f8f4f5897-f946l
Gathering logs of elasticsearch-master in astronomer Namespace
Found 3 pods, using pod/astronomer-elasticsearch-master-0
Gathering logs of elasticsearch-data in astronomer Namespace
Found 2 pods, using pod/astronomer-elasticsearch-data-0
Gathering logs of stan in astronomer Namespace
Found 3 pods, using pod/astronomer-stan-0
Gathering logs of registry in astronomer Namespace
Gathering logs of prometheus in astronomer Namespace
Gathering logs of nats in astronomer Namespace
Found 3 pods, using pod/astronomer-nats-0
Gathering logs of alertmanager in astronomer Namespace
======================Collecting Some General enviornment Information in the astronomer======================
Gathering get all status  in astronomer Namespace
Gathering All replica status in all namespaces
Gathering Pod Running status in astronomer Namespace
Gathering events in astronomer Namespace
Gathering secrets in astronomer Namespace
Gathering Node Status
Gathering kube-system pod status
Gathering sevice Status in astronomer Namespace
Gathering persistent volume Status in astronomer Namespace
Gathering ingress Status in astronomer Namespace
Gathering cronjobs Status in astronomer Namespace
Gathering jobs Status in astronomer Namespace
Gathering Astro version status
Gathering docker version status
Gathering helm version status
Gathering helm status
Gathering helm history in astronomer Namespace
Gathering helm values from astronomer Namespace
======================Collecting Some General enviornment Information in the astronomer-combusting-plane-6703======================
Gathering get all status  in astronomer-combusting-plane-6703 Namespace
Gathering All replica status in all namespaces
Gathering Pod Running status in astronomer-combusting-plane-6703 Namespace
Gathering events in astronomer-combusting-plane-6703 Namespace
Gathering secrets in astronomer-combusting-plane-6703 Namespace
Gathering sevice Status in astronomer-combusting-plane-6703 Namespace
Gathering persistent volume Status in astronomer-combusting-plane-6703 Namespace
Gathering ingress Status in astronomer-combusting-plane-6703 Namespace
Gathering cronjobs Status in astronomer-combusting-plane-6703 Namespace
Gathering jobs Status in astronomer-combusting-plane-6703 Namespace
Exporting Release name
Your Release_Name in current namespace is combusting-plane-6703.
======================Gathering All the Deployment namespace logs in the astronomer-combusting-plane-6703======================
Gathering logs of scheduler in astronomer-combusting-plane-6703 Namespace
Gathering logs of worker in astronomer-combusting-plane-6703 Namespace
Found 2 pods, using pod/combusting-plane-6703-worker-5b78b88546-8lhv7
Gathering logs of webserverin astronomer-combusting-plane-6703 Namespace
Gathering logs of triggerer in astronomer-combusting-plane-6703 Namespace
Gathering logs of pgbouncer in astronomer-combusting-plane-6703 Namespace
Gathering logs of flower  in astronomer-combusting-plane-6703 Namespace
Gathering logs of statsd in astronomer-combusting-plane-6703 Namespace
Gathering logs of redis in astronomer-combusting-plane-6703 Namespace
Gathering helm history in astronomer-combusting-plane-6703 Namespace
Gathering helm values from astronomer-combusting-plane-6703 Namespace
======================Collecting Some General enviornment Information in the astronomer-flickering-rocket-1376======================
Gathering get all status  in astronomer-flickering-rocket-1376 Namespace
Gathering All replica status in all namespaces
Gathering Pod Running status in astronomer-flickering-rocket-1376 Namespace
Gathering events in astronomer-flickering-rocket-1376 Namespace
Gathering secrets in astronomer-flickering-rocket-1376 Namespace
Gathering sevice Status in astronomer-flickering-rocket-1376 Namespace
Gathering persistent volume Status in astronomer-flickering-rocket-1376 Namespace
Gathering ingress Status in astronomer-flickering-rocket-1376 Namespace
Gathering cronjobs Status in astronomer-flickering-rocket-1376 Namespace
Gathering jobs Status in astronomer-flickering-rocket-1376 Namespace
Exporting Release name
Your Release_Name in current namespace is flickering-rocket-1376.
======================Gathering All the Deployment namespace logs in the astronomer-flickering-rocket-1376======================
Gathering logs of scheduler in astronomer-flickering-rocket-1376 Namespace
Found 2 pods, using pod/flickering-rocket-1376-scheduler-585bcfc49f-kmqnv
Error from server (BadRequest): container "scheduler" in pod "flickering-rocket-1376-scheduler-585bcfc49f-kmqnv" is waiting to start: PodInitializing
Gathering logs of worker in astronomer-flickering-rocket-1376 Namespace
Gathering logs of webserverin astronomer-flickering-rocket-1376 Namespace
Gathering logs of triggerer in astronomer-flickering-rocket-1376 Namespace
Gathering logs of pgbouncer in astronomer-flickering-rocket-1376 Namespace
Gathering logs of flower  in astronomer-flickering-rocket-1376 Namespace
Gathering logs of statsd in astronomer-flickering-rocket-1376 Namespace
Gathering logs of redis in astronomer-flickering-rocket-1376 Namespace
Gathering helm history in astronomer-flickering-rocket-1376 Namespace
Gathering helm values from astronomer-flickering-rocket-1376 Namespace
======================creating GZ and zip files======================
tar: Removing leading `/' from member names
/tmp/n/
/tmp/n/astronomer-combusting-plane-6703/
/tmp/n/astronomer-combusting-plane-6703/helm_values_combusting-plane-6703.yaml
/tmp/n/astronomer-combusting-plane-6703/pgbouncer _astronomer-combusting-plane-6703.log
/tmp/n/astronomer-combusting-plane-6703/triggerer astronomer-combusting-plane-6703.log
/tmp/n/astronomer-combusting-plane-6703/rs_status_all_namespaces.log
/tmp/n/astronomer-combusting-plane-6703/getall_status_astronomer-combusting-plane-6703.log
/tmp/n/astronomer-combusting-plane-6703/svc_astronomer-combusting-plane-6703.log
/tmp/n/astronomer-combusting-plane-6703/pvc_astronomer-combusting-plane-6703.log
/tmp/n/astronomer-combusting-plane-6703/statsd_astronomer-combusting-plane-6703.log
/tmp/n/astronomer-combusting-plane-6703/pods_astronomer-combusting-plane-6703.log
/tmp/n/astronomer-combusting-plane-6703/redis_astronomer-combusting-plane-6703.log
/tmp/n/astronomer-combusting-plane-6703/webserverastronomer-combusting-plane-6703.log
/tmp/n/astronomer-combusting-plane-6703/cronjobs_astronomer-combusting-plane-6703.log
/tmp/n/astronomer-combusting-plane-6703/helm_history_combusting-plane-6703.yaml
/tmp/n/astronomer-combusting-plane-6703/ingress_astronomer-combusting-plane-6703.log
/tmp/n/astronomer-combusting-plane-6703/events_astronomer-combusting-plane-6703.log
/tmp/n/astronomer-combusting-plane-6703/scheduler_astronomer-combusting-plane-6703.log
/tmp/n/astronomer-combusting-plane-6703/flower _astronomer-combusting-plane-6703.log
/tmp/n/astronomer-combusting-plane-6703/worker_astronomer-combusting-plane-6703.log
/tmp/n/astronomer-combusting-plane-6703/secrets_astronomer-combusting-plane-6703.log
/tmp/n/astronomer-flickering-rocket-1376/
/tmp/n/astronomer-flickering-rocket-1376/cronjobs_astronomer-flickering-rocket-1376.log
/tmp/n/astronomer-flickering-rocket-1376/secrets_astronomer-flickering-rocket-1376.log
/tmp/n/astronomer-flickering-rocket-1376/statsd_astronomer-flickering-rocket-1376.log
/tmp/n/astronomer-flickering-rocket-1376/flower _astronomer-flickering-rocket-1376.log
/tmp/n/astronomer-flickering-rocket-1376/rs_status_all_namespaces.log
/tmp/n/astronomer-flickering-rocket-1376/scheduler_astronomer-flickering-rocket-1376.log
/tmp/n/astronomer-flickering-rocket-1376/BADpodDESCRIBE_astronomer-flickering-rocket-1376.log
/tmp/n/astronomer-flickering-rocket-1376/pods_astronomer-flickering-rocket-1376.log
/tmp/n/astronomer-flickering-rocket-1376/worker_astronomer-flickering-rocket-1376.log
/tmp/n/astronomer-flickering-rocket-1376/svc_astronomer-flickering-rocket-1376.log
/tmp/n/astronomer-flickering-rocket-1376/events_astronomer-flickering-rocket-1376.log
/tmp/n/astronomer-flickering-rocket-1376/getall_status_astronomer-flickering-rocket-1376.log
/tmp/n/astronomer-flickering-rocket-1376/redis_astronomer-flickering-rocket-1376.log
/tmp/n/astronomer-flickering-rocket-1376/ingress_astronomer-flickering-rocket-1376.log
/tmp/n/astronomer-flickering-rocket-1376/webserverastronomer-flickering-rocket-1376.log
/tmp/n/astronomer-flickering-rocket-1376/triggerer astronomer-flickering-rocket-1376.log
/tmp/n/astronomer-flickering-rocket-1376/helm_values_flickering-rocket-1376.yaml
/tmp/n/astronomer-flickering-rocket-1376/pgbouncer _astronomer-flickering-rocket-1376.log
/tmp/n/astronomer-flickering-rocket-1376/pvc_astronomer-flickering-rocket-1376.log
/tmp/n/astronomer-flickering-rocket-1376/helm_history_flickering-rocket-1376.yaml
/tmp/n/astronomer/
/tmp/n/astronomer/DESCRIBE_ip-10-234-1-246.us-east-2.compute.internal.log
/tmp/n/astronomer/DESCRIBE_ip-10-234-2-242.us-east-2.compute.internal.log
/tmp/n/astronomer/houston-workerastronomer.log
/tmp/n/astronomer/nodes.log
/tmp/n/astronomer/nginx-default-backend_astronomer.log
/tmp/n/astronomer/alertmanager_astronomer.log
/tmp/n/astronomer/kube-state_astronomer.log
/tmp/n/astronomer/secrets_astronomer.log
/tmp/n/astronomer/DESCRIBE_ip-10-234-2-153.us-east-2.compute.internal.log
/tmp/n/astronomer/nginx_astronomer.log
/tmp/n/astronomer/svc_astronomer.log
/tmp/n/astronomer/kibana_astronomer.log
/tmp/n/astronomer/rs_status_all_namespaces.log
/tmp/n/astronomer/ingress_astronomer.log
/tmp/n/astronomer/DESCRIBE_ip-10-234-1-104.us-east-2.compute.internal.log
/tmp/n/astronomer/stan_contatiner_astronomer.log
/tmp/n/astronomer/DESCRIBE_ip-10-234-1-242.us-east-2.compute.internal.log
/tmp/n/astronomer/cli-install_astronomer.log
/tmp/n/astronomer/helm_history_astronomer.log
/tmp/n/astronomer/cronjobs_astronomer.log
/tmp/n/astronomer/helm_values_astronomer.yaml
/tmp/n/astronomer/prometheus_container_astronomer.log
/tmp/n/astronomer/DESCRIBE_ip-10-234-1-159.us-east-2.compute.internal.log
/tmp/n/astronomer/elasticsearch-master_astronomer.log
/tmp/n/astronomer/helm_status.log
/tmp/n/astronomer/events_astronomer.log
/tmp/n/astronomer/kube-system.log
/tmp/n/astronomer/getall_status_astronomer.log
/tmp/n/astronomer/elasticsearch-data_astronomer.log
/tmp/n/astronomer/pvc_astronomer.log
/tmp/n/astronomer/elasticsearch-clientastronomer.log
/tmp/n/astronomer/registryastronomer.log
/tmp/n/astronomer/commanderastronomer.log
/tmp/n/astronomer/nats_astronomer.log
/tmp/n/astronomer/houstonastronomer.log
/tmp/n/astronomer/DESCRIBE_ip-10-234-1-239.us-east-2.compute.internal.log
/tmp/n/astronomer/DESCRIBE_ip-10-234-2-22.us-east-2.compute.internal.log
/tmp/n/astronomer/elasticsearch-nginx_astronomer.log
/tmp/n/astronomer/DESCRIBE_ip-10-234-2-44.us-east-2.compute.internal.log
/tmp/n/astronomer/astro-uiastronomer.log
/tmp/n/astronomer/pods_astronomer.log
/tmp/n/astronomer/Enviornment_Info.log
/tmp/n/astronomer/grafana_astronomer.log
/tmp/n/astronomer/DESCRIBE_ip-10-234-2-100.us-east-2.compute.internal.log
  adding: tmp/n/ (stored 0%)
  adding: tmp/n/astronomer-combusting-plane-6703/ (stored 0%)
  adding: tmp/n/astronomer-combusting-plane-6703/helm_values_combusting-plane-6703.yaml (deflated 78%)
  adding: tmp/n/astronomer-combusting-plane-6703/pgbouncer _astronomer-combusting-plane-6703.log (deflated 89%)
  adding: tmp/n/astronomer-combusting-plane-6703/triggerer astronomer-combusting-plane-6703.log (deflated 85%)
  adding: tmp/n/astronomer-combusting-plane-6703/rs_status_all_namespaces.log (deflated 67%)
  adding: tmp/n/astronomer-combusting-plane-6703/getall_status_astronomer-combusting-plane-6703.log (deflated 83%)
  adding: tmp/n/astronomer-combusting-plane-6703/svc_astronomer-combusting-plane-6703.log (deflated 65%)
  adding: tmp/n/astronomer-combusting-plane-6703/pvc_astronomer-combusting-plane-6703.log (deflated 42%)
  adding: tmp/n/astronomer-combusting-plane-6703/statsd_astronomer-combusting-plane-6703.log (deflated 49%)
  adding: tmp/n/astronomer-combusting-plane-6703/pods_astronomer-combusting-plane-6703.log (deflated 76%)
  adding: tmp/n/astronomer-combusting-plane-6703/redis_astronomer-combusting-plane-6703.log (deflated 90%)
  adding: tmp/n/astronomer-combusting-plane-6703/webserverastronomer-combusting-plane-6703.log (deflated 97%)
  adding: tmp/n/astronomer-combusting-plane-6703/cronjobs_astronomer-combusting-plane-6703.log (deflated 62%)
  adding: tmp/n/astronomer-combusting-plane-6703/helm_history_combusting-plane-6703.yaml (deflated 63%)
  adding: tmp/n/astronomer-combusting-plane-6703/ingress_astronomer-combusting-plane-6703.log (deflated 68%)
  adding: tmp/n/astronomer-combusting-plane-6703/events_astronomer-combusting-plane-6703.log (deflated 88%)
  adding: tmp/n/astronomer-combusting-plane-6703/scheduler_astronomer-combusting-plane-6703.log (deflated 93%)
  adding: tmp/n/astronomer-combusting-plane-6703/flower _astronomer-combusting-plane-6703.log (deflated 65%)
  adding: tmp/n/astronomer-combusting-plane-6703/worker_astronomer-combusting-plane-6703.log (deflated 86%)
  adding: tmp/n/astronomer-combusting-plane-6703/secrets_astronomer-combusting-plane-6703.log (deflated 85%)
  adding: tmp/n/astronomer-flickering-rocket-1376/ (stored 0%)
  adding: tmp/n/astronomer-flickering-rocket-1376/cronjobs_astronomer-flickering-rocket-1376.log (deflated 62%)
  adding: tmp/n/astronomer-flickering-rocket-1376/secrets_astronomer-flickering-rocket-1376.log (deflated 84%)
  adding: tmp/n/astronomer-flickering-rocket-1376/statsd_astronomer-flickering-rocket-1376.log (deflated 48%)
  adding: tmp/n/astronomer-flickering-rocket-1376/flower _astronomer-flickering-rocket-1376.log (deflated 65%)
  adding: tmp/n/astronomer-flickering-rocket-1376/rs_status_all_namespaces.log (deflated 69%)
  adding: tmp/n/astronomer-flickering-rocket-1376/scheduler_astronomer-flickering-rocket-1376.log (stored 0%)
  adding: tmp/n/astronomer-flickering-rocket-1376/BADpodDESCRIBE_astronomer-flickering-rocket-1376.log (deflated 75%)
  adding: tmp/n/astronomer-flickering-rocket-1376/pods_astronomer-flickering-rocket-1376.log (deflated 76%)
  adding: tmp/n/astronomer-flickering-rocket-1376/worker_astronomer-flickering-rocket-1376.log (deflated 93%)
  adding: tmp/n/astronomer-flickering-rocket-1376/svc_astronomer-flickering-rocket-1376.log (deflated 65%)
  adding: tmp/n/astronomer-flickering-rocket-1376/events_astronomer-flickering-rocket-1376.log (deflated 88%)
  adding: tmp/n/astronomer-flickering-rocket-1376/getall_status_astronomer-flickering-rocket-1376.log (deflated 79%)
  adding: tmp/n/astronomer-flickering-rocket-1376/redis_astronomer-flickering-rocket-1376.log (deflated 82%)
  adding: tmp/n/astronomer-flickering-rocket-1376/ingress_astronomer-flickering-rocket-1376.log (deflated 69%)
  adding: tmp/n/astronomer-flickering-rocket-1376/webserverastronomer-flickering-rocket-1376.log (deflated 97%)
  adding: tmp/n/astronomer-flickering-rocket-1376/triggerer astronomer-flickering-rocket-1376.log (deflated 68%)
  adding: tmp/n/astronomer-flickering-rocket-1376/helm_values_flickering-rocket-1376.yaml (deflated 79%)
  adding: tmp/n/astronomer-flickering-rocket-1376/pgbouncer _astronomer-flickering-rocket-1376.log (deflated 91%)
  adding: tmp/n/astronomer-flickering-rocket-1376/pvc_astronomer-flickering-rocket-1376.log (deflated 42%)
  adding: tmp/n/astronomer-flickering-rocket-1376/helm_history_flickering-rocket-1376.yaml (deflated 25%)
  adding: tmp/n/astronomer/ (stored 0%)
  adding: tmp/n/astronomer/DESCRIBE_ip-10-234-1-246.us-east-2.compute.internal.log (deflated 71%)
  adding: tmp/n/astronomer/DESCRIBE_ip-10-234-2-242.us-east-2.compute.internal.log (deflated 70%)
  adding: tmp/n/astronomer/houston-workerastronomer.log (deflated 87%)
  adding: tmp/n/astronomer/nodes.log (deflated 85%)
  adding: tmp/n/astronomer/nginx-default-backend_astronomer.log (deflated 97%)
  adding: tmp/n/astronomer/alertmanager_astronomer.log (deflated 61%)
  adding: tmp/n/astronomer/kube-state_astronomer.log (deflated 55%)
  adding: tmp/n/astronomer/secrets_astronomer.log (deflated 85%)
  adding: tmp/n/astronomer/DESCRIBE_ip-10-234-2-153.us-east-2.compute.internal.log (deflated 71%)
  adding: tmp/n/astronomer/nginx_astronomer.log (deflated 94%)
  adding: tmp/n/astronomer/svc_astronomer.log (deflated 85%)
  adding: tmp/n/astronomer/kibana_astronomer.log (deflated 98%)
  adding: tmp/n/astronomer/rs_status_all_namespaces.log (deflated 83%)
  adding: tmp/n/astronomer/ingress_astronomer.log (deflated 83%)
  adding: tmp/n/astronomer/DESCRIBE_ip-10-234-1-104.us-east-2.compute.internal.log (deflated 70%)
  adding: tmp/n/astronomer/stan_contatiner_astronomer.log (deflated 88%)
  adding: tmp/n/astronomer/DESCRIBE_ip-10-234-1-242.us-east-2.compute.internal.log (deflated 71%)
  adding: tmp/n/astronomer/cli-install_astronomer.log (deflated 97%)
  adding: tmp/n/astronomer/helm_history_astronomer.log (deflated 74%)
  adding: tmp/n/astronomer/cronjobs_astronomer.log (deflated 79%)
  adding: tmp/n/astronomer/helm_values_astronomer.yaml (deflated 44%)
  adding: tmp/n/astronomer/prometheus_container_astronomer.log (deflated 92%)
  adding: tmp/n/astronomer/DESCRIBE_ip-10-234-1-159.us-east-2.compute.internal.log (deflated 71%)
  adding: tmp/n/astronomer/elasticsearch-master_astronomer.log (deflated 87%)
  adding: tmp/n/astronomer/helm_status.log (deflated 61%)
  adding: tmp/n/astronomer/events_astronomer.log (deflated 82%)
  adding: tmp/n/astronomer/kube-system.log (deflated 86%)
  adding: tmp/n/astronomer/getall_status_astronomer.log (deflated 90%)
  adding: tmp/n/astronomer/elasticsearch-data_astronomer.log (deflated 87%)
  adding: tmp/n/astronomer/pvc_astronomer.log (deflated 70%)
  adding: tmp/n/astronomer/elasticsearch-clientastronomer.log (deflated 88%)
  adding: tmp/n/astronomer/registryastronomer.log (deflated 98%)
  adding: tmp/n/astronomer/commanderastronomer.log (deflated 91%)
  adding: tmp/n/astronomer/nats_astronomer.log (deflated 73%)
  adding: tmp/n/astronomer/houstonastronomer.log (deflated 94%)
  adding: tmp/n/astronomer/DESCRIBE_ip-10-234-1-239.us-east-2.compute.internal.log (deflated 71%)
  adding: tmp/n/astronomer/DESCRIBE_ip-10-234-2-22.us-east-2.compute.internal.log (deflated 73%)
  adding: tmp/n/astronomer/elasticsearch-nginx_astronomer.log (deflated 97%)
  adding: tmp/n/astronomer/DESCRIBE_ip-10-234-2-44.us-east-2.compute.internal.log (deflated 71%)
  adding: tmp/n/astronomer/astro-uiastronomer.log (deflated 98%)
  adding: tmp/n/astronomer/pods_astronomer.log (deflated 87%)
  adding: tmp/n/astronomer/Enviornment_Info.log (deflated 62%)
  adding: tmp/n/astronomer/grafana_astronomer.log (deflated 93%)
  adding: tmp/n/astronomer/DESCRIBE_ip-10-234-2-100.us-east-2.compute.internal.log (deflated 71%)
Here is the list of files created:
/tmp/n/astronomer:
total 27M
-rw-r--r-- 1 root root 5.4K Sep 18 14:45 DESCRIBE_ip-10-234-1-104.us-east-2.compute.internal.log
-rw-r--r-- 1 root root 5.2K Sep 18 14:45 DESCRIBE_ip-10-234-1-159.us-east-2.compute.internal.log
-rw-r--r-- 1 root root 5.6K Sep 18 14:45 DESCRIBE_ip-10-234-1-239.us-east-2.compute.internal.log
-rw-r--r-- 1 root root 5.6K Sep 18 14:45 DESCRIBE_ip-10-234-1-242.us-east-2.compute.internal.log
-rw-r--r-- 1 root root 5.8K Sep 18 14:46 DESCRIBE_ip-10-234-1-246.us-east-2.compute.internal.log
-rw-r--r-- 1 root root 5.5K Sep 18 14:46 DESCRIBE_ip-10-234-2-100.us-east-2.compute.internal.log
-rw-r--r-- 1 root root 5.5K Sep 18 14:46 DESCRIBE_ip-10-234-2-153.us-east-2.compute.internal.log
-rw-r--r-- 1 root root 6.3K Sep 18 14:46 DESCRIBE_ip-10-234-2-22.us-east-2.compute.internal.log
-rw-r--r-- 1 root root 5.2K Sep 18 14:46 DESCRIBE_ip-10-234-2-242.us-east-2.compute.internal.log
-rw-r--r-- 1 root root 5.8K Sep 18 14:46 DESCRIBE_ip-10-234-2-44.us-east-2.compute.internal.log
-rw-r--r-- 1 root root 6.1M Sep 18 14:46 houstonastronomer.log
-rw-r--r-- 1 root root  15K Sep 18 14:46 houston-workerastronomer.log
-rw-r--r-- 1 root root 3.5M Sep 18 14:46 astro-uiastronomer.log
-rw-r--r-- 1 root root 3.2M Sep 18 14:46 commanderastronomer.log
-rw-r--r-- 1 root root 2.0M Sep 18 14:47 nginx_astronomer.log
-rw-r--r-- 1 root root 1.7K Sep 18 14:47 kube-state_astronomer.log
-rw-r--r-- 1 root root 3.8M Sep 18 14:47 kibana_astronomer.log
-rw-r--r-- 1 root root 1.8M Sep 18 14:47 nginx-default-backend_astronomer.log
-rw-r--r-- 1 root root  79K Sep 18 14:47 grafana_astronomer.log
-rw-r--r-- 1 root root 1.5M Sep 18 14:47 elasticsearch-nginx_astronomer.log
-rw-r--r-- 1 root root 1.7M Sep 18 14:47 cli-install_astronomer.log
-rw-r--r-- 1 root root  43K Sep 18 14:47 elasticsearch-clientastronomer.log
-rw-r--r-- 1 root root  36K Sep 18 14:47 elasticsearch-master_astronomer.log
-rw-r--r-- 1 root root  37K Sep 18 14:48 elasticsearch-data_astronomer.log
-rw-r--r-- 1 root root 160K Sep 18 14:48 stan_contatiner_astronomer.log
-rw-r--r-- 1 root root 3.2M Sep 18 14:48 registryastronomer.log
-rw-r--r-- 1 root root  73K Sep 18 14:48 prometheus_container_astronomer.log
-rw-r--r-- 1 root root 3.0K Sep 18 14:48 nats_astronomer.log
-rw-r--r-- 1 root root 1.4K Sep 18 14:48 alertmanager_astronomer.log
-rw-r--r-- 1 root root  51K Sep 18 14:48 getall_status_astronomer.log
-rw-r--r-- 1 root root 3.8K Sep 18 14:48 rs_status_all_namespaces.log
-rw-r--r-- 1 root root  11K Sep 18 14:48 pods_astronomer.log
-rw-r--r-- 1 root root 3.3K Sep 18 14:48 events_astronomer.log
-rw-r--r-- 1 root root 2.9K Sep 18 14:48 secrets_astronomer.log
-rw-r--r-- 1 root root 2.1K Sep 18 14:48 nodes.log
-rw-r--r-- 1 root root 3.3K Sep 18 14:48 kube-system.log
-rw-r--r-- 1 root root 4.4K Sep 18 14:48 svc_astronomer.log
-rw-r--r-- 1 root root 1.7K Sep 18 14:48 pvc_astronomer.log
-rw-r--r-- 1 root root 1.6K Sep 18 14:48 ingress_astronomer.log
-rw-r--r-- 1 root root 1.7K Sep 18 14:48 cronjobs_astronomer.log
-rw-r--r-- 1 root root 1.4K Sep 18 14:48 Enviornment_Info.log
-rw-r--r-- 1 root root  790 Sep 18 14:48 helm_status.log
-rw-r--r-- 1 root root 1012 Sep 18 14:48 helm_history_astronomer.log
-rw-r--r-- 1 root root  579 Sep 18 14:49 helm_values_astronomer.yaml

/tmp/n/astronomer-combusting-plane-6703:
total 7.8M
-rw-r--r-- 1 root root 6.6K Sep 18 14:49  getall_status_astronomer-combusting-plane-6703.log
-rw-r--r-- 1 root root  610 Sep 18 14:49  rs_status_all_namespaces.log
-rw-r--r-- 1 root root 1.9K Sep 18 14:49  pods_astronomer-combusting-plane-6703.log
-rw-r--r-- 1 root root 5.8K Sep 18 14:49  events_astronomer-combusting-plane-6703.log
-rw-r--r-- 1 root root 3.3K Sep 18 14:49  secrets_astronomer-combusting-plane-6703.log
-rw-r--r-- 1 root root  707 Sep 18 14:49  svc_astronomer-combusting-plane-6703.log
-rw-r--r-- 1 root root  276 Sep 18 14:49  pvc_astronomer-combusting-plane-6703.log
-rw-r--r-- 1 root root  684 Sep 18 14:49  ingress_astronomer-combusting-plane-6703.log
-rw-r--r-- 1 root root  280 Sep 18 14:49  cronjobs_astronomer-combusting-plane-6703.log
-rw-r--r-- 1 root root 1.5M Sep 18 14:49  scheduler_astronomer-combusting-plane-6703.log
-rw-r--r-- 1 root root  24K Sep 18 14:49  worker_astronomer-combusting-plane-6703.log
-rw-r--r-- 1 root root 4.3M Sep 18 14:49  webserverastronomer-combusting-plane-6703.log
-rw-r--r-- 1 root root 6.9K Sep 18 14:49 'triggerer astronomer-combusting-plane-6703.log'
-rw-r--r-- 1 root root 1.8M Sep 18 14:49 'pgbouncer _astronomer-combusting-plane-6703.log'
-rw-r--r-- 1 root root 2.1K Sep 18 14:49 'flower _astronomer-combusting-plane-6703.log'
-rw-r--r-- 1 root root  568 Sep 18 14:49  statsd_astronomer-combusting-plane-6703.log
-rw-r--r-- 1 root root 188K Sep 18 14:49  redis_astronomer-combusting-plane-6703.log
-rw-r--r-- 1 root root  528 Sep 18 14:50  helm_history_combusting-plane-6703.yaml
-rw-r--r-- 1 root root  47K Sep 18 14:50  helm_values_combusting-plane-6703.yaml

/tmp/n/astronomer-flickering-rocket-1376:
total 4.4M
-rw-r--r-- 1 root root  11K Sep 18 14:45  BADpodDESCRIBE_astronomer-flickering-rocket-1376.log
-rw-r--r-- 1 root root 4.1K Sep 18 14:50  getall_status_astronomer-flickering-rocket-1376.log
-rw-r--r-- 1 root root  624 Sep 18 14:50  rs_status_all_namespaces.log
-rw-r--r-- 1 root root 2.1K Sep 18 14:50  pods_astronomer-flickering-rocket-1376.log
-rw-r--r-- 1 root root 6.0K Sep 18 14:50  events_astronomer-flickering-rocket-1376.log
-rw-r--r-- 1 root root 2.7K Sep 18 14:50  secrets_astronomer-flickering-rocket-1376.log
-rw-r--r-- 1 root root  714 Sep 18 14:50  svc_astronomer-flickering-rocket-1376.log
-rw-r--r-- 1 root root  278 Sep 18 14:50  pvc_astronomer-flickering-rocket-1376.log
-rw-r--r-- 1 root root  690 Sep 18 14:50  ingress_astronomer-flickering-rocket-1376.log
-rw-r--r-- 1 root root    0 Sep 18 14:50  scheduler_astronomer-flickering-rocket-1376.log
-rw-r--r-- 1 root root  284 Sep 18 14:50  cronjobs_astronomer-flickering-rocket-1376.log
-rw-r--r-- 1 root root  99K Sep 18 14:50  worker_astronomer-flickering-rocket-1376.log
-rw-r--r-- 1 root root 4.1M Sep 18 14:50  webserverastronomer-flickering-rocket-1376.log
-rw-r--r-- 1 root root 2.4K Sep 18 14:50 'triggerer astronomer-flickering-rocket-1376.log'
-rw-r--r-- 1 root root 101K Sep 18 14:50 'pgbouncer _astronomer-flickering-rocket-1376.log'
-rw-r--r-- 1 root root 2.1K Sep 18 14:50 'flower _astronomer-flickering-rocket-1376.log'
-rw-r--r-- 1 root root  568 Sep 18 14:51  statsd_astronomer-flickering-rocket-1376.log
-rw-r--r-- 1 root root 4.9K Sep 18 14:51  redis_astronomer-flickering-rocket-1376.log
-rw-r--r-- 1 root root  172 Sep 18 14:51  helm_history_flickering-rocket-1376.yaml
-rw-r--r-- 1 root root  19K Sep 18 14:51  helm_values_flickering-rocket-1376.yaml
/tmp/n/astronomer:
total 27M
-rw-r--r-- 1 root root 5.4K Sep 18 14:45 DESCRIBE_ip-10-234-1-104.us-east-2.compute.internal.log
-rw-r--r-- 1 root root 5.2K Sep 18 14:45 DESCRIBE_ip-10-234-1-159.us-east-2.compute.internal.log
-rw-r--r-- 1 root root 5.6K Sep 18 14:45 DESCRIBE_ip-10-234-1-239.us-east-2.compute.internal.log
-rw-r--r-- 1 root root 5.6K Sep 18 14:45 DESCRIBE_ip-10-234-1-242.us-east-2.compute.internal.log
-rw-r--r-- 1 root root 5.8K Sep 18 14:46 DESCRIBE_ip-10-234-1-246.us-east-2.compute.internal.log
-rw-r--r-- 1 root root 5.5K Sep 18 14:46 DESCRIBE_ip-10-234-2-100.us-east-2.compute.internal.log
-rw-r--r-- 1 root root 5.5K Sep 18 14:46 DESCRIBE_ip-10-234-2-153.us-east-2.compute.internal.log
-rw-r--r-- 1 root root 6.3K Sep 18 14:46 DESCRIBE_ip-10-234-2-22.us-east-2.compute.internal.log
-rw-r--r-- 1 root root 5.2K Sep 18 14:46 DESCRIBE_ip-10-234-2-242.us-east-2.compute.internal.log
-rw-r--r-- 1 root root 5.8K Sep 18 14:46 DESCRIBE_ip-10-234-2-44.us-east-2.compute.internal.log
-rw-r--r-- 1 root root 6.1M Sep 18 14:46 houstonastronomer.log
-rw-r--r-- 1 root root  15K Sep 18 14:46 houston-workerastronomer.log
-rw-r--r-- 1 root root 3.5M Sep 18 14:46 astro-uiastronomer.log
-rw-r--r-- 1 root root 3.2M Sep 18 14:46 commanderastronomer.log
-rw-r--r-- 1 root root 2.0M Sep 18 14:47 nginx_astronomer.log
-rw-r--r-- 1 root root 1.7K Sep 18 14:47 kube-state_astronomer.log
-rw-r--r-- 1 root root 3.8M Sep 18 14:47 kibana_astronomer.log
-rw-r--r-- 1 root root 1.8M Sep 18 14:47 nginx-default-backend_astronomer.log
-rw-r--r-- 1 root root  79K Sep 18 14:47 grafana_astronomer.log
-rw-r--r-- 1 root root 1.5M Sep 18 14:47 elasticsearch-nginx_astronomer.log
-rw-r--r-- 1 root root 1.7M Sep 18 14:47 cli-install_astronomer.log
-rw-r--r-- 1 root root  43K Sep 18 14:47 elasticsearch-clientastronomer.log
-rw-r--r-- 1 root root  36K Sep 18 14:47 elasticsearch-master_astronomer.log
-rw-r--r-- 1 root root  37K Sep 18 14:48 elasticsearch-data_astronomer.log
-rw-r--r-- 1 root root 160K Sep 18 14:48 stan_contatiner_astronomer.log
-rw-r--r-- 1 root root 3.2M Sep 18 14:48 registryastronomer.log
-rw-r--r-- 1 root root  73K Sep 18 14:48 prometheus_container_astronomer.log
-rw-r--r-- 1 root root 3.0K Sep 18 14:48 nats_astronomer.log
-rw-r--r-- 1 root root 1.4K Sep 18 14:48 alertmanager_astronomer.log
-rw-r--r-- 1 root root  51K Sep 18 14:48 getall_status_astronomer.log
-rw-r--r-- 1 root root 3.8K Sep 18 14:48 rs_status_all_namespaces.log
-rw-r--r-- 1 root root  11K Sep 18 14:48 pods_astronomer.log
-rw-r--r-- 1 root root 3.3K Sep 18 14:48 events_astronomer.log
-rw-r--r-- 1 root root 2.9K Sep 18 14:48 secrets_astronomer.log
-rw-r--r-- 1 root root 2.1K Sep 18 14:48 nodes.log
-rw-r--r-- 1 root root 3.3K Sep 18 14:48 kube-system.log
-rw-r--r-- 1 root root 4.4K Sep 18 14:48 svc_astronomer.log
-rw-r--r-- 1 root root 1.7K Sep 18 14:48 pvc_astronomer.log
-rw-r--r-- 1 root root 1.6K Sep 18 14:48 ingress_astronomer.log
-rw-r--r-- 1 root root 1.7K Sep 18 14:48 cronjobs_astronomer.log
-rw-r--r-- 1 root root 1.4K Sep 18 14:48 Enviornment_Info.log
-rw-r--r-- 1 root root  790 Sep 18 14:48 helm_status.log
-rw-r--r-- 1 root root 1012 Sep 18 14:48 helm_history_astronomer.log
-rw-r--r-- 1 root root  579 Sep 18 14:49 helm_values_astronomer.yaml

/tmp/n/astronomer-combusting-plane-6703:
total 7.8M
-rw-r--r-- 1 root root 6.6K Sep 18 14:49  getall_status_astronomer-combusting-plane-6703.log
-rw-r--r-- 1 root root  610 Sep 18 14:49  rs_status_all_namespaces.log
-rw-r--r-- 1 root root 1.9K Sep 18 14:49  pods_astronomer-combusting-plane-6703.log
-rw-r--r-- 1 root root 5.8K Sep 18 14:49  events_astronomer-combusting-plane-6703.log
-rw-r--r-- 1 root root 3.3K Sep 18 14:49  secrets_astronomer-combusting-plane-6703.log
-rw-r--r-- 1 root root  707 Sep 18 14:49  svc_astronomer-combusting-plane-6703.log
-rw-r--r-- 1 root root  276 Sep 18 14:49  pvc_astronomer-combusting-plane-6703.log
-rw-r--r-- 1 root root  684 Sep 18 14:49  ingress_astronomer-combusting-plane-6703.log
-rw-r--r-- 1 root root  280 Sep 18 14:49  cronjobs_astronomer-combusting-plane-6703.log
-rw-r--r-- 1 root root 1.5M Sep 18 14:49  scheduler_astronomer-combusting-plane-6703.log
-rw-r--r-- 1 root root  24K Sep 18 14:49  worker_astronomer-combusting-plane-6703.log
-rw-r--r-- 1 root root 4.3M Sep 18 14:49  webserverastronomer-combusting-plane-6703.log
-rw-r--r-- 1 root root 6.9K Sep 18 14:49 'triggerer astronomer-combusting-plane-6703.log'
-rw-r--r-- 1 root root 1.8M Sep 18 14:49 'pgbouncer _astronomer-combusting-plane-6703.log'
-rw-r--r-- 1 root root 2.1K Sep 18 14:49 'flower _astronomer-combusting-plane-6703.log'
-rw-r--r-- 1 root root  568 Sep 18 14:49  statsd_astronomer-combusting-plane-6703.log
-rw-r--r-- 1 root root 188K Sep 18 14:49  redis_astronomer-combusting-plane-6703.log
-rw-r--r-- 1 root root  528 Sep 18 14:50  helm_history_combusting-plane-6703.yaml
-rw-r--r-- 1 root root  47K Sep 18 14:50  helm_values_combusting-plane-6703.yaml

/tmp/n/astronomer-flickering-rocket-1376:
total 4.4M
-rw-r--r-- 1 root root  11K Sep 18 14:45  BADpodDESCRIBE_astronomer-flickering-rocket-1376.log
-rw-r--r-- 1 root root 4.1K Sep 18 14:50  getall_status_astronomer-flickering-rocket-1376.log
-rw-r--r-- 1 root root  624 Sep 18 14:50  rs_status_all_namespaces.log
-rw-r--r-- 1 root root 2.1K Sep 18 14:50  pods_astronomer-flickering-rocket-1376.log
-rw-r--r-- 1 root root 6.0K Sep 18 14:50  events_astronomer-flickering-rocket-1376.log
-rw-r--r-- 1 root root 2.7K Sep 18 14:50  secrets_astronomer-flickering-rocket-1376.log
-rw-r--r-- 1 root root  714 Sep 18 14:50  svc_astronomer-flickering-rocket-1376.log
-rw-r--r-- 1 root root  278 Sep 18 14:50  pvc_astronomer-flickering-rocket-1376.log
-rw-r--r-- 1 root root  690 Sep 18 14:50  ingress_astronomer-flickering-rocket-1376.log
-rw-r--r-- 1 root root    0 Sep 18 14:50  scheduler_astronomer-flickering-rocket-1376.log
-rw-r--r-- 1 root root  284 Sep 18 14:50  cronjobs_astronomer-flickering-rocket-1376.log
-rw-r--r-- 1 root root  99K Sep 18 14:50  worker_astronomer-flickering-rocket-1376.log
-rw-r--r-- 1 root root 4.1M Sep 18 14:50  webserverastronomer-flickering-rocket-1376.log
-rw-r--r-- 1 root root 2.4K Sep 18 14:50 'triggerer astronomer-flickering-rocket-1376.log'
-rw-r--r-- 1 root root 101K Sep 18 14:50 'pgbouncer _astronomer-flickering-rocket-1376.log'
-rw-r--r-- 1 root root 2.1K Sep 18 14:50 'flower _astronomer-flickering-rocket-1376.log'
-rw-r--r-- 1 root root  568 Sep 18 14:51  statsd_astronomer-flickering-rocket-1376.log
-rw-r--r-- 1 root root 4.9K Sep 18 14:51  redis_astronomer-flickering-rocket-1376.log
-rw-r--r-- 1 root root  172 Sep 18 14:51  helm_history_flickering-rocket-1376.yaml
-rw-r--r-- 1 root root  19K Sep 18 14:51  helm_values_flickering-rocket-1376.yaml
Please attach the zip file or .gz file created in /tmp to the zendesk ticket for reference.
~~~
