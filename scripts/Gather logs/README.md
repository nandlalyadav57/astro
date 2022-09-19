
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

![image](https://user-images.githubusercontent.com/33649510/190946921-85a8fe80-785c-49c2-9199-26578b3294f9.png)

![image](https://user-images.githubusercontent.com/33649510/190877503-5ada590a-75cf-41bd-93e0-7b6d59bb7f2c.png)

![image](https://user-images.githubusercontent.com/33649510/190877507-43b1fbc5-b324-46ba-8c5d-3938778af85f.png)

![image](https://user-images.githubusercontent.com/33649510/190877494-200d7b26-2e78-439b-8e35-8c419aad3858.png)

![image](https://user-images.githubusercontent.com/33649510/190877458-1bb63236-141f-4f15-86e6-47a99023fc28.png)












~~~
[root@DESKTOP-JJ9MM59 Gather logs]# sh cre_astro_gather_logs.sh
====> Here is the list of Namespaces found:
NAME                                    STATUS   AGE
astronomer                              Active   13d
astronomer-combusting-plane-6703        Active   12d
astronomer-interstellar-ecliptic-1909   Active   4m51s
cluster-autoscaler                      Active   13d
default                                 Active   13d
kube-node-lease                         Active   13d
kube-public                             Active   13d
kube-system                             Active   13d
====> You have specied astronomer as a namespace where all the core Astronomer platform pods are running.Please make sure it's correctly specified.
====> Your astronomer release name is astronomer.
====> The path where logs would be stored is /tmp/astro_logs.
====> Creating log file directory /tmp/astro_logs.
creating namespace astronomer Directory
creating namespace astronomer-combusting-plane-6703 Directory
creating namespace astronomer-interstellar-ecliptic-1909 Directory
======================Gathering Describe output of Bad state pod======================
interstellar-ecliptic-1909-flower-676d54b6b4-bp2bx pod is in bad state
Collecting Describe output of bad state pods in astronomer-interstellar-ecliptic-1909 Namespace
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
======================Collecting Some General enviornment Information in the astronomer-interstellar-ecliptic-1909======================
Gathering get all status  in astronomer-interstellar-ecliptic-1909 Namespace
Gathering All replica status in all namespaces
Gathering Pod Running status in astronomer-interstellar-ecliptic-1909 Namespace
Gathering events in astronomer-interstellar-ecliptic-1909 Namespace
Gathering secrets in astronomer-interstellar-ecliptic-1909 Namespace
Gathering sevice Status in astronomer-interstellar-ecliptic-1909 Namespace
Gathering persistent volume Status in astronomer-interstellar-ecliptic-1909 Namespace
Gathering ingress Status in astronomer-interstellar-ecliptic-1909 Namespace
Gathering cronjobs Status in astronomer-interstellar-ecliptic-1909 Namespace
Gathering jobs Status in astronomer-interstellar-ecliptic-1909 Namespace
No resources found in astronomer-interstellar-ecliptic-1909 namespace.
Exporting Release name
Your Release_Name in current namespace is interstellar-ecliptic-1909.
======================Gathering All the Deployment namespace logs in the astronomer-interstellar-ecliptic-1909======================
Gathering logs of scheduler in astronomer-interstellar-ecliptic-1909 Namespace
Found 2 pods, using pod/interstellar-ecliptic-1909-scheduler-bd46dd4f4-jzfvj
Gathering logs of worker in astronomer-interstellar-ecliptic-1909 Namespace
Gathering logs of webserverin astronomer-interstellar-ecliptic-1909 Namespace
Gathering logs of triggerer in astronomer-interstellar-ecliptic-1909 Namespace
Gathering logs of pgbouncer in astronomer-interstellar-ecliptic-1909 Namespace
Gathering logs of flower  in astronomer-interstellar-ecliptic-1909 Namespace
Gathering logs of statsd in astronomer-interstellar-ecliptic-1909 Namespace
Gathering logs of redis in astronomer-interstellar-ecliptic-1909 Namespace
Gathering helm history in astronomer-interstellar-ecliptic-1909 Namespace
Gathering helm values from astronomer-interstellar-ecliptic-1909 Namespace
======================creating GZ and zip files======================
tar: Removing leading `/' from member names
/tmp/astro_logs/
/tmp/astro_logs/astronomer-combusting-plane-6703/
/tmp/astro_logs/astronomer-combusting-plane-6703/helm_values_combusting-plane-6703.yaml
/tmp/astro_logs/astronomer-combusting-plane-6703/pgbouncer _astronomer-combusting-plane-6703.log
/tmp/astro_logs/astronomer-combusting-plane-6703/triggerer astronomer-combusting-plane-6703.log
/tmp/astro_logs/astronomer-combusting-plane-6703/rs_status_all_namespaces.log
/tmp/astro_logs/astronomer-combusting-plane-6703/getall_status_astronomer-combusting-plane-6703.log
/tmp/astro_logs/astronomer-combusting-plane-6703/svc_astronomer-combusting-plane-6703.log
/tmp/astro_logs/astronomer-combusting-plane-6703/pvc_astronomer-combusting-plane-6703.log
/tmp/astro_logs/astronomer-combusting-plane-6703/statsd_astronomer-combusting-plane-6703.log
/tmp/astro_logs/astronomer-combusting-plane-6703/pods_astronomer-combusting-plane-6703.log
/tmp/astro_logs/astronomer-combusting-plane-6703/redis_astronomer-combusting-plane-6703.log
/tmp/astro_logs/astronomer-combusting-plane-6703/webserverastronomer-combusting-plane-6703.log
/tmp/astro_logs/astronomer-combusting-plane-6703/cronjobs_astronomer-combusting-plane-6703.log
/tmp/astro_logs/astronomer-combusting-plane-6703/helm_history_combusting-plane-6703.yaml
/tmp/astro_logs/astronomer-combusting-plane-6703/ingress_astronomer-combusting-plane-6703.log
/tmp/astro_logs/astronomer-combusting-plane-6703/events_astronomer-combusting-plane-6703.log
/tmp/astro_logs/astronomer-combusting-plane-6703/scheduler_astronomer-combusting-plane-6703.log
/tmp/astro_logs/astronomer-combusting-plane-6703/flower _astronomer-combusting-plane-6703.log
/tmp/astro_logs/astronomer-combusting-plane-6703/worker_astronomer-combusting-plane-6703.log
/tmp/astro_logs/astronomer-combusting-plane-6703/secrets_astronomer-combusting-plane-6703.log
/tmp/astro_logs/astronomer/
/tmp/astro_logs/astronomer/DESCRIBE_ip-10-234-1-246.us-east-2.compute.internal.log
/tmp/astro_logs/astronomer/DESCRIBE_ip-10-234-2-242.us-east-2.compute.internal.log
/tmp/astro_logs/astronomer/houston-workerastronomer.log
/tmp/astro_logs/astronomer/nodes.log
/tmp/astro_logs/astronomer/nginx-default-backend_astronomer.log
/tmp/astro_logs/astronomer/alertmanager_astronomer.log
/tmp/astro_logs/astronomer/kube-state_astronomer.log
/tmp/astro_logs/astronomer/secrets_astronomer.log
/tmp/astro_logs/astronomer/DESCRIBE_ip-10-234-2-153.us-east-2.compute.internal.log
/tmp/astro_logs/astronomer/nginx_astronomer.log
/tmp/astro_logs/astronomer/svc_astronomer.log
/tmp/astro_logs/astronomer/kibana_astronomer.log
/tmp/astro_logs/astronomer/rs_status_all_namespaces.log
/tmp/astro_logs/astronomer/ingress_astronomer.log
/tmp/astro_logs/astronomer/DESCRIBE_ip-10-234-1-104.us-east-2.compute.internal.log
/tmp/astro_logs/astronomer/stan_contatiner_astronomer.log
/tmp/astro_logs/astronomer/DESCRIBE_ip-10-234-1-242.us-east-2.compute.internal.log
/tmp/astro_logs/astronomer/cli-install_astronomer.log
/tmp/astro_logs/astronomer/helm_history_astronomer.log
/tmp/astro_logs/astronomer/cronjobs_astronomer.log
/tmp/astro_logs/astronomer/helm_values_astronomer.yaml
/tmp/astro_logs/astronomer/prometheus_container_astronomer.log
/tmp/astro_logs/astronomer/DESCRIBE_ip-10-234-1-159.us-east-2.compute.internal.log
/tmp/astro_logs/astronomer/elasticsearch-master_astronomer.log
/tmp/astro_logs/astronomer/helm_status.log
/tmp/astro_logs/astronomer/events_astronomer.log
/tmp/astro_logs/astronomer/kube-system.log
/tmp/astro_logs/astronomer/getall_status_astronomer.log
/tmp/astro_logs/astronomer/elasticsearch-data_astronomer.log
/tmp/astro_logs/astronomer/pvc_astronomer.log
/tmp/astro_logs/astronomer/elasticsearch-clientastronomer.log
/tmp/astro_logs/astronomer/registryastronomer.log
/tmp/astro_logs/astronomer/commanderastronomer.log
/tmp/astro_logs/astronomer/nats_astronomer.log
/tmp/astro_logs/astronomer/houstonastronomer.log
/tmp/astro_logs/astronomer/DESCRIBE_ip-10-234-1-239.us-east-2.compute.internal.log
/tmp/astro_logs/astronomer/DESCRIBE_ip-10-234-2-22.us-east-2.compute.internal.log
/tmp/astro_logs/astronomer/elasticsearch-nginx_astronomer.log
/tmp/astro_logs/astronomer/DESCRIBE_ip-10-234-2-44.us-east-2.compute.internal.log
/tmp/astro_logs/astronomer/astro-uiastronomer.log
/tmp/astro_logs/astronomer/pods_astronomer.log
/tmp/astro_logs/astronomer/Enviornment_Info.log
/tmp/astro_logs/astronomer/grafana_astronomer.log
/tmp/astro_logs/astronomer/DESCRIBE_ip-10-234-2-100.us-east-2.compute.internal.log
/tmp/astro_logs/astronomer-interstellar-ecliptic-1909/
/tmp/astro_logs/astronomer-interstellar-ecliptic-1909/pods_astronomer-interstellar-ecliptic-1909.log
/tmp/astro_logs/astronomer-interstellar-ecliptic-1909/helm_values_interstellar-ecliptic-1909.yaml
/tmp/astro_logs/astronomer-interstellar-ecliptic-1909/pgbouncer _astronomer-interstellar-ecliptic-1909.log
/tmp/astro_logs/astronomer-interstellar-ecliptic-1909/events_astronomer-interstellar-ecliptic-1909.log
/tmp/astro_logs/astronomer-interstellar-ecliptic-1909/helm_history_interstellar-ecliptic-1909.yaml
/tmp/astro_logs/astronomer-interstellar-ecliptic-1909/BADpodDESCRIBE_astronomer-interstellar-ecliptic-1909.log
/tmp/astro_logs/astronomer-interstellar-ecliptic-1909/worker_astronomer-interstellar-ecliptic-1909.log
/tmp/astro_logs/astronomer-interstellar-ecliptic-1909/rs_status_all_namespaces.log
/tmp/astro_logs/astronomer-interstellar-ecliptic-1909/pvc_astronomer-interstellar-ecliptic-1909.log
/tmp/astro_logs/astronomer-interstellar-ecliptic-1909/scheduler_astronomer-interstellar-ecliptic-1909.log
/tmp/astro_logs/astronomer-interstellar-ecliptic-1909/triggerer astronomer-interstellar-ecliptic-1909.log
/tmp/astro_logs/astronomer-interstellar-ecliptic-1909/svc_astronomer-interstellar-ecliptic-1909.log
/tmp/astro_logs/astronomer-interstellar-ecliptic-1909/cronjobs_astronomer-interstellar-ecliptic-1909.log
/tmp/astro_logs/astronomer-interstellar-ecliptic-1909/statsd_astronomer-interstellar-ecliptic-1909.log
/tmp/astro_logs/astronomer-interstellar-ecliptic-1909/getall_status_astronomer-interstellar-ecliptic-1909.log
/tmp/astro_logs/astronomer-interstellar-ecliptic-1909/ingress_astronomer-interstellar-ecliptic-1909.log
/tmp/astro_logs/astronomer-interstellar-ecliptic-1909/secrets_astronomer-interstellar-ecliptic-1909.log
/tmp/astro_logs/astronomer-interstellar-ecliptic-1909/flower _astronomer-interstellar-ecliptic-1909.log
/tmp/astro_logs/astronomer-interstellar-ecliptic-1909/redis_astronomer-interstellar-ecliptic-1909.log
/tmp/astro_logs/astronomer-interstellar-ecliptic-1909/webserverastronomer-interstellar-ecliptic-1909.log
  adding: tmp/astro_logs/ (stored 0%)
  adding: tmp/astro_logs/astronomer-combusting-plane-6703/ (stored 0%)
  adding: tmp/astro_logs/astronomer-combusting-plane-6703/helm_values_combusting-plane-6703.yaml (deflated 78%)
  adding: tmp/astro_logs/astronomer-combusting-plane-6703/pgbouncer _astronomer-combusting-plane-6703.log (deflated 89%)
  adding: tmp/astro_logs/astronomer-combusting-plane-6703/triggerer astronomer-combusting-plane-6703.log (deflated 85%)
  adding: tmp/astro_logs/astronomer-combusting-plane-6703/rs_status_all_namespaces.log (deflated 67%)
  adding: tmp/astro_logs/astronomer-combusting-plane-6703/getall_status_astronomer-combusting-plane-6703.log (deflated 83%)
  adding: tmp/astro_logs/astronomer-combusting-plane-6703/svc_astronomer-combusting-plane-6703.log (deflated 65%)
  adding: tmp/astro_logs/astronomer-combusting-plane-6703/pvc_astronomer-combusting-plane-6703.log (deflated 42%)
  adding: tmp/astro_logs/astronomer-combusting-plane-6703/statsd_astronomer-combusting-plane-6703.log (deflated 49%)
  adding: tmp/astro_logs/astronomer-combusting-plane-6703/pods_astronomer-combusting-plane-6703.log (deflated 75%)
  adding: tmp/astro_logs/astronomer-combusting-plane-6703/redis_astronomer-combusting-plane-6703.log (deflated 90%)
  adding: tmp/astro_logs/astronomer-combusting-plane-6703/webserverastronomer-combusting-plane-6703.log (deflated 97%)
  adding: tmp/astro_logs/astronomer-combusting-plane-6703/cronjobs_astronomer-combusting-plane-6703.log (deflated 63%)
  adding: tmp/astro_logs/astronomer-combusting-plane-6703/helm_history_combusting-plane-6703.yaml (deflated 63%)
  adding: tmp/astro_logs/astronomer-combusting-plane-6703/ingress_astronomer-combusting-plane-6703.log (deflated 68%)
  adding: tmp/astro_logs/astronomer-combusting-plane-6703/events_astronomer-combusting-plane-6703.log (deflated 86%)
  adding: tmp/astro_logs/astronomer-combusting-plane-6703/scheduler_astronomer-combusting-plane-6703.log (deflated 93%)
  adding: tmp/astro_logs/astronomer-combusting-plane-6703/flower _astronomer-combusting-plane-6703.log (deflated 65%)
  adding: tmp/astro_logs/astronomer-combusting-plane-6703/worker_astronomer-combusting-plane-6703.log (deflated 96%)
  adding: tmp/astro_logs/astronomer-combusting-plane-6703/secrets_astronomer-combusting-plane-6703.log (deflated 85%)
  adding: tmp/astro_logs/astronomer/ (stored 0%)
  adding: tmp/astro_logs/astronomer/DESCRIBE_ip-10-234-1-246.us-east-2.compute.internal.log (deflated 72%)
  adding: tmp/astro_logs/astronomer/DESCRIBE_ip-10-234-2-242.us-east-2.compute.internal.log (deflated 70%)
  adding: tmp/astro_logs/astronomer/houston-workerastronomer.log (deflated 90%)
  adding: tmp/astro_logs/astronomer/nodes.log (deflated 85%)
  adding: tmp/astro_logs/astronomer/nginx-default-backend_astronomer.log (deflated 97%)
  adding: tmp/astro_logs/astronomer/alertmanager_astronomer.log (deflated 61%)
  adding: tmp/astro_logs/astronomer/kube-state_astronomer.log (deflated 55%)
  adding: tmp/astro_logs/astronomer/secrets_astronomer.log (deflated 85%)
  adding: tmp/astro_logs/astronomer/DESCRIBE_ip-10-234-2-153.us-east-2.compute.internal.log (deflated 72%)
  adding: tmp/astro_logs/astronomer/nginx_astronomer.log (deflated 94%)
  adding: tmp/astro_logs/astronomer/svc_astronomer.log (deflated 85%)
  adding: tmp/astro_logs/astronomer/kibana_astronomer.log (deflated 98%)
  adding: tmp/astro_logs/astronomer/rs_status_all_namespaces.log (deflated 83%)
  adding: tmp/astro_logs/astronomer/ingress_astronomer.log (deflated 83%)
  adding: tmp/astro_logs/astronomer/DESCRIBE_ip-10-234-1-104.us-east-2.compute.internal.log (deflated 70%)
  adding: tmp/astro_logs/astronomer/stan_contatiner_astronomer.log (deflated 88%)
  adding: tmp/astro_logs/astronomer/DESCRIBE_ip-10-234-1-242.us-east-2.compute.internal.log (deflated 71%)
  adding: tmp/astro_logs/astronomer/cli-install_astronomer.log (deflated 97%)
  adding: tmp/astro_logs/astronomer/helm_history_astronomer.log (deflated 74%)
  adding: tmp/astro_logs/astronomer/cronjobs_astronomer.log (deflated 79%)
  adding: tmp/astro_logs/astronomer/helm_values_astronomer.yaml (deflated 44%)
  adding: tmp/astro_logs/astronomer/prometheus_container_astronomer.log (deflated 91%)
  adding: tmp/astro_logs/astronomer/DESCRIBE_ip-10-234-1-159.us-east-2.compute.internal.log (deflated 71%)
  adding: tmp/astro_logs/astronomer/elasticsearch-master_astronomer.log (deflated 87%)
  adding: tmp/astro_logs/astronomer/helm_status.log (deflated 63%)
  adding: tmp/astro_logs/astronomer/events_astronomer.log (deflated 76%)
  adding: tmp/astro_logs/astronomer/kube-system.log (deflated 86%)
  adding: tmp/astro_logs/astronomer/getall_status_astronomer.log (deflated 90%)
  adding: tmp/astro_logs/astronomer/elasticsearch-data_astronomer.log (deflated 87%)
  adding: tmp/astro_logs/astronomer/pvc_astronomer.log (deflated 70%)
  adding: tmp/astro_logs/astronomer/elasticsearch-clientastronomer.log (deflated 88%)
  adding: tmp/astro_logs/astronomer/registryastronomer.log (deflated 98%)
  adding: tmp/astro_logs/astronomer/commanderastronomer.log (deflated 91%)
  adding: tmp/astro_logs/astronomer/nats_astronomer.log (deflated 73%)
  adding: tmp/astro_logs/astronomer/houstonastronomer.log (deflated 94%)
  adding: tmp/astro_logs/astronomer/DESCRIBE_ip-10-234-1-239.us-east-2.compute.internal.log (deflated 71%)
  adding: tmp/astro_logs/astronomer/DESCRIBE_ip-10-234-2-22.us-east-2.compute.internal.log (deflated 73%)
  adding: tmp/astro_logs/astronomer/elasticsearch-nginx_astronomer.log (deflated 98%)
  adding: tmp/astro_logs/astronomer/DESCRIBE_ip-10-234-2-44.us-east-2.compute.internal.log (deflated 71%)
  adding: tmp/astro_logs/astronomer/astro-uiastronomer.log (deflated 98%)
  adding: tmp/astro_logs/astronomer/pods_astronomer.log (deflated 88%)
  adding: tmp/astro_logs/astronomer/Enviornment_Info.log (deflated 62%)
  adding: tmp/astro_logs/astronomer/grafana_astronomer.log (deflated 93%)
  adding: tmp/astro_logs/astronomer/DESCRIBE_ip-10-234-2-100.us-east-2.compute.internal.log (deflated 71%)
  adding: tmp/astro_logs/astronomer-interstellar-ecliptic-1909/ (stored 0%)
  adding: tmp/astro_logs/astronomer-interstellar-ecliptic-1909/pods_astronomer-interstellar-ecliptic-1909.log (deflated 76%)
  adding: tmp/astro_logs/astronomer-interstellar-ecliptic-1909/helm_values_interstellar-ecliptic-1909.yaml (deflated 79%)
  adding: tmp/astro_logs/astronomer-interstellar-ecliptic-1909/pgbouncer _astronomer-interstellar-ecliptic-1909.log (deflated 66%)
  adding: tmp/astro_logs/astronomer-interstellar-ecliptic-1909/events_astronomer-interstellar-ecliptic-1909.log (deflated 91%)
  adding: tmp/astro_logs/astronomer-interstellar-ecliptic-1909/helm_history_interstellar-ecliptic-1909.yaml (deflated 23%)
  adding: tmp/astro_logs/astronomer-interstellar-ecliptic-1909/BADpodDESCRIBE_astronomer-interstellar-ecliptic-1909.log (deflated 66%)
  adding: tmp/astro_logs/astronomer-interstellar-ecliptic-1909/worker_astronomer-interstellar-ecliptic-1909.log (deflated 89%)
  adding: tmp/astro_logs/astronomer-interstellar-ecliptic-1909/rs_status_all_namespaces.log (deflated 68%)
  adding: tmp/astro_logs/astronomer-interstellar-ecliptic-1909/pvc_astronomer-interstellar-ecliptic-1909.log (deflated 42%)
  adding: tmp/astro_logs/astronomer-interstellar-ecliptic-1909/scheduler_astronomer-interstellar-ecliptic-1909.log (deflated 72%)
  adding: tmp/astro_logs/astronomer-interstellar-ecliptic-1909/triggerer astronomer-interstellar-ecliptic-1909.log (deflated 69%)
  adding: tmp/astro_logs/astronomer-interstellar-ecliptic-1909/svc_astronomer-interstellar-ecliptic-1909.log (deflated 67%)
  adding: tmp/astro_logs/astronomer-interstellar-ecliptic-1909/cronjobs_astronomer-interstellar-ecliptic-1909.log (stored 0%)
  adding: tmp/astro_logs/astronomer-interstellar-ecliptic-1909/statsd_astronomer-interstellar-ecliptic-1909.log (deflated 49%)
  adding: tmp/astro_logs/astronomer-interstellar-ecliptic-1909/getall_status_astronomer-interstellar-ecliptic-1909.log (deflated 80%)
  adding: tmp/astro_logs/astronomer-interstellar-ecliptic-1909/ingress_astronomer-interstellar-ecliptic-1909.log (deflated 69%)
  adding: tmp/astro_logs/astronomer-interstellar-ecliptic-1909/secrets_astronomer-interstellar-ecliptic-1909.log (deflated 84%)
  adding: tmp/astro_logs/astronomer-interstellar-ecliptic-1909/flower _astronomer-interstellar-ecliptic-1909.log (deflated 65%)
  adding: tmp/astro_logs/astronomer-interstellar-ecliptic-1909/redis_astronomer-interstellar-ecliptic-1909.log (deflated 51%)
  adding: tmp/astro_logs/astronomer-interstellar-ecliptic-1909/webserverastronomer-interstellar-ecliptic-1909.log (deflated 94%)
Here is the list of files created:
/tmp/astro_logs/astronomer:
total 40M
-rw-r--r-- 1 root root 5.2K Sep 19 10:15 DESCRIBE_ip-10-234-1-104.us-east-2.compute.internal.log
-rw-r--r-- 1 root root 5.5K Sep 19 10:15 DESCRIBE_ip-10-234-1-159.us-east-2.compute.internal.log
-rw-r--r-- 1 root root 5.6K Sep 19 10:15 DESCRIBE_ip-10-234-1-239.us-east-2.compute.internal.log
-rw-r--r-- 1 root root 5.6K Sep 19 10:15 DESCRIBE_ip-10-234-1-242.us-east-2.compute.internal.log
-rw-r--r-- 1 root root 6.1K Sep 19 10:15 DESCRIBE_ip-10-234-1-246.us-east-2.compute.internal.log
-rw-r--r-- 1 root root 5.6K Sep 19 10:15 DESCRIBE_ip-10-234-2-100.us-east-2.compute.internal.log
-rw-r--r-- 1 root root 5.8K Sep 19 10:15 DESCRIBE_ip-10-234-2-153.us-east-2.compute.internal.log
-rw-r--r-- 1 root root 6.3K Sep 19 10:15 DESCRIBE_ip-10-234-2-22.us-east-2.compute.internal.log
-rw-r--r-- 1 root root 5.2K Sep 19 10:15 DESCRIBE_ip-10-234-2-242.us-east-2.compute.internal.log
-rw-r--r-- 1 root root 5.5K Sep 19 10:15 DESCRIBE_ip-10-234-2-44.us-east-2.compute.internal.log
-rw-r--r-- 1 root root 6.6M Sep 19 10:15 houstonastronomer.log
-rw-r--r-- 1 root root  30K Sep 19 10:15 houston-workerastronomer.log
-rw-r--r-- 1 root root 4.8M Sep 19 10:15 astro-uiastronomer.log
-rw-r--r-- 1 root root 4.4M Sep 19 10:15 commanderastronomer.log
-rw-r--r-- 1 root root 2.5M Sep 19 10:15 nginx_astronomer.log
-rw-r--r-- 1 root root 1.7K Sep 19 10:16 kube-state_astronomer.log
-rw-r--r-- 1 root root 5.2M Sep 19 10:16 kibana_astronomer.log
-rw-r--r-- 1 root root 2.5M Sep 19 10:16 nginx-default-backend_astronomer.log
-rw-r--r-- 1 root root 109K Sep 19 10:16 grafana_astronomer.log
-rw-r--r-- 1 root root 6.1M Sep 19 10:16 elasticsearch-nginx_astronomer.log
-rw-r--r-- 1 root root 2.4M Sep 19 10:16 cli-install_astronomer.log
-rw-r--r-- 1 root root  43K Sep 19 10:16 elasticsearch-clientastronomer.log
-rw-r--r-- 1 root root  36K Sep 19 10:16 elasticsearch-master_astronomer.log
-rw-r--r-- 1 root root  37K Sep 19 10:16 elasticsearch-data_astronomer.log
-rw-r--r-- 1 root root 165K Sep 19 10:16 stan_contatiner_astronomer.log
-rw-r--r-- 1 root root 4.4M Sep 19 10:16 registryastronomer.log
-rw-r--r-- 1 root root  81K Sep 19 10:16 prometheus_container_astronomer.log
-rw-r--r-- 1 root root 3.0K Sep 19 10:16 nats_astronomer.log
-rw-r--r-- 1 root root 1.4K Sep 19 10:16 alertmanager_astronomer.log
-rw-r--r-- 1 root root  52K Sep 19 10:17 getall_status_astronomer.log
-rw-r--r-- 1 root root 3.9K Sep 19 10:17 rs_status_all_namespaces.log
-rw-r--r-- 1 root root  12K Sep 19 10:17 pods_astronomer.log
-rw-r--r-- 1 root root 1.9K Sep 19 10:17 events_astronomer.log
-rw-r--r-- 1 root root 2.9K Sep 19 10:17 secrets_astronomer.log
-rw-r--r-- 1 root root 2.1K Sep 19 10:17 nodes.log
-rw-r--r-- 1 root root 3.3K Sep 19 10:17 kube-system.log
-rw-r--r-- 1 root root 4.4K Sep 19 10:17 svc_astronomer.log
-rw-r--r-- 1 root root 1.7K Sep 19 10:17 pvc_astronomer.log
-rw-r--r-- 1 root root 1.6K Sep 19 10:17 ingress_astronomer.log
-rw-r--r-- 1 root root 1.7K Sep 19 10:17 cronjobs_astronomer.log
-rw-r--r-- 1 root root 1.4K Sep 19 10:17 Enviornment_Info.log
-rw-r--r-- 1 root root  830 Sep 19 10:17 helm_status.log
-rw-r--r-- 1 root root 1012 Sep 19 10:17 helm_history_astronomer.log
-rw-r--r-- 1 root root  579 Sep 19 10:17 helm_values_astronomer.yaml

/tmp/astro_logs/astronomer-combusting-plane-6703:
total 12M
-rw-r--r-- 1 root root 6.6K Sep 19 10:17  getall_status_astronomer-combusting-plane-6703.log
-rw-r--r-- 1 root root  610 Sep 19 10:17  rs_status_all_namespaces.log
-rw-r--r-- 1 root root 1.9K Sep 19 10:17  pods_astronomer-combusting-plane-6703.log
-rw-r--r-- 1 root root 6.1K Sep 19 10:17  events_astronomer-combusting-plane-6703.log
-rw-r--r-- 1 root root 3.3K Sep 19 10:17  secrets_astronomer-combusting-plane-6703.log
-rw-r--r-- 1 root root  707 Sep 19 10:17  svc_astronomer-combusting-plane-6703.log
-rw-r--r-- 1 root root  276 Sep 19 10:17  pvc_astronomer-combusting-plane-6703.log
-rw-r--r-- 1 root root  684 Sep 19 10:17  ingress_astronomer-combusting-plane-6703.log
-rw-r--r-- 1 root root  280 Sep 19 10:18  cronjobs_astronomer-combusting-plane-6703.log
-rw-r--r-- 1 root root 2.3M Sep 19 10:18  scheduler_astronomer-combusting-plane-6703.log
-rw-r--r-- 1 root root 2.4M Sep 19 10:18  worker_astronomer-combusting-plane-6703.log
-rw-r--r-- 1 root root 4.6M Sep 19 10:18  webserverastronomer-combusting-plane-6703.log
-rw-r--r-- 1 root root 7.3K Sep 19 10:18 'triggerer astronomer-combusting-plane-6703.log'
-rw-r--r-- 1 root root 1.9M Sep 19 10:18 'pgbouncer _astronomer-combusting-plane-6703.log'
-rw-r--r-- 1 root root 2.1K Sep 19 10:18 'flower _astronomer-combusting-plane-6703.log'
-rw-r--r-- 1 root root  568 Sep 19 10:18  statsd_astronomer-combusting-plane-6703.log
-rw-r--r-- 1 root root 202K Sep 19 10:18  redis_astronomer-combusting-plane-6703.log
-rw-r--r-- 1 root root  528 Sep 19 10:18  helm_history_combusting-plane-6703.yaml
-rw-r--r-- 1 root root  47K Sep 19 10:18  helm_values_combusting-plane-6703.yaml

/tmp/astro_logs/astronomer-interstellar-ecliptic-1909:
total 224K
-rw-r--r-- 1 root root 6.3K Sep 19 10:14  BADpodDESCRIBE_astronomer-interstellar-ecliptic-1909.log
-rw-r--r-- 1 root root 3.8K Sep 19 10:18  getall_status_astronomer-interstellar-ecliptic-1909.log
-rw-r--r-- 1 root root  670 Sep 19 10:18  rs_status_all_namespaces.log
-rw-r--r-- 1 root root 1.9K Sep 19 10:18  pods_astronomer-interstellar-ecliptic-1909.log
-rw-r--r-- 1 root root  21K Sep 19 10:18  events_astronomer-interstellar-ecliptic-1909.log
-rw-r--r-- 1 root root 2.8K Sep 19 10:18  secrets_astronomer-interstellar-ecliptic-1909.log
-rw-r--r-- 1 root root  747 Sep 19 10:18  svc_astronomer-interstellar-ecliptic-1909.log
-rw-r--r-- 1 root root  288 Sep 19 10:18  pvc_astronomer-interstellar-ecliptic-1909.log
-rw-r--r-- 1 root root  718 Sep 19 10:18  ingress_astronomer-interstellar-ecliptic-1909.log
-rw-r--r-- 1 root root    0 Sep 19 10:18  cronjobs_astronomer-interstellar-ecliptic-1909.log
-rw-r--r-- 1 root root 6.2K Sep 19 10:19  scheduler_astronomer-interstellar-ecliptic-1909.log
-rw-r--r-- 1 root root  42K Sep 19 10:19  worker_astronomer-interstellar-ecliptic-1909.log
-rw-r--r-- 1 root root  66K Sep 19 10:19  webserverastronomer-interstellar-ecliptic-1909.log
-rw-r--r-- 1 root root 2.0K Sep 19 10:19 'triggerer astronomer-interstellar-ecliptic-1909.log'
-rw-r--r-- 1 root root 1.6K Sep 19 10:19 'pgbouncer _astronomer-interstellar-ecliptic-1909.log'
-rw-r--r-- 1 root root 2.2K Sep 19 10:19 'flower _astronomer-interstellar-ecliptic-1909.log'
-rw-r--r-- 1 root root  568 Sep 19 10:19  statsd_astronomer-interstellar-ecliptic-1909.log
-rw-r--r-- 1 root root  639 Sep 19 10:19  redis_astronomer-interstellar-ecliptic-1909.log
-rw-r--r-- 1 root root  172 Sep 19 10:19  helm_history_interstellar-ecliptic-1909.yaml
-rw-r--r-- 1 root root  19K Sep 19 10:19  helm_values_interstellar-ecliptic-1909.yaml
/tmp/astro_logs/astronomer:
total 40M
-rw-r--r-- 1 root root 5.2K Sep 19 10:15 DESCRIBE_ip-10-234-1-104.us-east-2.compute.internal.log
-rw-r--r-- 1 root root 5.5K Sep 19 10:15 DESCRIBE_ip-10-234-1-159.us-east-2.compute.internal.log
-rw-r--r-- 1 root root 5.6K Sep 19 10:15 DESCRIBE_ip-10-234-1-239.us-east-2.compute.internal.log
-rw-r--r-- 1 root root 5.6K Sep 19 10:15 DESCRIBE_ip-10-234-1-242.us-east-2.compute.internal.log
-rw-r--r-- 1 root root 6.1K Sep 19 10:15 DESCRIBE_ip-10-234-1-246.us-east-2.compute.internal.log
-rw-r--r-- 1 root root 5.6K Sep 19 10:15 DESCRIBE_ip-10-234-2-100.us-east-2.compute.internal.log
-rw-r--r-- 1 root root 5.8K Sep 19 10:15 DESCRIBE_ip-10-234-2-153.us-east-2.compute.internal.log
-rw-r--r-- 1 root root 6.3K Sep 19 10:15 DESCRIBE_ip-10-234-2-22.us-east-2.compute.internal.log
-rw-r--r-- 1 root root 5.2K Sep 19 10:15 DESCRIBE_ip-10-234-2-242.us-east-2.compute.internal.log
-rw-r--r-- 1 root root 5.5K Sep 19 10:15 DESCRIBE_ip-10-234-2-44.us-east-2.compute.internal.log
-rw-r--r-- 1 root root 6.6M Sep 19 10:15 houstonastronomer.log
-rw-r--r-- 1 root root  30K Sep 19 10:15 houston-workerastronomer.log
-rw-r--r-- 1 root root 4.8M Sep 19 10:15 astro-uiastronomer.log
-rw-r--r-- 1 root root 4.4M Sep 19 10:15 commanderastronomer.log
-rw-r--r-- 1 root root 2.5M Sep 19 10:15 nginx_astronomer.log
-rw-r--r-- 1 root root 1.7K Sep 19 10:16 kube-state_astronomer.log
-rw-r--r-- 1 root root 5.2M Sep 19 10:16 kibana_astronomer.log
-rw-r--r-- 1 root root 2.5M Sep 19 10:16 nginx-default-backend_astronomer.log
-rw-r--r-- 1 root root 109K Sep 19 10:16 grafana_astronomer.log
-rw-r--r-- 1 root root 6.1M Sep 19 10:16 elasticsearch-nginx_astronomer.log
-rw-r--r-- 1 root root 2.4M Sep 19 10:16 cli-install_astronomer.log
-rw-r--r-- 1 root root  43K Sep 19 10:16 elasticsearch-clientastronomer.log
-rw-r--r-- 1 root root  36K Sep 19 10:16 elasticsearch-master_astronomer.log
-rw-r--r-- 1 root root  37K Sep 19 10:16 elasticsearch-data_astronomer.log
-rw-r--r-- 1 root root 165K Sep 19 10:16 stan_contatiner_astronomer.log
-rw-r--r-- 1 root root 4.4M Sep 19 10:16 registryastronomer.log
-rw-r--r-- 1 root root  81K Sep 19 10:16 prometheus_container_astronomer.log
-rw-r--r-- 1 root root 3.0K Sep 19 10:16 nats_astronomer.log
-rw-r--r-- 1 root root 1.4K Sep 19 10:16 alertmanager_astronomer.log
-rw-r--r-- 1 root root  52K Sep 19 10:17 getall_status_astronomer.log
-rw-r--r-- 1 root root 3.9K Sep 19 10:17 rs_status_all_namespaces.log
-rw-r--r-- 1 root root  12K Sep 19 10:17 pods_astronomer.log
-rw-r--r-- 1 root root 1.9K Sep 19 10:17 events_astronomer.log
-rw-r--r-- 1 root root 2.9K Sep 19 10:17 secrets_astronomer.log
-rw-r--r-- 1 root root 2.1K Sep 19 10:17 nodes.log
-rw-r--r-- 1 root root 3.3K Sep 19 10:17 kube-system.log
-rw-r--r-- 1 root root 4.4K Sep 19 10:17 svc_astronomer.log
-rw-r--r-- 1 root root 1.7K Sep 19 10:17 pvc_astronomer.log
-rw-r--r-- 1 root root 1.6K Sep 19 10:17 ingress_astronomer.log
-rw-r--r-- 1 root root 1.7K Sep 19 10:17 cronjobs_astronomer.log
-rw-r--r-- 1 root root 1.4K Sep 19 10:17 Enviornment_Info.log
-rw-r--r-- 1 root root  830 Sep 19 10:17 helm_status.log
-rw-r--r-- 1 root root 1012 Sep 19 10:17 helm_history_astronomer.log
-rw-r--r-- 1 root root  579 Sep 19 10:17 helm_values_astronomer.yaml

/tmp/astro_logs/astronomer-combusting-plane-6703:
total 12M
-rw-r--r-- 1 root root 6.6K Sep 19 10:17  getall_status_astronomer-combusting-plane-6703.log
-rw-r--r-- 1 root root  610 Sep 19 10:17  rs_status_all_namespaces.log
-rw-r--r-- 1 root root 1.9K Sep 19 10:17  pods_astronomer-combusting-plane-6703.log
-rw-r--r-- 1 root root 6.1K Sep 19 10:17  events_astronomer-combusting-plane-6703.log
-rw-r--r-- 1 root root 3.3K Sep 19 10:17  secrets_astronomer-combusting-plane-6703.log
-rw-r--r-- 1 root root  707 Sep 19 10:17  svc_astronomer-combusting-plane-6703.log
-rw-r--r-- 1 root root  276 Sep 19 10:17  pvc_astronomer-combusting-plane-6703.log
-rw-r--r-- 1 root root  684 Sep 19 10:17  ingress_astronomer-combusting-plane-6703.log
-rw-r--r-- 1 root root  280 Sep 19 10:18  cronjobs_astronomer-combusting-plane-6703.log
-rw-r--r-- 1 root root 2.3M Sep 19 10:18  scheduler_astronomer-combusting-plane-6703.log
-rw-r--r-- 1 root root 2.4M Sep 19 10:18  worker_astronomer-combusting-plane-6703.log
-rw-r--r-- 1 root root 4.6M Sep 19 10:18  webserverastronomer-combusting-plane-6703.log
-rw-r--r-- 1 root root 7.3K Sep 19 10:18 'triggerer astronomer-combusting-plane-6703.log'
-rw-r--r-- 1 root root 1.9M Sep 19 10:18 'pgbouncer _astronomer-combusting-plane-6703.log'
-rw-r--r-- 1 root root 2.1K Sep 19 10:18 'flower _astronomer-combusting-plane-6703.log'
-rw-r--r-- 1 root root  568 Sep 19 10:18  statsd_astronomer-combusting-plane-6703.log
-rw-r--r-- 1 root root 202K Sep 19 10:18  redis_astronomer-combusting-plane-6703.log
-rw-r--r-- 1 root root  528 Sep 19 10:18  helm_history_combusting-plane-6703.yaml
-rw-r--r-- 1 root root  47K Sep 19 10:18  helm_values_combusting-plane-6703.yaml

/tmp/astro_logs/astronomer-interstellar-ecliptic-1909:
total 224K
-rw-r--r-- 1 root root 6.3K Sep 19 10:14  BADpodDESCRIBE_astronomer-interstellar-ecliptic-1909.log
-rw-r--r-- 1 root root 3.8K Sep 19 10:18  getall_status_astronomer-interstellar-ecliptic-1909.log
-rw-r--r-- 1 root root  670 Sep 19 10:18  rs_status_all_namespaces.log
-rw-r--r-- 1 root root 1.9K Sep 19 10:18  pods_astronomer-interstellar-ecliptic-1909.log
-rw-r--r-- 1 root root  21K Sep 19 10:18  events_astronomer-interstellar-ecliptic-1909.log
-rw-r--r-- 1 root root 2.8K Sep 19 10:18  secrets_astronomer-interstellar-ecliptic-1909.log
-rw-r--r-- 1 root root  747 Sep 19 10:18  svc_astronomer-interstellar-ecliptic-1909.log
-rw-r--r-- 1 root root  288 Sep 19 10:18  pvc_astronomer-interstellar-ecliptic-1909.log
-rw-r--r-- 1 root root  718 Sep 19 10:18  ingress_astronomer-interstellar-ecliptic-1909.log
-rw-r--r-- 1 root root    0 Sep 19 10:18  cronjobs_astronomer-interstellar-ecliptic-1909.log
-rw-r--r-- 1 root root 6.2K Sep 19 10:19  scheduler_astronomer-interstellar-ecliptic-1909.log
-rw-r--r-- 1 root root  42K Sep 19 10:19  worker_astronomer-interstellar-ecliptic-1909.log
-rw-r--r-- 1 root root  66K Sep 19 10:19  webserverastronomer-interstellar-ecliptic-1909.log
-rw-r--r-- 1 root root 2.0K Sep 19 10:19 'triggerer astronomer-interstellar-ecliptic-1909.log'
-rw-r--r-- 1 root root 1.6K Sep 19 10:19 'pgbouncer _astronomer-interstellar-ecliptic-1909.log'
-rw-r--r-- 1 root root 2.2K Sep 19 10:19 'flower _astronomer-interstellar-ecliptic-1909.log'
-rw-r--r-- 1 root root  568 Sep 19 10:19  statsd_astronomer-interstellar-ecliptic-1909.log
-rw-r--r-- 1 root root  639 Sep 19 10:19  redis_astronomer-interstellar-ecliptic-1909.log
-rw-r--r-- 1 root root  172 Sep 19 10:19  helm_history_interstellar-ecliptic-1909.yaml
-rw-r--r-- 1 root root  19K Sep 19 10:19  helm_values_interstellar-ecliptic-1909.yaml
total 4.6M
drwxrwxrwx 5 root root 4.0K Sep 19 10:14 astro_logs
-rw-r--r-- 1 root root 2.3M Sep 19 10:19 astro_logs_2022-09-19.tar.gz
-rw-r--r-- 1 root root 2.3M Sep 19 10:19 astro_logs_2022-09-19.zip
Please attach the zip file or .gz file created in /tmp to the zendesk ticket for reference.
~~~
