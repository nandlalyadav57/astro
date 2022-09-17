
****cre_astro_gather_logs****
====================================

It will export pod logs,events,helm values,node status,secrets etc. Also, it will include describing the status of pods that are in a bad state.


We have to make sure to add below paramters in script.

Astronomer namespace (Astronomer Namespace to collect logs)
DIR (local directory to export the logs)

~~~
ASTRONOMER_NAMESPACE=
export DIR=
~~~

Usage: Just run the shell script as below and you will get required log files.





Expected output:



![image](https://user-images.githubusercontent.com/33649510/190877157-16c08ecb-a20d-4e03-b578-04a5aa2317d6.png)
![image](https://user-images.githubusercontent.com/33649510/190877503-5ada590a-75cf-41bd-93e0-7b6d59bb7f2c.png)

![image](https://user-images.githubusercontent.com/33649510/190877507-43b1fbc5-b324-46ba-8c5d-3938778af85f.png)

![image](https://user-images.githubusercontent.com/33649510/190877494-200d7b26-2e78-439b-8e35-8c419aad3858.png)

![image](https://user-images.githubusercontent.com/33649510/190877458-1bb63236-141f-4f15-86e6-47a99023fc28.png)












~~~
[root@DESKTOP-JJ9MM59 Gather logs]# sh cre_astro_gather_logs.sh
You have specied astronomer as a namespace where all the core Astronomer platform pods are running.Please make sure it's correctly specified.
Your astronomer release name is astronomer.
The path where logs would be stored is /tmp/n.
creating namespace astronomer Directory
creating namespace astronomer-atomic-protoplanet-2502 Directory
creating namespace astronomer-combusting-plane-6703 Directory
creating namespace astronomer-flickering-rocket-1376 Directory
atomic-protoplanet-2502-worker-7d9dfb78c9-9sqcv is bad state
Collecting Describe output of bad state pods astronomer-atomic-protoplanet-2502 Namespace
flickering-rocket-1376-scheduler-585bcfc49f-kmqnv is bad state
Collecting Describe output of bad state pods astronomer-flickering-rocket-1376 Namespace
flickering-rocket-1376-scheduler-585bcfc49f-x5txg is bad state
Collecting Describe output of bad state pods astronomer-flickering-rocket-1376 Namespace
No resources found in default namespace.
No resources found in kube-node-lease namespace.
No resources found in kube-public namespace.
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
^C
[root@DESKTOP-JJ9MM59 Gather logs]# clear
[root@DESKTOP-JJ9MM59 Gather logs]# sh cre_astro_gather_logs.sh
You have specied astronomer as a namespace where all the core Astronomer platform pods are running.Please make sure it's correctly specified.
Your astronomer release name is astronomer.
The path where logs would be stored is /tmp/n.
creating namespace astronomer Directory
creating namespace astronomer-atomic-protoplanet-2502 Directory
creating namespace astronomer-combusting-plane-6703 Directory
creating namespace astronomer-flickering-rocket-1376 Directory
atomic-protoplanet-2502-worker-7d9dfb78c9-9sqcv pod is in bad state
Collecting Describe output of bad state pods in astronomer-atomic-protoplanet-2502 Namespace
flickering-rocket-1376-scheduler-585bcfc49f-kmqnv pod is in bad state
Collecting Describe output of bad state pods in astronomer-flickering-rocket-1376 Namespace
flickering-rocket-1376-scheduler-585bcfc49f-x5txg pod is in bad state
Collecting Describe output of bad state pods in astronomer-flickering-rocket-1376 Namespace
No resources found in default namespace.
No resources found in kube-node-lease namespace.
No resources found in kube-public namespace.
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
Getting kube-system pod status
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
Found 2 pods, using pod/atomic-protoplanet-2502-scheduler-6c74fbb9bb-v9jzz
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
Getting Pod Running status in astronomer-flickering-rocket-1376 Namespace
Getting events in astronomer-flickering-rocket-1376 Namespace
Getting secrets in astronomer-flickering-rocket-1376 Namespace
export release name
Your Release_Name in current namespace is flickering-rocket-1376.
Getting logs of scheduler in astronomer-flickering-rocket-1376 Namespace
Found 2 pods, using pod/flickering-rocket-1376-scheduler-585bcfc49f-kmqnv
Error from server (BadRequest): container "scheduler" in pod "flickering-rocket-1376-scheduler-585bcfc49f-kmqnv" is waiting to start: PodInitializing
Getting logs of worker in astronomer-flickering-rocket-1376 Namespace
Getting logs of webserverin astronomer-flickering-rocket-1376 Namespace
Getting logs of triggerer in astronomer-flickering-rocket-1376 Namespace
Getting logs of pgbouncer in astronomer-flickering-rocket-1376 Namespace
Getting logs of flower  in astronomer-flickering-rocket-1376 Namespace
Getting logs of statsd in astronomer-flickering-rocket-1376 Namespace
Getting logs of redis in astronomer-flickering-rocket-1376 Namespace
Getting helm history in astronomer-flickering-rocket-1376 Namespace
Getting helm values from astronomer-flickering-rocket-1376 Namespace
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
/tmp/n/astronomer-flickering-rocket-1376/
/tmp/n/astronomer-flickering-rocket-1376/secrets_astronomer-flickering-rocket-1376.log
/tmp/n/astronomer-flickering-rocket-1376/statsd_astronomer-flickering-rocket-1376.log
/tmp/n/astronomer-flickering-rocket-1376/flower _astronomer-flickering-rocket-1376.log
/tmp/n/astronomer-flickering-rocket-1376/scheduler_astronomer-flickering-rocket-1376.log
/tmp/n/astronomer-flickering-rocket-1376/BADpodDESCRIBE_astronomer-flickering-rocket-1376.log
/tmp/n/astronomer-flickering-rocket-1376/pods_astronomer-flickering-rocket-1376.log
/tmp/n/astronomer-flickering-rocket-1376/worker_astronomer-flickering-rocket-1376.log
/tmp/n/astronomer-flickering-rocket-1376/events_astronomer-flickering-rocket-1376.log
/tmp/n/astronomer-flickering-rocket-1376/redis_astronomer-flickering-rocket-1376.log
/tmp/n/astronomer-flickering-rocket-1376/webserverastronomer-flickering-rocket-1376.log
/tmp/n/astronomer-flickering-rocket-1376/triggerer astronomer-flickering-rocket-1376.log
/tmp/n/astronomer-flickering-rocket-1376/helm_values_flickering-rocket-1376.yaml
/tmp/n/astronomer-flickering-rocket-1376/pgbouncer _astronomer-flickering-rocket-1376.log
/tmp/n/astronomer-flickering-rocket-1376/helm_history_flickering-rocket-1376.yaml
/tmp/n/kube-system.log
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
/tmp/n/astronomer/kube-system.log
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
/tmp/n/astronomer-atomic-protoplanet-2502/BADpodDESCRIBE_astronomer-atomic-protoplanet-2502.log
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
  adding: tmp/n/astronomer-combusting-plane-6703/pods_astronomer-combusting-plane-6703.log (deflated 76%)
  adding: tmp/n/astronomer-combusting-plane-6703/redis_astronomer-combusting-plane-6703.log (deflated 90%)
  adding: tmp/n/astronomer-combusting-plane-6703/webserverastronomer-combusting-plane-6703.log (deflated 97%)
  adding: tmp/n/astronomer-combusting-plane-6703/helm_history_combusting-plane-6703.yaml (deflated 63%)
  adding: tmp/n/astronomer-combusting-plane-6703/events_astronomer-combusting-plane-6703.log (deflated 85%)
  adding: tmp/n/astronomer-combusting-plane-6703/scheduler_astronomer-combusting-plane-6703.log (deflated 93%)
  adding: tmp/n/astronomer-combusting-plane-6703/flower _astronomer-combusting-plane-6703.log (deflated 65%)
  adding: tmp/n/astronomer-combusting-plane-6703/worker_astronomer-combusting-plane-6703.log (deflated 96%)
  adding: tmp/n/astronomer-combusting-plane-6703/secrets_astronomer-combusting-plane-6703.log (deflated 85%)
  adding: tmp/n/astronomer-flickering-rocket-1376/ (stored 0%)
  adding: tmp/n/astronomer-flickering-rocket-1376/secrets_astronomer-flickering-rocket-1376.log (deflated 84%)
  adding: tmp/n/astronomer-flickering-rocket-1376/statsd_astronomer-flickering-rocket-1376.log (deflated 48%)
  adding: tmp/n/astronomer-flickering-rocket-1376/flower _astronomer-flickering-rocket-1376.log (deflated 65%)
  adding: tmp/n/astronomer-flickering-rocket-1376/scheduler_astronomer-flickering-rocket-1376.log (stored 0%)
  adding: tmp/n/astronomer-flickering-rocket-1376/BADpodDESCRIBE_astronomer-flickering-rocket-1376.log (deflated 75%)
  adding: tmp/n/astronomer-flickering-rocket-1376/pods_astronomer-flickering-rocket-1376.log (deflated 76%)
  adding: tmp/n/astronomer-flickering-rocket-1376/worker_astronomer-flickering-rocket-1376.log (deflated 93%)
  adding: tmp/n/astronomer-flickering-rocket-1376/events_astronomer-flickering-rocket-1376.log (deflated 91%)
  adding: tmp/n/astronomer-flickering-rocket-1376/redis_astronomer-flickering-rocket-1376.log (deflated 54%)
  adding: tmp/n/astronomer-flickering-rocket-1376/webserverastronomer-flickering-rocket-1376.log (deflated 97%)
  adding: tmp/n/astronomer-flickering-rocket-1376/triggerer astronomer-flickering-rocket-1376.log (deflated 66%)
  adding: tmp/n/astronomer-flickering-rocket-1376/helm_values_flickering-rocket-1376.yaml (deflated 79%)
  adding: tmp/n/astronomer-flickering-rocket-1376/pgbouncer _astronomer-flickering-rocket-1376.log (deflated 84%)
  adding: tmp/n/astronomer-flickering-rocket-1376/helm_history_flickering-rocket-1376.yaml (deflated 25%)
  adding: tmp/n/kube-system.log (stored 0%)
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
  adding: tmp/n/astronomer/helm_status.log (deflated 65%)
  adding: tmp/n/astronomer/events_astronomer.log (deflated 76%)
  adding: tmp/n/astronomer/kube-system.log (deflated 86%)
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
  adding: tmp/n/astronomer-atomic-protoplanet-2502/BADpodDESCRIBE_astronomer-atomic-protoplanet-2502.log (deflated 74%)
  adding: tmp/n/astronomer-atomic-protoplanet-2502/flower _astronomer-atomic-protoplanet-2502.log (deflated 63%)
  adding: tmp/n/astronomer-atomic-protoplanet-2502/pgbouncer _astronomer-atomic-protoplanet-2502.log (deflated 81%)
  adding: tmp/n/astronomer-atomic-protoplanet-2502/pods_astronomer-atomic-protoplanet-2502.log (deflated 76%)
  adding: tmp/n/astronomer-atomic-protoplanet-2502/helm_history_atomic-protoplanet-2502.yaml (deflated 63%)
  adding: tmp/n/astronomer-atomic-protoplanet-2502/helm_values_atomic-protoplanet-2502.yaml (deflated 79%)
  adding: tmp/n/astronomer-atomic-protoplanet-2502/worker_astronomer-atomic-protoplanet-2502.log (deflated 64%)
  adding: tmp/n/astronomer-atomic-protoplanet-2502/triggerer astronomer-atomic-protoplanet-2502.log (deflated 69%)
  adding: tmp/n/astronomer-atomic-protoplanet-2502/statsd_astronomer-atomic-protoplanet-2502.log (deflated 48%)
  adding: tmp/n/astronomer-atomic-protoplanet-2502/events_astronomer-atomic-protoplanet-2502.log (deflated 92%)
  adding: tmp/n/astronomer-atomic-protoplanet-2502/redis_astronomer-atomic-protoplanet-2502.log (deflated 90%)
  adding: tmp/n/astronomer-atomic-protoplanet-2502/webserverastronomer-atomic-protoplanet-2502.log (deflated 97%)
  adding: tmp/n/astronomer-atomic-protoplanet-2502/secrets_astronomer-atomic-protoplanet-2502.log (deflated 85%)
  adding: tmp/n/astronomer-atomic-protoplanet-2502/scheduler_astronomer-atomic-protoplanet-2502.log (deflated 84%)
Please attach the zip file or .gz file created in /tmp to the zendesk ticket for reference.
~~~
