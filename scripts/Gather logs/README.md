
****cre_astro_gather_logs****
====================================

It will export pod logs,events,helm values,node status,secrets,rs,ingres,jobs etc. 
Also, it will include describe output of all the nodes & the status of pods that are in a bad state.


We have to make sure to add below paramters in script.The script is interactive and would ask the same

1.) Astronomer namespace (Astronomer Namespace to collect logs)


2.) DIR (local directory to export the logs)


3.) BASEDOMAIN (I had a test cluster with the URL ```https://app.nandlal51.astro-cre.com``` then my base domain is ```nandlal51.astro-cre.com```
~~~
export ASTRONOMER_NAMESPACE=
export DIR=
export BASEDOMAIN=
~~~

Usage: Just run the shell script as below and you will get required log files.


Make sure your script is in unix format and executable:

~~~
dos2unix *.sh 
chmod 755 *.sh
~~~

Expected output:

![image](https://user-images.githubusercontent.com/33649510/191579495-68d37f5c-74f9-4372-a2df-2be9e8768ba9.png)


![image](https://user-images.githubusercontent.com/33649510/190877503-5ada590a-75cf-41bd-93e0-7b6d59bb7f2c.png)

![image](https://user-images.githubusercontent.com/33649510/190877507-43b1fbc5-b324-46ba-8c5d-3938778af85f.png)

![image](https://user-images.githubusercontent.com/33649510/190877494-200d7b26-2e78-439b-8e35-8c419aad3858.png)

![image](https://user-images.githubusercontent.com/33649510/190877458-1bb63236-141f-4f15-86e6-47a99023fc28.png)












~~~
[root@DESKTOP-JJ9MM59 Gather logs]# sh cre_astro_gather_logs.sh
Enter your Astronomer Namespace Name:
astronomer
Enter the path of directory where you want to keep your log files exported:
/tmp
what is your basedomain:
nandlal51.astro-cre.com
====> Here is the list of Namespaces found:
NAME                                         STATUS   AGE
astronomer                                   Active   15d
astronomer-extraterrestrial-meteorite-6103   Active   38h
astronomer-planetesimal-aphelion-2140        Active   38h
cluster-autoscaler                           Active   15d
default                                      Active   15d
kube-node-lease                              Active   15d
kube-public                                  Active   15d
kube-system                                  Active   15d
====> You have specied astronomer as a namespace where all the core Astronomer platform pods are running.Please make sure it's correctly specified.
====> Your astronomer release name is astronomer.
====> The path where logs would be stored is /tmp/astro_logs.
====> Your Base Domain is nandlal51.astro-cre.com.This means you should access your Astronomer UI at https://app.nandlal51.astro-cre.com
====> Creating log file directory /tmp/astro_logs.
creating namespace astronomer Directory
creating namespace astronomer-extraterrestrial-meteorite-6103 Directory
creating namespace astronomer-planetesimal-aphelion-2140 Directory
======================Gathering Describe output of Bad state pod======================
planetesimal-aphelion-2140-pgbouncer-8596df4bbf-qnnxt pod is in bad state
Collecting Describe output of bad state pod planetesimal-aphelion-2140-pgbouncer-8596df4bbf-qnnxt in astronomer-planetesimal-aphelion-2140 Namespace
planetesimal-aphelion-2140-triggerer-59b6787fdf-49d5t pod is in bad state
Collecting Describe output of bad state pod planetesimal-aphelion-2140-triggerer-59b6787fdf-49d5t in astronomer-planetesimal-aphelion-2140 Namespace
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
Found 2 pods, using pod/astronomer-houston-cf67c758-4txb6
Gathering logs of houston-worker in astronomer Namespace
Found 2 pods, using pod/astronomer-houston-worker-f68cb689b-n8tqs
Gathering logs of astro-ui in astronomer Namespace
Found 2 pods, using pod/astronomer-astro-ui-5b44b44f4-vnfmc
Gathering logs of commander in astronomer Namespace
Found 2 pods, using pod/astronomer-commander-57559fc99f-vkxjb
Gathering logs of nginx in astronomer Namespace
Found 2 pods, using pod/astronomer-nginx-df4b74944-4vqfv
Gathering logs of grafana in astronomer Namespace
Gathering logs of kube-state in astronomer Namespace
Gathering logs of kibana in astronomer Namespace
Gathering logs of nginx-default-backend in astronomer Namespace
Found 2 pods, using pod/astronomer-nginx-default-backend-864d4468b8-bhl6b
Gathering logs of elasticsearch-exporterin astronomer Namespace
Gathering logs of elasticsearch-nginx in astronomer Namespace
Gathering logs of cli-install in astronomer Namespace
Gathering logs of elasticsearch-client in astronomer Namespace
Found 2 pods, using pod/astronomer-elasticsearch-client-6f8f4f5897-gzgjr
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
======================Collecting Some General enviornment Information in the astronomer-extraterrestrial-meteorite-6103======================
Gathering get all status  in astronomer-extraterrestrial-meteorite-6103 Namespace
Gathering All replica status in all namespaces
Gathering Pod Running status in astronomer-extraterrestrial-meteorite-6103 Namespace
Gathering events in astronomer-extraterrestrial-meteorite-6103 Namespace
Gathering secrets in astronomer-extraterrestrial-meteorite-6103 Namespace
Gathering sevice Status in astronomer-extraterrestrial-meteorite-6103 Namespace
Gathering persistent volume Status in astronomer-extraterrestrial-meteorite-6103 Namespace
Gathering ingress Status in astronomer-extraterrestrial-meteorite-6103 Namespace
Gathering cronjobs Status in astronomer-extraterrestrial-meteorite-6103 Namespace
Gathering jobs Status in astronomer-extraterrestrial-meteorite-6103 Namespace
Exporting Release name
Your Release_Name in current namespace is extraterrestrial-meteorite-6103.
======================Gathering All the Deployment namespace logs in the astronomer-extraterrestrial-meteorite-6103======================
Gathering logs of scheduler in astronomer-extraterrestrial-meteorite-6103 Namespace
Found 2 pods, using pod/extraterrestrial-meteorite-6103-scheduler-d6f644c7d-ffrzk
Gathering logs of worker in astronomer-extraterrestrial-meteorite-6103 Namespace
Gathering logs of webserverin astronomer-extraterrestrial-meteorite-6103 Namespace
Gathering logs of triggerer in astronomer-extraterrestrial-meteorite-6103 Namespace
Gathering logs of pgbouncer in astronomer-extraterrestrial-meteorite-6103 Namespace
Gathering logs of flower  in astronomer-extraterrestrial-meteorite-6103 Namespace
Gathering logs of statsd in astronomer-extraterrestrial-meteorite-6103 Namespace
Gathering logs of redis in astronomer-extraterrestrial-meteorite-6103 Namespace
Gathering helm history in astronomer-extraterrestrial-meteorite-6103 Namespace
Gathering helm values from astronomer-extraterrestrial-meteorite-6103 Namespace
======================Collecting Some General enviornment Information in the astronomer-planetesimal-aphelion-2140======================
Gathering get all status  in astronomer-planetesimal-aphelion-2140 Namespace
Gathering All replica status in all namespaces
Gathering Pod Running status in astronomer-planetesimal-aphelion-2140 Namespace
Gathering events in astronomer-planetesimal-aphelion-2140 Namespace
Gathering secrets in astronomer-planetesimal-aphelion-2140 Namespace
Gathering sevice Status in astronomer-planetesimal-aphelion-2140 Namespace
Gathering persistent volume Status in astronomer-planetesimal-aphelion-2140 Namespace
Gathering ingress Status in astronomer-planetesimal-aphelion-2140 Namespace
Gathering cronjobs Status in astronomer-planetesimal-aphelion-2140 Namespace
Gathering jobs Status in astronomer-planetesimal-aphelion-2140 Namespace
Exporting Release name
Your Release_Name in current namespace is planetesimal-aphelion-2140.
======================Gathering All the Deployment namespace logs in the astronomer-planetesimal-aphelion-2140======================
Gathering logs of scheduler in astronomer-planetesimal-aphelion-2140 Namespace
Found 2 pods, using pod/planetesimal-aphelion-2140-scheduler-dd9ccf976-nmqdn
Gathering logs of worker in astronomer-planetesimal-aphelion-2140 Namespace
Gathering logs of webserverin astronomer-planetesimal-aphelion-2140 Namespace
Gathering logs of triggerer in astronomer-planetesimal-aphelion-2140 Namespace
Found 2 pods, using pod/planetesimal-aphelion-2140-triggerer-66cdc98d95-xnlt9
Gathering logs of pgbouncer in astronomer-planetesimal-aphelion-2140 Namespace
Found 2 pods, using pod/planetesimal-aphelion-2140-pgbouncer-7f9f648655-r94qp
Gathering logs of flower  in astronomer-planetesimal-aphelion-2140 Namespace
Gathering logs of statsd in astronomer-planetesimal-aphelion-2140 Namespace
Gathering logs of redis in astronomer-planetesimal-aphelion-2140 Namespace
Gathering helm history in astronomer-planetesimal-aphelion-2140 Namespace
Gathering helm values from astronomer-planetesimal-aphelion-2140 Namespace
cre_astro_gather_logs.sh: line 139: o: command not found
======================CHECKING Houston ENDPOINT for 10.234.1.9======================
 PLEASE NOTE ========>>>> you have to run nslookup houston.nandlal51.astro-cre.com 10.234.1.9 inside any of the pods lets say inside a nginx pod to make sure endpoints are running fine
======================CHECKING Houston ENDPOINT for 10.234.2.104======================
 PLEASE NOTE ========>>>> you have to run nslookup houston.nandlal51.astro-cre.com 10.234.2.104 inside any of the pods lets say inside a nginx pod to make sure endpoints are running fine
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
  0     0    0     0    0     0      0      0 --:--:--  0:00:01 --:--:--     0
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
  0     0    0     0    0     0      0      0 --:--:--  0:00:01 --:--:--     0
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
  0   271    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
  0   271    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
  0   271    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
  0   271    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
  0   271    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
  0   271    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
  0   271    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
  0   271    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
  0   271    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
  0   271    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0
======================creating GZ and zip files======================
tar: Removing leading `/' from member names
/tmp/astro_logs/
/tmp/astro_logs/curl_check_registry.nandlal51.astro-cre.com.log
/tmp/astro_logs/nslookup_houston_10.234.1.9.nandlal51.astro-cre.com.log
/tmp/astro_logs/astronomer-planetesimal-aphelion-2140/
/tmp/astro_logs/astronomer-planetesimal-aphelion-2140/svc_astronomer-planetesimal-aphelion-2140.log
/tmp/astro_logs/astronomer-planetesimal-aphelion-2140/pvc_astronomer-planetesimal-aphelion-2140.log
/tmp/astro_logs/astronomer-planetesimal-aphelion-2140/getall_status_astronomer-planetesimal-aphelion-2140.log
/tmp/astro_logs/astronomer-planetesimal-aphelion-2140/ingress_astronomer-planetesimal-aphelion-2140.log
/tmp/astro_logs/astronomer-planetesimal-aphelion-2140/worker_astronomer-planetesimal-aphelion-2140.log
/tmp/astro_logs/astronomer-planetesimal-aphelion-2140/events_astronomer-planetesimal-aphelion-2140.log
/tmp/astro_logs/astronomer-planetesimal-aphelion-2140/planetesimal-aphelion-2140-pgbouncer-8596df4bbf-qnnxt-BAD_astronomer-planetesimal-aphelion-2140.log
/tmp/astro_logs/astronomer-planetesimal-aphelion-2140/rs_status_all_namespaces.log
/tmp/astro_logs/astronomer-planetesimal-aphelion-2140/pods_astronomer-planetesimal-aphelion-2140.log
/tmp/astro_logs/astronomer-planetesimal-aphelion-2140/planetesimal-aphelion-2140-triggerer-59b6787fdf-49d5t-BAD_astronomer-planetesimal-aphelion-2140.log
/tmp/astro_logs/astronomer-planetesimal-aphelion-2140/helm_history_planetesimal-aphelion-2140.yaml
/tmp/astro_logs/astronomer-planetesimal-aphelion-2140/triggerer astronomer-planetesimal-aphelion-2140.log
/tmp/astro_logs/astronomer-planetesimal-aphelion-2140/scheduler_astronomer-planetesimal-aphelion-2140.log
/tmp/astro_logs/astronomer-planetesimal-aphelion-2140/redis_astronomer-planetesimal-aphelion-2140.log
/tmp/astro_logs/astronomer-planetesimal-aphelion-2140/cronjobs_astronomer-planetesimal-aphelion-2140.log
/tmp/astro_logs/astronomer-planetesimal-aphelion-2140/helm_values_planetesimal-aphelion-2140.yaml
/tmp/astro_logs/astronomer-planetesimal-aphelion-2140/secrets_astronomer-planetesimal-aphelion-2140.log
/tmp/astro_logs/astronomer-planetesimal-aphelion-2140/webserverastronomer-planetesimal-aphelion-2140.log
/tmp/astro_logs/astronomer-planetesimal-aphelion-2140/pgbouncer _astronomer-planetesimal-aphelion-2140.log
/tmp/astro_logs/astronomer-planetesimal-aphelion-2140/flower _astronomer-planetesimal-aphelion-2140.log
/tmp/astro_logs/astronomer-planetesimal-aphelion-2140/statsd_astronomer-planetesimal-aphelion-2140.log
/tmp/astro_logs/curl_check_install.nandlal51.astro-cre.com.log
/tmp/astro_logs/astro_logs_2022-09-21.tar.gz
/tmp/astro_logs/nslookup_houston_10.234.2.104.nandlal51.astro-cre.com.log
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
/tmp/astro_logs/astronomer-extraterrestrial-meteorite-6103/
/tmp/astro_logs/astronomer-extraterrestrial-meteorite-6103/webserverastronomer-extraterrestrial-meteorite-6103.log
/tmp/astro_logs/astronomer-extraterrestrial-meteorite-6103/triggerer astronomer-extraterrestrial-meteorite-6103.log
/tmp/astro_logs/astronomer-extraterrestrial-meteorite-6103/pods_astronomer-extraterrestrial-meteorite-6103.log
/tmp/astro_logs/astronomer-extraterrestrial-meteorite-6103/rs_status_all_namespaces.log
/tmp/astro_logs/astronomer-extraterrestrial-meteorite-6103/pvc_astronomer-extraterrestrial-meteorite-6103.log
/tmp/astro_logs/astronomer-extraterrestrial-meteorite-6103/events_astronomer-extraterrestrial-meteorite-6103.log
/tmp/astro_logs/astronomer-extraterrestrial-meteorite-6103/getall_status_astronomer-extraterrestrial-meteorite-6103.log
/tmp/astro_logs/astronomer-extraterrestrial-meteorite-6103/statsd_astronomer-extraterrestrial-meteorite-6103.log
/tmp/astro_logs/astronomer-extraterrestrial-meteorite-6103/secrets_astronomer-extraterrestrial-meteorite-6103.log
/tmp/astro_logs/astronomer-extraterrestrial-meteorite-6103/helm_values_extraterrestrial-meteorite-6103.yaml
/tmp/astro_logs/astronomer-extraterrestrial-meteorite-6103/pgbouncer _astronomer-extraterrestrial-meteorite-6103.log
/tmp/astro_logs/astronomer-extraterrestrial-meteorite-6103/svc_astronomer-extraterrestrial-meteorite-6103.log
/tmp/astro_logs/astronomer-extraterrestrial-meteorite-6103/helm_history_extraterrestrial-meteorite-6103.yaml
/tmp/astro_logs/astronomer-extraterrestrial-meteorite-6103/ingress_astronomer-extraterrestrial-meteorite-6103.log
/tmp/astro_logs/astronomer-extraterrestrial-meteorite-6103/cronjobs_astronomer-extraterrestrial-meteorite-6103.log
/tmp/astro_logs/astronomer-extraterrestrial-meteorite-6103/worker_astronomer-extraterrestrial-meteorite-6103.log
/tmp/astro_logs/astronomer-extraterrestrial-meteorite-6103/scheduler_astronomer-extraterrestrial-meteorite-6103.log
/tmp/astro_logs/astronomer-extraterrestrial-meteorite-6103/flower _astronomer-extraterrestrial-meteorite-6103.log
/tmp/astro_logs/astronomer-extraterrestrial-meteorite-6103/redis_astronomer-extraterrestrial-meteorite-6103.log
/tmp/astro_logs/curl_check_app.nandlal51.astro-cre.com.log
tar: /tmp/astro_logs: file changed as we read it
  adding: tmp/astro_logs/ (stored 0%)
  adding: tmp/astro_logs/curl_check_registry.nandlal51.astro-cre.com.log (deflated 94%)
  adding: tmp/astro_logs/nslookup_houston_10.234.1.9.nandlal51.astro-cre.com.log (deflated 63%)
  adding: tmp/astro_logs/astronomer-planetesimal-aphelion-2140/ (stored 0%)
  adding: tmp/astro_logs/astronomer-planetesimal-aphelion-2140/svc_astronomer-planetesimal-aphelion-2140.log (deflated 66%)
  adding: tmp/astro_logs/astronomer-planetesimal-aphelion-2140/pvc_astronomer-planetesimal-aphelion-2140.log (deflated 43%)
  adding: tmp/astro_logs/astronomer-planetesimal-aphelion-2140/getall_status_astronomer-planetesimal-aphelion-2140.log (deflated 80%)
  adding: tmp/astro_logs/astronomer-planetesimal-aphelion-2140/ingress_astronomer-planetesimal-aphelion-2140.log (deflated 69%)
  adding: tmp/astro_logs/astronomer-planetesimal-aphelion-2140/worker_astronomer-planetesimal-aphelion-2140.log (deflated 96%)
  adding: tmp/astro_logs/astronomer-planetesimal-aphelion-2140/events_astronomer-planetesimal-aphelion-2140.log (deflated 87%)
  adding: tmp/astro_logs/astronomer-planetesimal-aphelion-2140/planetesimal-aphelion-2140-pgbouncer-8596df4bbf-qnnxt-BAD_astronomer-planetesimal-aphelion-2140.log (deflated 67%)
  adding: tmp/astro_logs/astronomer-planetesimal-aphelion-2140/rs_status_all_namespaces.log (deflated 71%)
  adding: tmp/astro_logs/astronomer-planetesimal-aphelion-2140/pods_astronomer-planetesimal-aphelion-2140.log (deflated 77%)
  adding: tmp/astro_logs/astronomer-planetesimal-aphelion-2140/planetesimal-aphelion-2140-triggerer-59b6787fdf-49d5t-BAD_astronomer-planetesimal-aphelion-2140.log (deflated 75%)
  adding: tmp/astro_logs/astronomer-planetesimal-aphelion-2140/helm_history_planetesimal-aphelion-2140.yaml (deflated 24%)
  adding: tmp/astro_logs/astronomer-planetesimal-aphelion-2140/triggerer astronomer-planetesimal-aphelion-2140.log (deflated 71%)
  adding: tmp/astro_logs/astronomer-planetesimal-aphelion-2140/scheduler_astronomer-planetesimal-aphelion-2140.log (deflated 92%)
  adding: tmp/astro_logs/astronomer-planetesimal-aphelion-2140/redis_astronomer-planetesimal-aphelion-2140.log (deflated 88%)
  adding: tmp/astro_logs/astronomer-planetesimal-aphelion-2140/cronjobs_astronomer-planetesimal-aphelion-2140.log (deflated 62%)
  adding: tmp/astro_logs/astronomer-planetesimal-aphelion-2140/helm_values_planetesimal-aphelion-2140.yaml (deflated 79%)
  adding: tmp/astro_logs/astronomer-planetesimal-aphelion-2140/secrets_astronomer-planetesimal-aphelion-2140.log (deflated 84%)
  adding: tmp/astro_logs/astronomer-planetesimal-aphelion-2140/webserverastronomer-planetesimal-aphelion-2140.log (deflated 97%)
  adding: tmp/astro_logs/astronomer-planetesimal-aphelion-2140/pgbouncer _astronomer-planetesimal-aphelion-2140.log (deflated 87%)
  adding: tmp/astro_logs/astronomer-planetesimal-aphelion-2140/flower _astronomer-planetesimal-aphelion-2140.log (deflated 73%)
  adding: tmp/astro_logs/astronomer-planetesimal-aphelion-2140/statsd_astronomer-planetesimal-aphelion-2140.log (deflated 48%)
  adding: tmp/astro_logs/curl_check_install.nandlal51.astro-cre.com.log (deflated 94%)
  adding: tmp/astro_logs/astro_logs_2022-09-21.tar.gz (deflated 19%)
  adding: tmp/astro_logs/nslookup_houston_10.234.2.104.nandlal51.astro-cre.com.log (deflated 63%)
  adding: tmp/astro_logs/astronomer/ (stored 0%)
  adding: tmp/astro_logs/astronomer/DESCRIBE_ip-10-234-1-246.us-east-2.compute.internal.log (deflated 72%)
  adding: tmp/astro_logs/astronomer/DESCRIBE_ip-10-234-2-242.us-east-2.compute.internal.log (deflated 72%)
  adding: tmp/astro_logs/astronomer/houston-workerastronomer.log (deflated 88%)
  adding: tmp/astro_logs/astronomer/nodes.log (deflated 85%)
  adding: tmp/astro_logs/astronomer/nginx-default-backend_astronomer.log (deflated 97%)
  adding: tmp/astro_logs/astronomer/alertmanager_astronomer.log (deflated 61%)
  adding: tmp/astro_logs/astronomer/kube-state_astronomer.log (deflated 55%)
  adding: tmp/astro_logs/astronomer/secrets_astronomer.log (deflated 85%)
  adding: tmp/astro_logs/astronomer/DESCRIBE_ip-10-234-2-153.us-east-2.compute.internal.log (deflated 71%)
  adding: tmp/astro_logs/astronomer/nginx_astronomer.log (deflated 94%)
  adding: tmp/astro_logs/astronomer/svc_astronomer.log (deflated 85%)
  adding: tmp/astro_logs/astronomer/kibana_astronomer.log (deflated 98%)
  adding: tmp/astro_logs/astronomer/rs_status_all_namespaces.log (deflated 84%)
  adding: tmp/astro_logs/astronomer/ingress_astronomer.log (deflated 83%)
  adding: tmp/astro_logs/astronomer/DESCRIBE_ip-10-234-1-104.us-east-2.compute.internal.log (deflated 72%)
  adding: tmp/astro_logs/astronomer/stan_contatiner_astronomer.log (deflated 88%)
  adding: tmp/astro_logs/astronomer/DESCRIBE_ip-10-234-1-242.us-east-2.compute.internal.log (deflated 71%)
  adding: tmp/astro_logs/astronomer/cli-install_astronomer.log (deflated 97%)
  adding: tmp/astro_logs/astronomer/helm_history_astronomer.log (deflated 74%)
  adding: tmp/astro_logs/astronomer/cronjobs_astronomer.log (deflated 79%)
  adding: tmp/astro_logs/astronomer/helm_values_astronomer.yaml (deflated 44%)
  adding: tmp/astro_logs/astronomer/prometheus_container_astronomer.log (deflated 86%)
  adding: tmp/astro_logs/astronomer/DESCRIBE_ip-10-234-1-159.us-east-2.compute.internal.log (deflated 71%)
  adding: tmp/astro_logs/astronomer/elasticsearch-master_astronomer.log (deflated 88%)
  adding: tmp/astro_logs/astronomer/helm_status.log (deflated 65%)
  adding: tmp/astro_logs/astronomer/events_astronomer.log (deflated 76%)
  adding: tmp/astro_logs/astronomer/kube-system.log (deflated 86%)
  adding: tmp/astro_logs/astronomer/getall_status_astronomer.log (deflated 91%)
  adding: tmp/astro_logs/astronomer/elasticsearch-data_astronomer.log (deflated 87%)
  adding: tmp/astro_logs/astronomer/pvc_astronomer.log (deflated 70%)
  adding: tmp/astro_logs/astronomer/elasticsearch-clientastronomer.log (deflated 90%)
  adding: tmp/astro_logs/astronomer/registryastronomer.log (deflated 98%)
  adding: tmp/astro_logs/astronomer/commanderastronomer.log (deflated 91%)
  adding: tmp/astro_logs/astronomer/nats_astronomer.log (deflated 74%)
  adding: tmp/astro_logs/astronomer/houstonastronomer.log (deflated 94%)
  adding: tmp/astro_logs/astronomer/DESCRIBE_ip-10-234-1-239.us-east-2.compute.internal.log (deflated 71%)
  adding: tmp/astro_logs/astronomer/DESCRIBE_ip-10-234-2-22.us-east-2.compute.internal.log (deflated 73%)
  adding: tmp/astro_logs/astronomer/elasticsearch-nginx_astronomer.log (deflated 98%)
  adding: tmp/astro_logs/astronomer/DESCRIBE_ip-10-234-2-44.us-east-2.compute.internal.log (deflated 71%)
  adding: tmp/astro_logs/astronomer/astro-uiastronomer.log (deflated 98%)
  adding: tmp/astro_logs/astronomer/pods_astronomer.log (deflated 87%)
  adding: tmp/astro_logs/astronomer/Enviornment_Info.log (deflated 62%)
  adding: tmp/astro_logs/astronomer/grafana_astronomer.log (deflated 93%)
  adding: tmp/astro_logs/astronomer/DESCRIBE_ip-10-234-2-100.us-east-2.compute.internal.log (deflated 72%)
  adding: tmp/astro_logs/astronomer-extraterrestrial-meteorite-6103/ (stored 0%)
  adding: tmp/astro_logs/astronomer-extraterrestrial-meteorite-6103/webserverastronomer-extraterrestrial-meteorite-6103.log (deflated 97%)
  adding: tmp/astro_logs/astronomer-extraterrestrial-meteorite-6103/triggerer astronomer-extraterrestrial-meteorite-6103.log (deflated 72%)
  adding: tmp/astro_logs/astronomer-extraterrestrial-meteorite-6103/pods_astronomer-extraterrestrial-meteorite-6103.log (deflated 77%)
  adding: tmp/astro_logs/astronomer-extraterrestrial-meteorite-6103/rs_status_all_namespaces.log (deflated 70%)
  adding: tmp/astro_logs/astronomer-extraterrestrial-meteorite-6103/pvc_astronomer-extraterrestrial-meteorite-6103.log (deflated 43%)
  adding: tmp/astro_logs/astronomer-extraterrestrial-meteorite-6103/events_astronomer-extraterrestrial-meteorite-6103.log (deflated 87%)
  adding: tmp/astro_logs/astronomer-extraterrestrial-meteorite-6103/getall_status_astronomer-extraterrestrial-meteorite-6103.log (deflated 81%)
  adding: tmp/astro_logs/astronomer-extraterrestrial-meteorite-6103/statsd_astronomer-extraterrestrial-meteorite-6103.log (deflated 48%)
  adding: tmp/astro_logs/astronomer-extraterrestrial-meteorite-6103/secrets_astronomer-extraterrestrial-meteorite-6103.log (deflated 84%)
  adding: tmp/astro_logs/astronomer-extraterrestrial-meteorite-6103/helm_values_extraterrestrial-meteorite-6103.yaml (deflated 79%)
  adding: tmp/astro_logs/astronomer-extraterrestrial-meteorite-6103/pgbouncer _astronomer-extraterrestrial-meteorite-6103.log (deflated 87%)
  adding: tmp/astro_logs/astronomer-extraterrestrial-meteorite-6103/svc_astronomer-extraterrestrial-meteorite-6103.log (deflated 67%)
  adding: tmp/astro_logs/astronomer-extraterrestrial-meteorite-6103/helm_history_extraterrestrial-meteorite-6103.yaml (deflated 24%)
  adding: tmp/astro_logs/astronomer-extraterrestrial-meteorite-6103/ingress_astronomer-extraterrestrial-meteorite-6103.log (deflated 70%)
  adding: tmp/astro_logs/astronomer-extraterrestrial-meteorite-6103/cronjobs_astronomer-extraterrestrial-meteorite-6103.log (deflated 63%)
  adding: tmp/astro_logs/astronomer-extraterrestrial-meteorite-6103/worker_astronomer-extraterrestrial-meteorite-6103.log (deflated 96%)
  adding: tmp/astro_logs/astronomer-extraterrestrial-meteorite-6103/scheduler_astronomer-extraterrestrial-meteorite-6103.log (deflated 92%)
  adding: tmp/astro_logs/astronomer-extraterrestrial-meteorite-6103/flower _astronomer-extraterrestrial-meteorite-6103.log (deflated 72%)
  adding: tmp/astro_logs/astronomer-extraterrestrial-meteorite-6103/redis_astronomer-extraterrestrial-meteorite-6103.log (deflated 88%)
  adding: tmp/astro_logs/curl_check_app.nandlal51.astro-cre.com.log (deflated 94%)
Here is the list of files created:
-rw-r--r-- 1 root root  721 Sep 21 23:35 /tmp/astro_logs/nslookup_houston_10.234.1.9.nandlal51.astro-cre.com.log
-rw-r--r-- 1 root root  723 Sep 21 23:35 /tmp/astro_logs/nslookup_houston_10.234.2.104.nandlal51.astro-cre.com.log
-rw-r--r-- 1 root root  12K Sep 21 23:35 /tmp/astro_logs/curl_check_registry.nandlal51.astro-cre.com.log
-rw-r--r-- 1 root root  13K Sep 21 23:35 /tmp/astro_logs/curl_check_app.nandlal51.astro-cre.com.log
-rw-r--r-- 1 root root  13K Sep 21 23:35 /tmp/astro_logs/curl_check_install.nandlal51.astro-cre.com.log
-rw-r--r-- 1 root root 1.5M Sep 21 23:35 /tmp/astro_logs/astro_logs_2022-09-21.tar.gz
-rw-r--r-- 1 root root 2.6M Sep 21 23:35 /tmp/astro_logs/astro_logs_2022-09-21.zip

/tmp/astro_logs/astronomer:
total 24M
-rw-r--r-- 1 root root 6.0K Sep 21 23:30 DESCRIBE_ip-10-234-1-104.us-east-2.compute.internal.log
-rw-r--r-- 1 root root 5.6K Sep 21 23:31 DESCRIBE_ip-10-234-1-159.us-east-2.compute.internal.log
-rw-r--r-- 1 root root 5.8K Sep 21 23:31 DESCRIBE_ip-10-234-1-239.us-east-2.compute.internal.log
-rw-r--r-- 1 root root 5.3K Sep 21 23:31 DESCRIBE_ip-10-234-1-242.us-east-2.compute.internal.log
-rw-r--r-- 1 root root 5.6K Sep 21 23:31 DESCRIBE_ip-10-234-1-246.us-east-2.compute.internal.log
-rw-r--r-- 1 root root 5.7K Sep 21 23:31 DESCRIBE_ip-10-234-2-100.us-east-2.compute.internal.log
-rw-r--r-- 1 root root 5.2K Sep 21 23:31 DESCRIBE_ip-10-234-2-153.us-east-2.compute.internal.log
-rw-r--r-- 1 root root 6.6K Sep 21 23:31 DESCRIBE_ip-10-234-2-22.us-east-2.compute.internal.log
-rw-r--r-- 1 root root 6.3K Sep 21 23:31 DESCRIBE_ip-10-234-2-242.us-east-2.compute.internal.log
-rw-r--r-- 1 root root 5.2K Sep 21 23:31 DESCRIBE_ip-10-234-2-44.us-east-2.compute.internal.log
-rw-r--r-- 1 root root 3.7M Sep 21 23:31 houstonastronomer.log
-rw-r--r-- 1 root root  20K Sep 21 23:31 houston-workerastronomer.log
-rw-r--r-- 1 root root 2.7M Sep 21 23:31 astro-uiastronomer.log
-rw-r--r-- 1 root root 2.5M Sep 21 23:31 commanderastronomer.log
-rw-r--r-- 1 root root 1.6M Sep 21 23:31 nginx_astronomer.log
-rw-r--r-- 1 root root 1.7K Sep 21 23:31 kube-state_astronomer.log
-rw-r--r-- 1 root root 3.0M Sep 21 23:32 kibana_astronomer.log
-rw-r--r-- 1 root root 1.4M Sep 21 23:32 nginx-default-backend_astronomer.log
-rw-r--r-- 1 root root  63K Sep 21 23:32 grafana_astronomer.log
-rw-r--r-- 1 root root 4.3M Sep 21 23:32 elasticsearch-nginx_astronomer.log
-rw-r--r-- 1 root root 1.4M Sep 21 23:32 cli-install_astronomer.log
-rw-r--r-- 1 root root  63K Sep 21 23:32 elasticsearch-clientastronomer.log
-rw-r--r-- 1 root root  36K Sep 21 23:32 elasticsearch-master_astronomer.log
-rw-r--r-- 1 root root  35K Sep 21 23:32 elasticsearch-data_astronomer.log
-rw-r--r-- 1 root root 171K Sep 21 23:32 stan_contatiner_astronomer.log
-rw-r--r-- 1 root root 2.5M Sep 21 23:32 registryastronomer.log
-rw-r--r-- 1 root root  35K Sep 21 23:32 prometheus_container_astronomer.log
-rw-r--r-- 1 root root 3.2K Sep 21 23:32 nats_astronomer.log
-rw-r--r-- 1 root root 1.4K Sep 21 23:32 alertmanager_astronomer.log
-rw-r--r-- 1 root root  50K Sep 21 23:32 getall_status_astronomer.log
-rw-r--r-- 1 root root 4.4K Sep 21 23:32 rs_status_all_namespaces.log
-rw-r--r-- 1 root root  11K Sep 21 23:32 pods_astronomer.log
-rw-r--r-- 1 root root 1.6K Sep 21 23:32 events_astronomer.log
-rw-r--r-- 1 root root 2.9K Sep 21 23:32 secrets_astronomer.log
-rw-r--r-- 1 root root 2.1K Sep 21 23:32 nodes.log
-rw-r--r-- 1 root root 3.3K Sep 21 23:32 kube-system.log
-rw-r--r-- 1 root root 4.4K Sep 21 23:33 svc_astronomer.log
-rw-r--r-- 1 root root 1.7K Sep 21 23:33 pvc_astronomer.log
-rw-r--r-- 1 root root 1.6K Sep 21 23:33 ingress_astronomer.log
-rw-r--r-- 1 root root 1.7K Sep 21 23:33 cronjobs_astronomer.log
-rw-r--r-- 1 root root 1.4K Sep 21 23:33 Enviornment_Info.log
-rw-r--r-- 1 root root  880 Sep 21 23:33 helm_status.log
-rw-r--r-- 1 root root 1012 Sep 21 23:33 helm_history_astronomer.log
-rw-r--r-- 1 root root  579 Sep 21 23:33 helm_values_astronomer.yaml

/tmp/astro_logs/astronomer-extraterrestrial-meteorite-6103:
total 4.3M
-rw-r--r-- 1 root root 4.2K Sep 21 23:33  getall_status_astronomer-extraterrestrial-meteorite-6103.log
-rw-r--r-- 1 root root  696 Sep 21 23:33  rs_status_all_namespaces.log
-rw-r--r-- 1 root root 2.0K Sep 21 23:33  pods_astronomer-extraterrestrial-meteorite-6103.log
-rw-r--r-- 1 root root 6.7K Sep 21 23:33  events_astronomer-extraterrestrial-meteorite-6103.log
-rw-r--r-- 1 root root 2.7K Sep 21 23:33  secrets_astronomer-extraterrestrial-meteorite-6103.log
-rw-r--r-- 1 root root  777 Sep 21 23:33  svc_astronomer-extraterrestrial-meteorite-6103.log
-rw-r--r-- 1 root root  296 Sep 21 23:33  pvc_astronomer-extraterrestrial-meteorite-6103.log
-rw-r--r-- 1 root root  744 Sep 21 23:33  ingress_astronomer-extraterrestrial-meteorite-6103.log
-rw-r--r-- 1 root root  320 Sep 21 23:33  cronjobs_astronomer-extraterrestrial-meteorite-6103.log
-rw-r--r-- 1 root root 809K Sep 21 23:33  scheduler_astronomer-extraterrestrial-meteorite-6103.log
-rw-r--r-- 1 root root 2.2M Sep 21 23:33  worker_astronomer-extraterrestrial-meteorite-6103.log
-rw-r--r-- 1 root root 877K Sep 21 23:33  webserverastronomer-extraterrestrial-meteorite-6103.log
-rw-r--r-- 1 root root 2.9K Sep 21 23:33 'triggerer astronomer-extraterrestrial-meteorite-6103.log'
-rw-r--r-- 1 root root 313K Sep 21 23:34 'pgbouncer _astronomer-extraterrestrial-meteorite-6103.log'
-rw-r--r-- 1 root root 3.1K Sep 21 23:34 'flower _astronomer-extraterrestrial-meteorite-6103.log'
-rw-r--r-- 1 root root  568 Sep 21 23:34  statsd_astronomer-extraterrestrial-meteorite-6103.log
-rw-r--r-- 1 root root  21K Sep 21 23:34  redis_astronomer-extraterrestrial-meteorite-6103.log
-rw-r--r-- 1 root root  172 Sep 21 23:34  helm_history_extraterrestrial-meteorite-6103.yaml
-rw-r--r-- 1 root root  19K Sep 21 23:34  helm_values_extraterrestrial-meteorite-6103.yaml

/tmp/astro_logs/astronomer-planetesimal-aphelion-2140:
total 3.9M
-rw-r--r-- 1 root root 5.6K Sep 21 23:30  planetesimal-aphelion-2140-pgbouncer-8596df4bbf-qnnxt-BAD_astronomer-planetesimal-aphelion-2140.log
-rw-r--r-- 1 root root  10K Sep 21 23:30  planetesimal-aphelion-2140-triggerer-59b6787fdf-49d5t-BAD_astronomer-planetesimal-aphelion-2140.log
-rw-r--r-- 1 root root 4.6K Sep 21 23:34  getall_status_astronomer-planetesimal-aphelion-2140.log
-rw-r--r-- 1 root root  820 Sep 21 23:34  rs_status_all_namespaces.log
-rw-r--r-- 1 root root 2.5K Sep 21 23:34  pods_astronomer-planetesimal-aphelion-2140.log
-rw-r--r-- 1 root root  10K Sep 21 23:34  events_astronomer-planetesimal-aphelion-2140.log
-rw-r--r-- 1 root root 2.7K Sep 21 23:34  secrets_astronomer-planetesimal-aphelion-2140.log
-rw-r--r-- 1 root root  742 Sep 21 23:34  svc_astronomer-planetesimal-aphelion-2140.log
-rw-r--r-- 1 root root  286 Sep 21 23:34  pvc_astronomer-planetesimal-aphelion-2140.log
-rw-r--r-- 1 root root  714 Sep 21 23:34  ingress_astronomer-planetesimal-aphelion-2140.log
-rw-r--r-- 1 root root  300 Sep 21 23:34  cronjobs_astronomer-planetesimal-aphelion-2140.log
-rw-r--r-- 1 root root 774K Sep 21 23:34  scheduler_astronomer-planetesimal-aphelion-2140.log
-rw-r--r-- 1 root root 2.1M Sep 21 23:34  worker_astronomer-planetesimal-aphelion-2140.log
-rw-r--r-- 1 root root 582K Sep 21 23:34  webserverastronomer-planetesimal-aphelion-2140.log
-rw-r--r-- 1 root root 2.6K Sep 21 23:34 'triggerer astronomer-planetesimal-aphelion-2140.log'
-rw-r--r-- 1 root root 311K Sep 21 23:34 'pgbouncer _astronomer-planetesimal-aphelion-2140.log'
-rw-r--r-- 1 root root 3.1K Sep 21 23:35 'flower _astronomer-planetesimal-aphelion-2140.log'
-rw-r--r-- 1 root root  568 Sep 21 23:35  statsd_astronomer-planetesimal-aphelion-2140.log
-rw-r--r-- 1 root root  20K Sep 21 23:35  redis_astronomer-planetesimal-aphelion-2140.log
-rw-r--r-- 1 root root  172 Sep 21 23:35  helm_history_planetesimal-aphelion-2140.yaml
-rw-r--r-- 1 root root  19K Sep 21 23:35  helm_values_planetesimal-aphelion-2140.yaml
/tmp/astro_logs/astronomer:
total 24M
-rw-r--r-- 1 root root 6.0K Sep 21 23:30 DESCRIBE_ip-10-234-1-104.us-east-2.compute.internal.log
-rw-r--r-- 1 root root 5.6K Sep 21 23:31 DESCRIBE_ip-10-234-1-159.us-east-2.compute.internal.log
-rw-r--r-- 1 root root 5.8K Sep 21 23:31 DESCRIBE_ip-10-234-1-239.us-east-2.compute.internal.log
-rw-r--r-- 1 root root 5.3K Sep 21 23:31 DESCRIBE_ip-10-234-1-242.us-east-2.compute.internal.log
-rw-r--r-- 1 root root 5.6K Sep 21 23:31 DESCRIBE_ip-10-234-1-246.us-east-2.compute.internal.log
-rw-r--r-- 1 root root 5.7K Sep 21 23:31 DESCRIBE_ip-10-234-2-100.us-east-2.compute.internal.log
-rw-r--r-- 1 root root 5.2K Sep 21 23:31 DESCRIBE_ip-10-234-2-153.us-east-2.compute.internal.log
-rw-r--r-- 1 root root 6.6K Sep 21 23:31 DESCRIBE_ip-10-234-2-22.us-east-2.compute.internal.log
-rw-r--r-- 1 root root 6.3K Sep 21 23:31 DESCRIBE_ip-10-234-2-242.us-east-2.compute.internal.log
-rw-r--r-- 1 root root 5.2K Sep 21 23:31 DESCRIBE_ip-10-234-2-44.us-east-2.compute.internal.log
-rw-r--r-- 1 root root 3.7M Sep 21 23:31 houstonastronomer.log
-rw-r--r-- 1 root root  20K Sep 21 23:31 houston-workerastronomer.log
-rw-r--r-- 1 root root 2.7M Sep 21 23:31 astro-uiastronomer.log
-rw-r--r-- 1 root root 2.5M Sep 21 23:31 commanderastronomer.log
-rw-r--r-- 1 root root 1.6M Sep 21 23:31 nginx_astronomer.log
-rw-r--r-- 1 root root 1.7K Sep 21 23:31 kube-state_astronomer.log
-rw-r--r-- 1 root root 3.0M Sep 21 23:32 kibana_astronomer.log
-rw-r--r-- 1 root root 1.4M Sep 21 23:32 nginx-default-backend_astronomer.log
-rw-r--r-- 1 root root  63K Sep 21 23:32 grafana_astronomer.log
-rw-r--r-- 1 root root 4.3M Sep 21 23:32 elasticsearch-nginx_astronomer.log
-rw-r--r-- 1 root root 1.4M Sep 21 23:32 cli-install_astronomer.log
-rw-r--r-- 1 root root  63K Sep 21 23:32 elasticsearch-clientastronomer.log
-rw-r--r-- 1 root root  36K Sep 21 23:32 elasticsearch-master_astronomer.log
-rw-r--r-- 1 root root  35K Sep 21 23:32 elasticsearch-data_astronomer.log
-rw-r--r-- 1 root root 171K Sep 21 23:32 stan_contatiner_astronomer.log
-rw-r--r-- 1 root root 2.5M Sep 21 23:32 registryastronomer.log
-rw-r--r-- 1 root root  35K Sep 21 23:32 prometheus_container_astronomer.log
-rw-r--r-- 1 root root 3.2K Sep 21 23:32 nats_astronomer.log
-rw-r--r-- 1 root root 1.4K Sep 21 23:32 alertmanager_astronomer.log
-rw-r--r-- 1 root root  50K Sep 21 23:32 getall_status_astronomer.log
-rw-r--r-- 1 root root 4.4K Sep 21 23:32 rs_status_all_namespaces.log
-rw-r--r-- 1 root root  11K Sep 21 23:32 pods_astronomer.log
-rw-r--r-- 1 root root 1.6K Sep 21 23:32 events_astronomer.log
-rw-r--r-- 1 root root 2.9K Sep 21 23:32 secrets_astronomer.log
-rw-r--r-- 1 root root 2.1K Sep 21 23:32 nodes.log
-rw-r--r-- 1 root root 3.3K Sep 21 23:32 kube-system.log
-rw-r--r-- 1 root root 4.4K Sep 21 23:33 svc_astronomer.log
-rw-r--r-- 1 root root 1.7K Sep 21 23:33 pvc_astronomer.log
-rw-r--r-- 1 root root 1.6K Sep 21 23:33 ingress_astronomer.log
-rw-r--r-- 1 root root 1.7K Sep 21 23:33 cronjobs_astronomer.log
-rw-r--r-- 1 root root 1.4K Sep 21 23:33 Enviornment_Info.log
-rw-r--r-- 1 root root  880 Sep 21 23:33 helm_status.log
-rw-r--r-- 1 root root 1012 Sep 21 23:33 helm_history_astronomer.log
-rw-r--r-- 1 root root  579 Sep 21 23:33 helm_values_astronomer.yaml

/tmp/astro_logs/astronomer-extraterrestrial-meteorite-6103:
total 4.3M
-rw-r--r-- 1 root root 4.2K Sep 21 23:33  getall_status_astronomer-extraterrestrial-meteorite-6103.log
-rw-r--r-- 1 root root  696 Sep 21 23:33  rs_status_all_namespaces.log
-rw-r--r-- 1 root root 2.0K Sep 21 23:33  pods_astronomer-extraterrestrial-meteorite-6103.log
-rw-r--r-- 1 root root 6.7K Sep 21 23:33  events_astronomer-extraterrestrial-meteorite-6103.log
-rw-r--r-- 1 root root 2.7K Sep 21 23:33  secrets_astronomer-extraterrestrial-meteorite-6103.log
-rw-r--r-- 1 root root  777 Sep 21 23:33  svc_astronomer-extraterrestrial-meteorite-6103.log
-rw-r--r-- 1 root root  296 Sep 21 23:33  pvc_astronomer-extraterrestrial-meteorite-6103.log
-rw-r--r-- 1 root root  744 Sep 21 23:33  ingress_astronomer-extraterrestrial-meteorite-6103.log
-rw-r--r-- 1 root root  320 Sep 21 23:33  cronjobs_astronomer-extraterrestrial-meteorite-6103.log
-rw-r--r-- 1 root root 809K Sep 21 23:33  scheduler_astronomer-extraterrestrial-meteorite-6103.log
-rw-r--r-- 1 root root 2.2M Sep 21 23:33  worker_astronomer-extraterrestrial-meteorite-6103.log
-rw-r--r-- 1 root root 877K Sep 21 23:33  webserverastronomer-extraterrestrial-meteorite-6103.log
-rw-r--r-- 1 root root 2.9K Sep 21 23:33 'triggerer astronomer-extraterrestrial-meteorite-6103.log'
-rw-r--r-- 1 root root 313K Sep 21 23:34 'pgbouncer _astronomer-extraterrestrial-meteorite-6103.log'
-rw-r--r-- 1 root root 3.1K Sep 21 23:34 'flower _astronomer-extraterrestrial-meteorite-6103.log'
-rw-r--r-- 1 root root  568 Sep 21 23:34  statsd_astronomer-extraterrestrial-meteorite-6103.log
-rw-r--r-- 1 root root  21K Sep 21 23:34  redis_astronomer-extraterrestrial-meteorite-6103.log
-rw-r--r-- 1 root root  172 Sep 21 23:34  helm_history_extraterrestrial-meteorite-6103.yaml
-rw-r--r-- 1 root root  19K Sep 21 23:34  helm_values_extraterrestrial-meteorite-6103.yaml

/tmp/astro_logs/astronomer-planetesimal-aphelion-2140:
total 3.9M
-rw-r--r-- 1 root root 5.6K Sep 21 23:30  planetesimal-aphelion-2140-pgbouncer-8596df4bbf-qnnxt-BAD_astronomer-planetesimal-aphelion-2140.log
-rw-r--r-- 1 root root  10K Sep 21 23:30  planetesimal-aphelion-2140-triggerer-59b6787fdf-49d5t-BAD_astronomer-planetesimal-aphelion-2140.log
-rw-r--r-- 1 root root 4.6K Sep 21 23:34  getall_status_astronomer-planetesimal-aphelion-2140.log
-rw-r--r-- 1 root root  820 Sep 21 23:34  rs_status_all_namespaces.log
-rw-r--r-- 1 root root 2.5K Sep 21 23:34  pods_astronomer-planetesimal-aphelion-2140.log
-rw-r--r-- 1 root root  10K Sep 21 23:34  events_astronomer-planetesimal-aphelion-2140.log
-rw-r--r-- 1 root root 2.7K Sep 21 23:34  secrets_astronomer-planetesimal-aphelion-2140.log
-rw-r--r-- 1 root root  742 Sep 21 23:34  svc_astronomer-planetesimal-aphelion-2140.log
-rw-r--r-- 1 root root  286 Sep 21 23:34  pvc_astronomer-planetesimal-aphelion-2140.log
-rw-r--r-- 1 root root  714 Sep 21 23:34  ingress_astronomer-planetesimal-aphelion-2140.log
-rw-r--r-- 1 root root  300 Sep 21 23:34  cronjobs_astronomer-planetesimal-aphelion-2140.log
-rw-r--r-- 1 root root 774K Sep 21 23:34  scheduler_astronomer-planetesimal-aphelion-2140.log
-rw-r--r-- 1 root root 2.1M Sep 21 23:34  worker_astronomer-planetesimal-aphelion-2140.log
-rw-r--r-- 1 root root 582K Sep 21 23:34  webserverastronomer-planetesimal-aphelion-2140.log
-rw-r--r-- 1 root root 2.6K Sep 21 23:34 'triggerer astronomer-planetesimal-aphelion-2140.log'
-rw-r--r-- 1 root root 311K Sep 21 23:34 'pgbouncer _astronomer-planetesimal-aphelion-2140.log'
-rw-r--r-- 1 root root 3.1K Sep 21 23:35 'flower _astronomer-planetesimal-aphelion-2140.log'
-rw-r--r-- 1 root root  568 Sep 21 23:35  statsd_astronomer-planetesimal-aphelion-2140.log
-rw-r--r-- 1 root root  20K Sep 21 23:35  redis_astronomer-planetesimal-aphelion-2140.log
-rw-r--r-- 1 root root  172 Sep 21 23:35  helm_history_planetesimal-aphelion-2140.yaml
-rw-r--r-- 1 root root  19K Sep 21 23:35  helm_values_planetesimal-aphelion-2140.yaml
total 4.0K
drwxrwxrwx 5 root root 4.0K Sep 21 23:35 astro_logs
Please attach the zip file or .gz file created in /tmp to the zendesk ticket for reference.
~~~
