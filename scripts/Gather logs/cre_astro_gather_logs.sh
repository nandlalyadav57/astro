#!/bin/bash
timestamp=`date '+%d/%m/%Y %H:%M:%S'`
# Put the name of the astronomer ASTRONOMER_NAMESPACE below
#export ASTRONOMER_NAMESPACE=astronomer
#export DIR="/tmp"
#export BASEDOMAIN=nandlal51.astro-cre.com 
echo "Enter your Astronomer Namespace Name:"
read ASTRONOMER_NAMESPACE
echo "Enter the path of directory where you want to keep your log files exported:"
read DI
export DIR=$DI/\astro_logs
echo "If had a test cluster with the URL https://app.xyz.astro-cre.com then my base domain is xyz.astro-cre.com"
echo "what is your basedomain:"
read BASEDOMAIN


#Get Astronomer Release name
export ASTRONOMER_RELEASE=$(helm ls -A|grep -i "$ASTRONOMER_NAMESPACE"|head -n1 | awk '{ print $1}')
# Put the name of the deployment ASTRONOMER_NAMESPACE 1 where we are having issues
#export DEPLOYMENT_NS1=astronomer-combusting-plane-6703
# removing astronomer- and putting as release name
#export Release1=$(echo $DEPLOYMENT_NS1| cut -c 12-)
#setting log directory
#export Ticket=12149
#export mail="nandlalyadav57@yahoo.in"
#Kinfly set base domain info for your cluster 
##For e.g. I had a test cluster with the URL ```https://app.nandlal51.astro-cre.com`then my base domain is ```nandlal51.astro-cre.com``` ###
#export BASEDOMAIN=nandlal51.astro-cre.com     <<<<MAKE SURE TO LOGIN ON ASTRO CLI>>>>>>>>>>>>>
#astro auth login $BASEDOMAIN
#export Release_Name=$(echo $NS| cut -c 12-)
#####====================================================================================================================================================#####
echo "====> Here is the list of Namespaces found:"
kubectl get namespaces
echo "====> You have specied $ASTRONOMER_NAMESPACE as a namespace where all the core Astronomer platform pods are running.Please make sure it's correctly specified."
echo "====> Your astronomer release name is $ASTRONOMER_RELEASE."
#echo $DEPLOYMENT_NS1
#echo $Release1
echo "====> The path where logs would be stored is $DIR."
echo "====> Your Base Domain is $BASEDOMAIN.This means you should access your Astronomer UI at https://app.$BASEDOMAIN"
#echo "You have specified zendesk ticket numeber as $Ticket & this would be used in the mail subject line."
#echo "Mail would be sent to $mail using mutt & sendmail package in linux.If you don't have the package you can install it else you can simple attach the logs to the ticket."
#####====================================================================================================================================================#####
echo "====> cleaning any older $DIR directory to avoid script failure"
rm -rf $DI/\astro_logs
echo "====> Creating log file directory $DIR."
mkdir -p "$DIR"
chmod -R 777 "$DIR"
###https://stackoverflow.com/questions/589149/bash-script-to-cd-to-directory-with-spaces-in-pathname
cd "$DIR"
####creating namespace Directories###
for NS in $(kubectl get ns --no-headers| awk '{print $1}'); do
    echo "creating namespace $NS Directory ";mkdir $NS ;mkdir $NS/AllPodlogs
    done
#####====================================================================================================================================================#####
####Gathering Describe output of bad state pods in all namespaces###

#kubectl get pods $POD -o jsonpath='{.spec.containers[*].name}' -n $NS|awk '{NF-=0; OFS="\n"; $1=$1}1' | sort
#####====================================================================================================================================================#####
#kubectl get pods astronomer-prometheus-0 -o jsonpath='{.spec.containers[*].name}' -n astronomer|awk '{NF-=0; OFS="\n"; $1=$1}1' | sort
#get containers name in 1 line from a pod
#echo "======================Gathering Describe output of Bad state pod======================"
#for NS in $(kubectl get ns --no-headers| awk '{print $1}'); 
#do
#  for POD in $(kubectl get pods --no-headers -n $NS |grep -v Running|grep -v Completed|awk '{ print $1}') ; do
#    export POD=$POD;echo $POD pod is in bad state;echo "Collecting Describe output of bad state pod $POD in $NS Namespace ";kubectl describe pod $POD  > "$NS/$POD-BAD_$NS.log" -n $NS   
#    done
#done


echo "======================Gathering Describe output of Bad state pod======================"
for NS in $(kubectl get ns --no-headers| awk '{print $1}'); 
do
  for BAD_POD in $(kubectl get pods --no-headers -n $NS |grep -v Running|grep -v Completed|awk '{ print $1}') ; do
    export BAD_POD=$BAD_POD;echo $BAD_POD pod is in bad state;echo "Collecting Describe output of bad state pod $BAD_POD in $NS Namespace ";kubectl describe pod $BAD_POD  > "$NS/$BAD_POD-BAD_$NS.log" -n $NS   
    done
done


echo "======================Gathering log output of Bad state pod======================"
for NS in $(kubectl get ns --no-headers| awk '{print $1}'); 
do
  for BAD_POD in $(kubectl get pods --no-headers -n $NS |grep -v Running|grep -v Completed|awk '{ print $1}') ; do
    export BAD_POD=$BAD_POD;echo "Starting to Collect log of the bad state pod $BAD_POD in $NS namespace";for container_name in $(kubectl get pods $BAD_POD -o jsonpath='{.spec.containers[*].name}' -n $NS|awk '{NF-=0; OFS="\n"; $1=$1}1' | sort);do
    echo Collecting log of the container $container_name in pod $BAD_POD in the $NS namespace now;kubectl logs $BAD_POD -n $NS -c $container_name > "$NS/$BAD_POD-pod_$container_name-BADPODLOG.log"  
    done
done
done




echo "======================Gathering logs of All the pods ======================"
for NS in $(kubectl get ns --no-headers| awk '{print $1}'); 
do
  for POD in $(kubectl get pods --no-headers -n $NS |awk '{ print $1}') ; do
    export POD=$POD;echo "Starting to Collect log of the pod $POD in $NS namespace";for container_name in $(kubectl get pods $POD -o jsonpath='{.spec.containers[*].name}' -n $NS|awk '{NF-=0; OFS="\n"; $1=$1}1' | sort);do
    echo Collecting log of the container $container_name in pod $POD in the $NS namespace now;kubectl logs $POD -n $NS -c $container_name > "$NS/AllPodlogs/$POD-pod_$container_name-container.log"  
    done
done
done




#####====================================================================================================================================================#####
####Gathering Describe output of all the Nodes
echo "======================Gathering Describe output of all the nodes======================"
for NODE in $(kubectl get nodes --no-headers |awk '{ print $1}') ; do
    echo "Collecting Describe output of Node $NODE ";kubectl describe nodes $NODE > "$ASTRONOMER_NAMESPACE/DESCRIBE_$NODE.log"
done
#####==================================================================================================================================================#####
####Gathering All the $ASTRONOMER_NAMESPACE logs###
echo "======================Gathering All the Deployment logs in $ASTRONOMER_NAMESPACE namespace logs======================"
echo "Gathering logs of houston in $ASTRONOMER_NAMESPACE Namespace ";kubectl logs deployment/astronomer-houston  > "$ASTRONOMER_NAMESPACE/houston$ASTRONOMER_NAMESPACE.log" -n $ASTRONOMER_NAMESPACE
echo "Gathering logs of houston-worker in $ASTRONOMER_NAMESPACE Namespace ";kubectl logs deployment/astronomer-houston-worker  > "$ASTRONOMER_NAMESPACE/houston-worker$ASTRONOMER_NAMESPACE.log" -n $ASTRONOMER_NAMESPACE
echo "Gathering logs of astro-ui in $ASTRONOMER_NAMESPACE Namespace ";kubectl logs deployment/astronomer-astro-ui > "$ASTRONOMER_NAMESPACE/astro-ui$ASTRONOMER_NAMESPACE.log" -n $ASTRONOMER_NAMESPACE
echo "Gathering logs of commander in $ASTRONOMER_NAMESPACE Namespace ";kubectl logs deployment/astronomer-commander  > "$ASTRONOMER_NAMESPACE/commander$ASTRONOMER_NAMESPACE.log" -n $ASTRONOMER_NAMESPACE
echo "Gathering logs of nginx in $ASTRONOMER_NAMESPACE Namespace ";kubectl logs deployment/astronomer-nginx > "$ASTRONOMER_NAMESPACE/nginx_$ASTRONOMER_NAMESPACE.log" -n $ASTRONOMER_NAMESPACE
echo "Gathering logs of grafana in $ASTRONOMER_NAMESPACE Namespace ";kubectl logs deployment/astronomer-grafana > "$ASTRONOMER_NAMESPACE/grafana_$ASTRONOMER_NAMESPACE.log" -n $ASTRONOMER_NAMESPACE
echo "Gathering logs of kube-state in $ASTRONOMER_NAMESPACE Namespace ";kubectl logs deployment/astronomer-kube-state > "$ASTRONOMER_NAMESPACE/kube-state_$ASTRONOMER_NAMESPACE.log" -n $ASTRONOMER_NAMESPACE
echo "Gathering logs of kibana in $ASTRONOMER_NAMESPACE Namespace ";kubectl logs deployment/astronomer-kibana > "$ASTRONOMER_NAMESPACE/kibana_$ASTRONOMER_NAMESPACE.log" -n $ASTRONOMER_NAMESPACE 
echo "Gathering logs of nginx-default-backend in $ASTRONOMER_NAMESPACE Namespace ";kubectl logs deployment/astronomer-nginx-default-backend > "$ASTRONOMER_NAMESPACE/nginx-default-backend_$ASTRONOMER_NAMESPACE.log" -n $ASTRONOMER_NAMESPACE
echo "Gathering logs of elasticsearch-exporterin $ASTRONOMER_NAMESPACE Namespace ";kubectl logs deployment/astronomer-elasticsearch-exporter> "$ASTRONOMER_NAMESPACE/grafana_$ASTRONOMER_NAMESPACE.log" -n $ASTRONOMER_NAMESPACE
echo "Gathering logs of elasticsearch-nginx in $ASTRONOMER_NAMESPACE Namespace ";kubectl logs deployment/astronomer-elasticsearch-nginx > "$ASTRONOMER_NAMESPACE/elasticsearch-nginx_$ASTRONOMER_NAMESPACE.log" -n $ASTRONOMER_NAMESPACE
echo "Gathering logs of cli-install in $ASTRONOMER_NAMESPACE Namespace ";kubectl logs deployment/astronomer-cli-install > "$ASTRONOMER_NAMESPACE/cli-install_$ASTRONOMER_NAMESPACE.log" -n $ASTRONOMER_NAMESPACE 
echo "Gathering logs of elasticsearch-client in $ASTRONOMER_NAMESPACE Namespace ";kubectl logs deployment/astronomer-elasticsearch-client > "$ASTRONOMER_NAMESPACE/elasticsearch-client$ASTRONOMER_NAMESPACE.log" -n $ASTRONOMER_NAMESPACE
echo "Gathering logs of elasticsearch-master in $ASTRONOMER_NAMESPACE Namespace ";kubectl logs sts/astronomer-elasticsearch-master > "$ASTRONOMER_NAMESPACE/elasticsearch-master_$ASTRONOMER_NAMESPACE.log" -n $ASTRONOMER_NAMESPACE
echo "Gathering logs of elasticsearch-data in $ASTRONOMER_NAMESPACE Namespace ";kubectl logs sts/astronomer-elasticsearch-data > "$ASTRONOMER_NAMESPACE/elasticsearch-data_$ASTRONOMER_NAMESPACE.log" -n $ASTRONOMER_NAMESPACE  
echo "Gathering logs of stan in $ASTRONOMER_NAMESPACE Namespace ";kubectl logs sts/astronomer-stan -c stan > "$ASTRONOMER_NAMESPACE/stan_contatiner_$ASTRONOMER_NAMESPACE.log" -n $ASTRONOMER_NAMESPACE
echo "Gathering logs of registry in $ASTRONOMER_NAMESPACE Namespace ";kubectl logs sts/astronomer-registry > "$ASTRONOMER_NAMESPACE/registry$ASTRONOMER_NAMESPACE.log" -n $ASTRONOMER_NAMESPACE
echo "Gathering logs of prometheus in $ASTRONOMER_NAMESPACE Namespace ";kubectl logs sts/astronomer-prometheus  -c prometheus   > "$ASTRONOMER_NAMESPACE/prometheus_container_$ASTRONOMER_NAMESPACE.log" -n $ASTRONOMER_NAMESPACE
echo "Gathering logs of nats in $ASTRONOMER_NAMESPACE Namespace ";kubectl logs sts/astronomer-nats -c nats  > "$ASTRONOMER_NAMESPACE/nats_$ASTRONOMER_NAMESPACE.log" -n $ASTRONOMER_NAMESPACE
echo "Gathering logs of alertmanager in $ASTRONOMER_NAMESPACE Namespace ";kubectl logs sts/astronomer-alertmanager -c alertmanager  > "$ASTRONOMER_NAMESPACE/alertmanager_$ASTRONOMER_NAMESPACE.log" -n $ASTRONOMER_NAMESPACE
echo "======================Collecting Some General enviornment Information in the $ASTRONOMER_NAMESPACE======================"
echo "Gathering get all status  in $ASTRONOMER_NAMESPACE Namespace";kubectl get all --all-namespaces > "$ASTRONOMER_NAMESPACE/getall_status_$ASTRONOMER_NAMESPACE.log" -n $ASTRONOMER_NAMESPACE
echo "Gathering All replica status in all namespaces";kubectl get rs --all-namespaces|grep -v '0         0         0' > "$ASTRONOMER_NAMESPACE/rs_status_all_namespaces.log"
echo "Gathering Pod Running status in $ASTRONOMER_NAMESPACE Namespace";kubectl get pods -o wide > "$ASTRONOMER_NAMESPACE/pods_$ASTRONOMER_NAMESPACE.log" -n $ASTRONOMER_NAMESPACE
echo "Gathering events in $ASTRONOMER_NAMESPACE Namespace ";kubectl get events > "$ASTRONOMER_NAMESPACE/events_$ASTRONOMER_NAMESPACE.log" -n $ASTRONOMER_NAMESPACE
echo "Gathering secrets in $ASTRONOMER_NAMESPACE Namespace ";kubectl get secrets > "$ASTRONOMER_NAMESPACE/secrets_$ASTRONOMER_NAMESPACE.log" -n $ASTRONOMER_NAMESPACE
echo "Gathering Node Status";kubectl get nodes -o wide > "$ASTRONOMER_NAMESPACE/nodes.log"
echo "Gathering kube-system pod status";kubectl get pods -o wide -n kube-system > "$ASTRONOMER_NAMESPACE/kube-system.log" 
echo "Gathering sevice Status in $ASTRONOMER_NAMESPACE Namespace ";kubectl get svc > "$ASTRONOMER_NAMESPACE/svc_$ASTRONOMER_NAMESPACE.log" -n $ASTRONOMER_NAMESPACE
echo "Gathering persistent volume Status in $ASTRONOMER_NAMESPACE Namespace ";kubectl get pvc > "$ASTRONOMER_NAMESPACE/pvc_$ASTRONOMER_NAMESPACE.log" -n $ASTRONOMER_NAMESPACE
echo "Gathering ingress Status in $ASTRONOMER_NAMESPACE Namespace ";kubectl get ingress > "$ASTRONOMER_NAMESPACE/ingress_$ASTRONOMER_NAMESPACE.log" -n $ASTRONOMER_NAMESPACE
echo "Gathering cronjobs Status in $ASTRONOMER_NAMESPACE Namespace ";kubectl get cronjobs > "$ASTRONOMER_NAMESPACE/cronjobs_$ASTRONOMER_NAMESPACE.log" -n $ASTRONOMER_NAMESPACE
echo "Gathering jobs Status in $ASTRONOMER_NAMESPACE Namespace ";kubectl get jobs > "$ASTRONOMER_NAMESPACE/jobs_$ASTRONOMER_NAMESPACE.log" -n $ASTRONOMER_NAMESPACE
echo "Gathering Diskspace of Registry pod in $ASTRONOMER_NAMESPACE Namespace ";kubectl get pods -n $ASTRONOMER_NAMESPACE  | grep registry | awk '{print $1}' | xargs -I {} kubectl exec -it -n $ASTRONOMER_NAMESPACE  {} -- df -Th > "$ASTRONOMER_NAMESPACE/Registry_Diskspace_$ASTRONOMER_NAMESPACE.log"
echo "=======================Astro version output==========================================================================" > "$ASTRONOMER_NAMESPACE/Enviornment_Info.log"
echo "Gathering Astro version status";astro version  >> "$ASTRONOMER_NAMESPACE/Enviornment_Info.log"
echo "=======================docker version output==========================================================================" >> "$ASTRONOMER_NAMESPACE/Enviornment_Info.log"
echo "Gathering docker version status";docker version  >> "$ASTRONOMER_NAMESPACE/Enviornment_Info.log"
echo "=======================helm version output==========================================================================" >> "$ASTRONOMER_NAMESPACE/Enviornment_Info.log"
echo "Gathering helm version status";helm version  >> "$ASTRONOMER_NAMESPACE/Enviornment_Info.log"
echo "Gathering helm status";helm ls -A >> "$ASTRONOMER_NAMESPACE/helm_status.log"
echo "Gathering helm history in $ASTRONOMER_NAMESPACE Namespace";helm history $ASTRONOMER_RELEASE -n $ASTRONOMER_NAMESPACE > "$ASTRONOMER_NAMESPACE/helm_history_$ASTRONOMER_RELEASE.log"
echo "Gathering helm values from $ASTRONOMER_NAMESPACE Namespace";helm get values $ASTRONOMER_RELEASE -n $ASTRONOMER_NAMESPACE -o yaml > "$ASTRONOMER_NAMESPACE/helm_values_$ASTRONOMER_RELEASE.yaml"
####Gathering All the Deployment namespace logs###
for NS in $(kubectl get ns --no-headers|grep -i "$ASTRONOMER_NAMESPACE-" | awk '{print $1}'); do
echo "======================Collecting Some General enviornment Information in the $NS======================"
      echo "Gathering get all status  in $NS Namespace";kubectl get all > "$NS/getall_status_$NS.log" -n $NS
      echo "Gathering All replica status in all namespaces";kubectl get rs -n $NS|grep -v '0         0         0' > "$NS/rs_status_all_namespaces.log"
      echo "Gathering Pod Running status in $NS Namespace";kubectl get pods -o wide > "$NS/pods_$NS.log" -n $NS
      echo "Gathering events in $NS Namespace ";kubectl get events > "$NS/events_$NS.log" -n $NS
      echo "Gathering secrets in $NS Namespace ";kubectl get secrets > "$NS/secrets_$NS.log" -n $NS
      echo "Gathering sevice Status in $NS Namespace ";kubectl get svc > "$NS/svc_$NS.log" -n $NS
      echo "Gathering persistent volume Status in $NS Namespace ";kubectl get pvc > "$NS/pvc_$NS.log" -n $NS
      echo "Gathering ingress Status in $NS Namespace ";kubectl get ingress > "$NS/ingress_$NS.log" -n $NS
      echo "Gathering cronjobs Status in $NS Namespace ";kubectl get cronjobs > "$NS/cronjobs_$NS.log" -n $NS
      echo "Gathering jobs Status in $NS Namespace ";kubectl get jobs > "$NS/cronjobs_NS.log" -n $NS
      echo "Number of digits to trim while getting release name";export X=$(echo $ASTRONOMER_NAMESPACE|wc -m);echo "VALUE to be increased by 1 for trimming is $X in $NS";export Y=$(($X+1)); echo "Number of digits to be trimmed while getting release name is $Y in $NS"
      echo "Exporting Release name ";export Release_Name=$(echo $NS| cut -c $Y-)
      echo "Your Release_Name in current namespace $NS is $Release_Name."
echo "======================Gathering All the Deployment namespace logs in the $NS======================"
      echo "Gathering logs of scheduler in $NS Namespace ";kubectl logs deployment/$Release_Name-scheduler -c scheduler > "$NS/scheduler_$NS.log" -n $NS  
      echo "Gathering logs of worker in $NS Namespace ";kubectl logs deployment/$Release_Name-worker -c worker > "$NS/worker_$NS.log" -n $NS
      echo "Gathering logs of webserverin $NS Namespace ";kubectl logs deployment/$Release_Name-webserver -c webserver > "$NS/webserver$NS.log" -n $NS
      echo "Gathering logs of triggerer in $NS Namespace ";kubectl logs deployment/$Release_Name-triggerer -c triggerer > "$NS/triggerer $NS.log" -n $NS
      echo "Gathering logs of pgbouncer in $NS Namespace ";kubectl logs deployment/$Release_Name-pgbouncer -c pgbouncer > "$NS/pgbouncer _$NS.log" -n $NS    
      echo "Gathering logs of flower  in $NS Namespace ";kubectl logs deployment/$Release_Name-flower > "$NS/flower _$NS.log" -n $NS
      echo "Gathering logs of statsd in $NS Namespace ";kubectl logs deployment/$Release_Name-statsd > "$NS/statsd_$NS.log" -n $NS
      echo "Gathering logs of redis in $NS Namespace ";kubectl logs sts/$Release_Name-redis > "$NS/redis_$NS.log" -n $NS 
      echo "Gathering helm history in $NS Namespace";helm history $Release_Name -n $NS > "$NS/helm_history_$Release_Name.yaml"
      echo "Gathering helm values from $NS Namespace";helm get values $Release_Name -o yaml -n $NS  > "$NS/helm_values_$Release_Name.yaml"
    done

echo "Checking ENDPOINTS"

for EP in $(kubectl describe svc kube-dns -n kube-system|grep Endpoints|awk '{print $2}'|uniq|sed 's/,/\n/g'|sed 's/:[^[:blank:]]*//'); do
echo "======================CHECKING Houston ENDPOINT for $EP======================";nslookup houston.$BASEDOMAIN > $DIR/nslookup_houston_$EP.$BASEDOMAIN.log; echo " you have to run nslookup houston.$BASEDOMAIN $EP inside any of the pods lets say inside a nginx pod" >> $DIR/nslookup_houston_$EP.$BASEDOMAIN.log
echo "PLEASE NOTE ======== you have to run nslookup houston.$BASEDOMAIN $EP inside any of the pods lets say inside a nginx pod to make sure endpoints are running fine"
done

for i in {1..10} ;do curl -I  https://registry.$BASEDOMAIN; done  > $DIR/curl_check_registry.$BASEDOMAIN.log
for i in {1..10} ;do curl -I  https://app.$BASEDOMAIN/; done      > $DIR/curl_check_app.$BASEDOMAIN.log
for i in {1..10} ;do curl -I  https://install.$BASEDOMAIN/; done  > $DIR/curl_check_install.$BASEDOMAIN.log

#for i in {1..10} ;do curl -I  https://kibana.$BASEDOMAIN/; done
#for i in {1..10} ;do curl -I  https://grafana.$BASEDOMAIN/; done
#for i in {1..10} ;do curl -I  https://houston.$BASEDOMAIN/; done
#for i in {1..10} ;do curl -I  https://deployments.$BASEDOMAIN; done
#for i in {1..10} ;do curl -I  https://prometheus.$BASEDOMAIN; done
#for i in {1..10} ;do curl -I  https://alertmanager.$BASEDOMAIN; done


#####====================================================================================================================================================#####
echo "======================creating GZ and zip files======================"
#####====================================================================================================================================================#####
cd "$DIR"
cd ..
tar -czvf "astro_logs"_$(date +"%Y_%m_%d_%I_%M_%p").tar.gz "$DIR"
zip -r "astro_logs"_$(date +"%Y_%m_%d_%I_%M_%p").zip "$DIR"
cdir=$PWD
echo "Here is the list of files created:"
ls -lhtr $DIR/*
ls -lhtr $DIR/$ASTRONOMER_NAMESPACE*
ls -lhtr
echo "Please attach the zip file or .gz file created in $cdir to the zendesk ticket for reference."
#echo "Timing out for 30 sec for zip file to be present before sending"
#@timeout /t 30
#####====================================================================================================================================================#####
#echo "Sharing the logs via mail for troubleshooting"
#echo "Here are the Platform logs for troubleshooting $Ticket" | mutt -a "$DIR".zip" -a $DIR"_$(date +%F).tar.gz -s "Platform logs for troubleshooting $Ticket" -- $mail
#####====================================================================================================================================================#####
#echo "Here are the Platform logs for troubleshooting $Ticket" | mutt -a "$DIR".zip" -s "Platform logs for troubleshooting $Ticket" -- $mail


