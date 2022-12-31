
****gen2_ns_gather_logs Script****
====================================

•This script will focus specifically to the selected namespace and additionally get any bad pods output in other namespaces as well.
•Also, it will describe the output of all the nodes & the status of current namespace pods.so you will find most of the logs in the folder named with current namespace.
•On Astro, we would ideally use teleport commands to **switch to the required namespace** before running the script

an e.g.

~~~
tsh login --proxy=tele.astronomer.cloud:443
export KUBECONFIG=${HOME?}/teleport-kubeconfig.yaml
tsh kube login cl772p4rz00s30tyohxi3938b
kubectl config set-context --current --namespace=modern-bolometer-8039  (---> This is important for the script to work)
kubectl get pods
~~~

By default its **exporting the logs in /tmp**.

~~~
sh gen2_ns_gather_logs.sh > /dev/stdin > /tmp/scriptlog_$(date +"%Y_%m_%d_%I_%M_%p").log

~~~

***Usage***: 
•Just run the shell script as below and you will get the required log files.
•You can also keep it as an alias by adding an entry ``alias gen2logs='sh /root/gen2_ns_gather_logs.sh > /dev/stdin > /tmp/scriptlog_$(date +"%Y_%m_%d_%I_%M_%p").log'`` in your ```.bashrc```

![image](https://user-images.githubusercontent.com/33649510/209365801-e1d40679-8944-473c-9ba1-83b414c4adc3.png)



Expected output:

![image](https://user-images.githubusercontent.com/33649510/209279423-d78a1324-651d-4c6b-aabe-65cfa2ccb037.png)

![image](https://user-images.githubusercontent.com/33649510/209279572-58c97ffb-c542-4cdd-973d-56e18fee9d38.png)





Here is the expected Script Output:


```
[root@DESKTOP-JJ9MM59 Gather logs]# sh gen2_ns_gather_logs.sh

====> Here is the list of Namespaces found:
NAME                          STATUS   AGE
airflow-operator-system       Active   121d
calico-system                 Active   70d
cert-manager                  Active   121d
default                       Active   121d
external-db-operator-system   Active   121d
falco                         Active   121d
istio-operator                Active   121d
istio-system                  Active   121d
keda                          Active   121d
kube-node-lease               Active   121d
kube-public                   Active   121d
kube-system                   Active   121d
mani-ork                      Active   121d
modern-bolometer-8039         Active   120d
monitoring                    Active   121d
splunk-logging                Active   121d
teleport-agent                Active   121d
tigera-operator               Active   70d
yace                          Active   121d
====> You have specied modern-bolometer-8039 as a namespace where all the core Astronomer platform pods are running.Please make sure it's correctly specified.
====> The path where logs would be stored is /tmp/ASTRO_2022_12_23.
====> cleaning any older /tmp/ASTRO_2022_12_23 directory to avoid script failure
====> Creating log file directory /tmp/ASTRO_2022_12_23.
creating namespace airflow-operator-system
creating namespace calico-system
creating namespace cert-manager
creating namespace default
creating namespace external-db-operator-system
creating namespace falco
creating namespace istio-operator
creating namespace istio-system
creating namespace keda
creating namespace kube-node-lease
creating namespace kube-public
creating namespace kube-system
creating namespace mani-ork
creating namespace modern-bolometer-8039
creating namespace monitoring
creating namespace splunk-logging
creating namespace teleport-agent
creating namespace tigera-operator
creating namespace yace
======================Collecting Some General enviornment Information in the modern-bolometer-8039======================
creating modern-bolometer-8039/Nodes Directory 
Gathering get all status  in modern-bolometer-8039 Namespace
Gathering All replica status in all namespaces
Gathering Pod Running status in modern-bolometer-8039 Namespace
Gathering events in modern-bolometer-8039 Namespace 
Gathering events in modern-bolometer-8039 Namespace 
Gathering events in modern-bolometer-8039 Namespace 
Gathering sevice Status in modern-bolometer-8039 Namespace 
Gathering persistent volume Status in modern-bolometer-8039 Namespace 
Gathering ingress Status in modern-bolometer-8039 Namespace 
Gathering jobs Status in modern-bolometer-8039 Namespace 
======================Gathering All the Deployment namespace logs in the modern-bolometer-8039======================
Gathering logs of scheduler in modern-bolometer-8039 Namespace 
Gathering logs of worker in modern-bolometer-8039 Namespace 
Gathering logs of webserverin modern-bolometer-8039 Namespace 
Gathering logs of triggerer in modern-bolometer-8039 Namespace 
Gathering logs of statsd in modern-bolometer-8039 Namespace 
Gathering logs of redis in modern-bolometer-8039 Namespace 
======================Gathering Describe output pods in modern-bolometer-8039======================
Collecting Describe output of pod modern-bolometer-8039-pgbouncer-749fc9746d-l6djg in modern-bolometer-8039 Namespace 
Collecting Describe output of pod modern-bolometer-8039-pgbouncer-749fc9746d-s77hg in modern-bolometer-8039 Namespace 
Collecting Describe output of pod modern-bolometer-8039-redis-0 in modern-bolometer-8039 Namespace 
Collecting Describe output of pod modern-bolometer-8039-scheduler-67bf78f8f4-8n9zq in modern-bolometer-8039 Namespace 
Collecting Describe output of pod modern-bolometer-8039-scheduler-67bf78f8f4-nkzj9 in modern-bolometer-8039 Namespace 
Collecting Describe output of pod modern-bolometer-8039-statsd-97d8748b-tjqhv in modern-bolometer-8039 Namespace 
Collecting Describe output of pod modern-bolometer-8039-triggerer-55668cccd6-2l8xx in modern-bolometer-8039 Namespace 
Collecting Describe output of pod modern-bolometer-8039-webserver-bb4c7569f-5m5dx in modern-bolometer-8039 Namespace 
Collecting Describe output of pod modern-bolometer-8039-worker-default-5578bf8f97-hzm26 in modern-bolometer-8039 Namespace 
======================Gathering Describe output of Bad state pod======================
======================Gathering log output of Bad state pod======================
======================Gathering Describe output of all the nodes======================
Collecting Describe output of Node ip-172-60-11-204.ec2.internal 
Collecting Describe output of Node ip-172-60-12-142.ec2.internal 
Collecting Describe output of Node ip-172-60-12-98.ec2.internal 
Collecting Describe output of Node ip-172-60-16-37.ec2.internal 
Collecting Describe output of Node ip-172-60-27-118.ec2.internal 
Collecting Describe output of Node ip-172-60-28-93.ec2.internal 
======================creating GZ and zip files======================
/tmp/ASTRO_2022_12_23/
/tmp/ASTRO_2022_12_23/calico-system/
/tmp/ASTRO_2022_12_23/tigera-operator/
/tmp/ASTRO_2022_12_23/keda/
/tmp/ASTRO_2022_12_23/airflow-operator-system/
/tmp/ASTRO_2022_12_23/splunk-logging/
/tmp/ASTRO_2022_12_23/kube-node-lease/
/tmp/ASTRO_2022_12_23/istio-system/
/tmp/ASTRO_2022_12_23/monitoring/
/tmp/ASTRO_2022_12_23/cert-manager/
/tmp/ASTRO_2022_12_23/mani-ork/
/tmp/ASTRO_2022_12_23/modern-bolometer-8039/
/tmp/ASTRO_2022_12_23/modern-bolometer-8039/Describe_modern-bolometer-8039-triggerer-55668cccd6-2l8xx-Pod_modern-bolometer-8039.log
/tmp/ASTRO_2022_12_23/modern-bolometer-8039/Dep_statsd_modern-bolometer-8039.log
/tmp/ASTRO_2022_12_23/modern-bolometer-8039/Dep_redis_modern-bolometer-8039.log
/tmp/ASTRO_2022_12_23/modern-bolometer-8039/getall_status_modern-bolometer-8039.log
/tmp/ASTRO_2022_12_23/modern-bolometer-8039/ingress_modern-bolometer-8039.log
/tmp/ASTRO_2022_12_23/modern-bolometer-8039/jobs_NS.log
/tmp/ASTRO_2022_12_23/modern-bolometer-8039/rs_status_all_namespaces.log
/tmp/ASTRO_2022_12_23/modern-bolometer-8039/events_modern-bolometer-8039.log
/tmp/ASTRO_2022_12_23/modern-bolometer-8039/Describe_modern-bolometer-8039-redis-0-Pod_modern-bolometer-8039.log
/tmp/ASTRO_2022_12_23/modern-bolometer-8039/Describe_modern-bolometer-8039-statsd-97d8748b-tjqhv-Pod_modern-bolometer-8039.log
/tmp/ASTRO_2022_12_23/modern-bolometer-8039/pods_modern-bolometer-8039.log
/tmp/ASTRO_2022_12_23/modern-bolometer-8039/Describe_modern-bolometer-8039-webserver-bb4c7569f-5m5dx-Pod_modern-bolometer-8039.log
/tmp/ASTRO_2022_12_23/modern-bolometer-8039/svc_modern-bolometer-8039.log
/tmp/ASTRO_2022_12_23/modern-bolometer-8039/Describe_modern-bolometer-8039-pgbouncer-749fc9746d-s77hg-Pod_modern-bolometer-8039.log
/tmp/ASTRO_2022_12_23/modern-bolometer-8039/pvc_modern-bolometer-8039.log
/tmp/ASTRO_2022_12_23/modern-bolometer-8039/Describe_modern-bolometer-8039-pgbouncer-749fc9746d-l6djg-Pod_modern-bolometer-8039.log
/tmp/ASTRO_2022_12_23/modern-bolometer-8039/Describe_modern-bolometer-8039-worker-default-5578bf8f97-hzm26-Pod_modern-bolometer-8039.log
/tmp/ASTRO_2022_12_23/modern-bolometer-8039/Dep_pgbouncer _modern-bolometer-8039.log
/tmp/ASTRO_2022_12_23/modern-bolometer-8039/Dep_worker_modern-bolometer-8039.log
/tmp/ASTRO_2022_12_23/modern-bolometer-8039/events_sortedbyTimestamp_modern-bolometer-8039.log
/tmp/ASTRO_2022_12_23/modern-bolometer-8039/Describe_modern-bolometer-8039-scheduler-67bf78f8f4-8n9zq-Pod_modern-bolometer-8039.log
/tmp/ASTRO_2022_12_23/modern-bolometer-8039/Dep_scheduler_modern-bolometer-8039.log
/tmp/ASTRO_2022_12_23/modern-bolometer-8039/Dep_triggerer modern-bolometer-8039.log
/tmp/ASTRO_2022_12_23/modern-bolometer-8039/Describe_modern-bolometer-8039-scheduler-67bf78f8f4-nkzj9-Pod_modern-bolometer-8039.log
/tmp/ASTRO_2022_12_23/modern-bolometer-8039/Nodes/
/tmp/ASTRO_2022_12_23/modern-bolometer-8039/Nodes/DESCRIBE_ip-172-60-11-204.ec2.internal.log
/tmp/ASTRO_2022_12_23/modern-bolometer-8039/Nodes/DESCRIBE_ip-172-60-28-93.ec2.internal.log
/tmp/ASTRO_2022_12_23/modern-bolometer-8039/Nodes/DESCRIBE_ip-172-60-12-98.ec2.internal.log
/tmp/ASTRO_2022_12_23/modern-bolometer-8039/Nodes/DESCRIBE_ip-172-60-16-37.ec2.internal.log
/tmp/ASTRO_2022_12_23/modern-bolometer-8039/Nodes/DESCRIBE_ip-172-60-12-142.ec2.internal.log
/tmp/ASTRO_2022_12_23/modern-bolometer-8039/Nodes/DESCRIBE_ip-172-60-27-118.ec2.internal.log
/tmp/ASTRO_2022_12_23/modern-bolometer-8039/Nodes/NODE_POOL_modern-bolometer-8039.log
/tmp/ASTRO_2022_12_23/modern-bolometer-8039/Dep_webservermodern-bolometer-8039.log
/tmp/ASTRO_2022_12_23/yace/
/tmp/ASTRO_2022_12_23/falco/
/tmp/ASTRO_2022_12_23/kube-system/
/tmp/ASTRO_2022_12_23/default/
/tmp/ASTRO_2022_12_23/istio-operator/
/tmp/ASTRO_2022_12_23/external-db-operator-system/
/tmp/ASTRO_2022_12_23/kube-public/
/tmp/ASTRO_2022_12_23/teleport-agent/
  adding: tmp/ASTRO_2022_12_23/ (stored 0%)
  adding: tmp/ASTRO_2022_12_23/calico-system/ (stored 0%)
  adding: tmp/ASTRO_2022_12_23/tigera-operator/ (stored 0%)
  adding: tmp/ASTRO_2022_12_23/keda/ (stored 0%)
  adding: tmp/ASTRO_2022_12_23/airflow-operator-system/ (stored 0%)
  adding: tmp/ASTRO_2022_12_23/splunk-logging/ (stored 0%)
  adding: tmp/ASTRO_2022_12_23/kube-node-lease/ (stored 0%)
  adding: tmp/ASTRO_2022_12_23/istio-system/ (stored 0%)
  adding: tmp/ASTRO_2022_12_23/monitoring/ (stored 0%)
  adding: tmp/ASTRO_2022_12_23/cert-manager/ (stored 0%)
  adding: tmp/ASTRO_2022_12_23/mani-ork/ (stored 0%)
  adding: tmp/ASTRO_2022_12_23/modern-bolometer-8039/ (stored 0%)
  adding: tmp/ASTRO_2022_12_23/modern-bolometer-8039/Describe_modern-bolometer-8039-triggerer-55668cccd6-2l8xx-Pod_modern-bolometer-8039.log (deflated 80%)
  adding: tmp/ASTRO_2022_12_23/modern-bolometer-8039/Dep_statsd_modern-bolometer-8039.log (deflated 49%)
  adding: tmp/ASTRO_2022_12_23/modern-bolometer-8039/Dep_redis_modern-bolometer-8039.log (deflated 88%)
  adding: tmp/ASTRO_2022_12_23/modern-bolometer-8039/getall_status_modern-bolometer-8039.log (deflated 84%)
  adding: tmp/ASTRO_2022_12_23/modern-bolometer-8039/ingress_modern-bolometer-8039.log (deflated 44%)
  adding: tmp/ASTRO_2022_12_23/modern-bolometer-8039/jobs_NS.log (deflated 53%)
  adding: tmp/ASTRO_2022_12_23/modern-bolometer-8039/rs_status_all_namespaces.log (deflated 67%)
  adding: tmp/ASTRO_2022_12_23/modern-bolometer-8039/events_modern-bolometer-8039.log (deflated 89%)
  adding: tmp/ASTRO_2022_12_23/modern-bolometer-8039/Describe_modern-bolometer-8039-redis-0-Pod_modern-bolometer-8039.log (deflated 57%)
  adding: tmp/ASTRO_2022_12_23/modern-bolometer-8039/Describe_modern-bolometer-8039-statsd-97d8748b-tjqhv-Pod_modern-bolometer-8039.log (deflated 63%)
  adding: tmp/ASTRO_2022_12_23/modern-bolometer-8039/pods_modern-bolometer-8039.log (deflated 75%)
  adding: tmp/ASTRO_2022_12_23/modern-bolometer-8039/Describe_modern-bolometer-8039-webserver-bb4c7569f-5m5dx-Pod_modern-bolometer-8039.log (deflated 81%)
  adding: tmp/ASTRO_2022_12_23/modern-bolometer-8039/svc_modern-bolometer-8039.log (deflated 58%)
  adding: tmp/ASTRO_2022_12_23/modern-bolometer-8039/Describe_modern-bolometer-8039-pgbouncer-749fc9746d-s77hg-Pod_modern-bolometer-8039.log (deflated 66%)
  adding: tmp/ASTRO_2022_12_23/modern-bolometer-8039/pvc_modern-bolometer-8039.log (deflated 42%)
  adding: tmp/ASTRO_2022_12_23/modern-bolometer-8039/Describe_modern-bolometer-8039-pgbouncer-749fc9746d-l6djg-Pod_modern-bolometer-8039.log (deflated 66%)
  adding: tmp/ASTRO_2022_12_23/modern-bolometer-8039/Describe_modern-bolometer-8039-worker-default-5578bf8f97-hzm26-Pod_modern-bolometer-8039.log (deflated 80%)
  adding: tmp/ASTRO_2022_12_23/modern-bolometer-8039/Dep_pgbouncer _modern-bolometer-8039.log (deflated 31%)
  adding: tmp/ASTRO_2022_12_23/modern-bolometer-8039/Dep_worker_modern-bolometer-8039.log (deflated 92%)
  adding: tmp/ASTRO_2022_12_23/modern-bolometer-8039/events_sortedbyTimestamp_modern-bolometer-8039.log (deflated 89%)
  adding: tmp/ASTRO_2022_12_23/modern-bolometer-8039/Describe_modern-bolometer-8039-scheduler-67bf78f8f4-8n9zq-Pod_modern-bolometer-8039.log (deflated 80%)
  adding: tmp/ASTRO_2022_12_23/modern-bolometer-8039/Dep_scheduler_modern-bolometer-8039.log (deflated 93%)
  adding: tmp/ASTRO_2022_12_23/modern-bolometer-8039/Dep_triggerer modern-bolometer-8039.log (deflated 43%)
  adding: tmp/ASTRO_2022_12_23/modern-bolometer-8039/Describe_modern-bolometer-8039-scheduler-67bf78f8f4-nkzj9-Pod_modern-bolometer-8039.log (deflated 80%)
  adding: tmp/ASTRO_2022_12_23/modern-bolometer-8039/Nodes/ (stored 0%)
  adding: tmp/ASTRO_2022_12_23/modern-bolometer-8039/Nodes/DESCRIBE_ip-172-60-11-204.ec2.internal.log (deflated 70%)
  adding: tmp/ASTRO_2022_12_23/modern-bolometer-8039/Nodes/DESCRIBE_ip-172-60-28-93.ec2.internal.log (deflated 70%)
  adding: tmp/ASTRO_2022_12_23/modern-bolometer-8039/Nodes/DESCRIBE_ip-172-60-12-98.ec2.internal.log (deflated 70%)
  adding: tmp/ASTRO_2022_12_23/modern-bolometer-8039/Nodes/DESCRIBE_ip-172-60-16-37.ec2.internal.log (deflated 70%)
  adding: tmp/ASTRO_2022_12_23/modern-bolometer-8039/Nodes/DESCRIBE_ip-172-60-12-142.ec2.internal.log (deflated 72%)
  adding: tmp/ASTRO_2022_12_23/modern-bolometer-8039/Nodes/DESCRIBE_ip-172-60-27-118.ec2.internal.log (deflated 71%)
  adding: tmp/ASTRO_2022_12_23/modern-bolometer-8039/Nodes/NODE_POOL_modern-bolometer-8039.log (deflated 64%)
  adding: tmp/ASTRO_2022_12_23/modern-bolometer-8039/Dep_webservermodern-bolometer-8039.log (deflated 98%)
  adding: tmp/ASTRO_2022_12_23/yace/ (stored 0%)
  adding: tmp/ASTRO_2022_12_23/falco/ (stored 0%)
  adding: tmp/ASTRO_2022_12_23/kube-system/ (stored 0%)
  adding: tmp/ASTRO_2022_12_23/default/ (stored 0%)
  adding: tmp/ASTRO_2022_12_23/istio-operator/ (stored 0%)
  adding: tmp/ASTRO_2022_12_23/external-db-operator-system/ (stored 0%)
  adding: tmp/ASTRO_2022_12_23/kube-public/ (stored 0%)
  adding: tmp/ASTRO_2022_12_23/teleport-agent/ (stored 0%)
Here is the list of files created:
/tmp/ASTRO_2022_12_23/airflow-operator-system:
total 0

/tmp/ASTRO_2022_12_23/monitoring:
total 0

/tmp/ASTRO_2022_12_23/mani-ork:
total 0

/tmp/ASTRO_2022_12_23/kube-system:
total 0

/tmp/ASTRO_2022_12_23/kube-public:
total 0

/tmp/ASTRO_2022_12_23/kube-node-lease:
total 0

/tmp/ASTRO_2022_12_23/keda:
total 0

/tmp/ASTRO_2022_12_23/istio-system:
total 0

/tmp/ASTRO_2022_12_23/istio-operator:
total 0

/tmp/ASTRO_2022_12_23/falco:
total 0

/tmp/ASTRO_2022_12_23/external-db-operator-system:
total 0

/tmp/ASTRO_2022_12_23/default:
total 0

/tmp/ASTRO_2022_12_23/cert-manager:
total 0

/tmp/ASTRO_2022_12_23/calico-system:
total 0

/tmp/ASTRO_2022_12_23/yace:
total 0

/tmp/ASTRO_2022_12_23/tigera-operator:
total 0

/tmp/ASTRO_2022_12_23/teleport-agent:
total 0

/tmp/ASTRO_2022_12_23/splunk-logging:
total 0

/tmp/ASTRO_2022_12_23/modern-bolometer-8039:
total 5.9M
-rw-r--r-- 1 root root 7.5K Dec 23 11:21 getall_status_modern-bolometer-8039.log
-rw-r--r-- 1 root root  574 Dec 23 11:21 rs_status_all_namespaces.log
-rw-r--r-- 1 root root 1.7K Dec 23 11:21 pods_modern-bolometer-8039.log
-rw-r--r-- 1 root root  19K Dec 23 11:21 events_modern-bolometer-8039.log
-rw-r--r-- 1 root root  19K Dec 23 11:21 events_sortedbyTimestamp_modern-bolometer-8039.log
-rw-r--r-- 1 root root  503 Dec 23 11:21 svc_modern-bolometer-8039.log
-rw-r--r-- 1 root root  277 Dec 23 11:21 pvc_modern-bolometer-8039.log
-rw-r--r-- 1 root root  346 Dec 23 11:21 ingress_modern-bolometer-8039.log
-rw-r--r-- 1 root root  244 Dec 23 11:21 jobs_NS.log
-rw-r--r-- 1 root root 2.0M Dec 23 11:22 Dep_scheduler_modern-bolometer-8039.log
-rw-r--r-- 1 root root 656K Dec 23 11:22 Dep_worker_modern-bolometer-8039.log
-rw-r--r-- 1 root root 3.1M Dec 23 11:22 Dep_webservermodern-bolometer-8039.log
-rw-r--r-- 1 root root 1.3K Dec 23 11:22 Dep_triggerer modern-bolometer-8039.log
-rw-r--r-- 1 root root  124 Dec 23 11:22 Dep_pgbouncer _modern-bolometer-8039.log
-rw-r--r-- 1 root root  568 Dec 23 11:22 Dep_statsd_modern-bolometer-8039.log
-rw-r--r-- 1 root root  26K Dec 23 11:22 Dep_redis_modern-bolometer-8039.log
-rw-r--r-- 1 root root 4.9K Dec 23 11:22 Describe_modern-bolometer-8039-pgbouncer-749fc9746d-l6djg-Pod_modern-bolometer-8039.log
-rw-r--r-- 1 root root 4.9K Dec 23 11:22 Describe_modern-bolometer-8039-pgbouncer-749fc9746d-s77hg-Pod_modern-bolometer-8039.log
-rw-r--r-- 1 root root 2.8K Dec 23 11:22 Describe_modern-bolometer-8039-redis-0-Pod_modern-bolometer-8039.log
-rw-r--r-- 1 root root  17K Dec 23 11:22 Describe_modern-bolometer-8039-scheduler-67bf78f8f4-8n9zq-Pod_modern-bolometer-8039.log
-rw-r--r-- 1 root root  17K Dec 23 11:22 Describe_modern-bolometer-8039-scheduler-67bf78f8f4-nkzj9-Pod_modern-bolometer-8039.log
-rw-r--r-- 1 root root 4.7K Dec 23 11:22 Describe_modern-bolometer-8039-statsd-97d8748b-tjqhv-Pod_modern-bolometer-8039.log
-rw-r--r-- 1 root root  18K Dec 23 11:22 Describe_modern-bolometer-8039-triggerer-55668cccd6-2l8xx-Pod_modern-bolometer-8039.log
-rw-r--r-- 1 root root  17K Dec 23 11:22 Describe_modern-bolometer-8039-webserver-bb4c7569f-5m5dx-Pod_modern-bolometer-8039.log
-rw-r--r-- 1 root root  19K Dec 23 11:22 Describe_modern-bolometer-8039-worker-default-5578bf8f97-hzm26-Pod_modern-bolometer-8039.log
drwxr-xr-x 2 root root 4.0K Dec 23 11:23 Nodes
total 5.9M
-rw-r--r-- 1 root root 7.5K Dec 23 11:21 getall_status_modern-bolometer-8039.log
-rw-r--r-- 1 root root  574 Dec 23 11:21 rs_status_all_namespaces.log
-rw-r--r-- 1 root root 1.7K Dec 23 11:21 pods_modern-bolometer-8039.log
-rw-r--r-- 1 root root  19K Dec 23 11:21 events_modern-bolometer-8039.log
-rw-r--r-- 1 root root  19K Dec 23 11:21 events_sortedbyTimestamp_modern-bolometer-8039.log
-rw-r--r-- 1 root root  503 Dec 23 11:21 svc_modern-bolometer-8039.log
-rw-r--r-- 1 root root  277 Dec 23 11:21 pvc_modern-bolometer-8039.log
-rw-r--r-- 1 root root  346 Dec 23 11:21 ingress_modern-bolometer-8039.log
-rw-r--r-- 1 root root  244 Dec 23 11:21 jobs_NS.log
-rw-r--r-- 1 root root 2.0M Dec 23 11:22 Dep_scheduler_modern-bolometer-8039.log
-rw-r--r-- 1 root root 656K Dec 23 11:22 Dep_worker_modern-bolometer-8039.log
-rw-r--r-- 1 root root 3.1M Dec 23 11:22 Dep_webservermodern-bolometer-8039.log
-rw-r--r-- 1 root root 1.3K Dec 23 11:22 Dep_triggerer modern-bolometer-8039.log
-rw-r--r-- 1 root root  124 Dec 23 11:22 Dep_pgbouncer _modern-bolometer-8039.log
-rw-r--r-- 1 root root  568 Dec 23 11:22 Dep_statsd_modern-bolometer-8039.log
-rw-r--r-- 1 root root  26K Dec 23 11:22 Dep_redis_modern-bolometer-8039.log
-rw-r--r-- 1 root root 4.9K Dec 23 11:22 Describe_modern-bolometer-8039-pgbouncer-749fc9746d-l6djg-Pod_modern-bolometer-8039.log
-rw-r--r-- 1 root root 4.9K Dec 23 11:22 Describe_modern-bolometer-8039-pgbouncer-749fc9746d-s77hg-Pod_modern-bolometer-8039.log
-rw-r--r-- 1 root root 2.8K Dec 23 11:22 Describe_modern-bolometer-8039-redis-0-Pod_modern-bolometer-8039.log
-rw-r--r-- 1 root root  17K Dec 23 11:22 Describe_modern-bolometer-8039-scheduler-67bf78f8f4-8n9zq-Pod_modern-bolometer-8039.log
-rw-r--r-- 1 root root  17K Dec 23 11:22 Describe_modern-bolometer-8039-scheduler-67bf78f8f4-nkzj9-Pod_modern-bolometer-8039.log
-rw-r--r-- 1 root root 4.7K Dec 23 11:22 Describe_modern-bolometer-8039-statsd-97d8748b-tjqhv-Pod_modern-bolometer-8039.log
-rw-r--r-- 1 root root  18K Dec 23 11:22 Describe_modern-bolometer-8039-triggerer-55668cccd6-2l8xx-Pod_modern-bolometer-8039.log
-rw-r--r-- 1 root root  17K Dec 23 11:22 Describe_modern-bolometer-8039-webserver-bb4c7569f-5m5dx-Pod_modern-bolometer-8039.log
-rw-r--r-- 1 root root  19K Dec 23 11:22 Describe_modern-bolometer-8039-worker-default-5578bf8f97-hzm26-Pod_modern-bolometer-8039.log
drwxr-xr-x 2 root root 4.0K Dec 23 11:23 Nodes
total 1.6M
drwxr-xr-x  2 root root 4.0K Dec 23 11:01 log
-rw-r--r--  1 root root 459K Dec 23 11:11 astro_logs_2022_12_23_11_11_AM.tar.gz
-rw-r--r--  1 root root 486K Dec 23 11:11 astro_logs_2022_12_23_11_11_AM.zip
drwxrwxrwx 21 root root 4.0K Dec 23 11:21 ASTRO_2022_12_23
-rw-r--r--  1 root root 281K Dec 23 11:23 astro_logs_2022_12_23_11_23_AM.tar.gz
-rw-r--r--  1 root root 308K Dec 23 11:23 astro_logs_2022_12_23_11_23_AM.zip
Please attach the zip file or .gz file created in /tmp to the zendesk ticket for reference.

``` 


Kindly make sure your script is in Unix format and executable:

~~~
dos2unix *.sh 
chmod 755 *.sh
~~~
