#!/bin/bash
timestamp=`date '+%d/%m/%Y %H:%M:%S'`
# Put the name of the astronomer ASTRONOMER_NAMESPACE below
export ASTRONOMER_NAMESPACE=astronomer
#Get Astronomer Release name
export ASTRONOMER_RELEASE=$(helm ls -A|grep -i "$ASTRONOMER_NAMESPACE"|head -n1 | awk '{ print $1}')
# Put the name of the deployment ASTRONOMER_NAMESPACE 1 where we are having issues
#export DEPLOYMENT_NS1=astronomer-combusting-plane-6703
# removing astronomer- and putting as release name
#export Release1=$(echo $DEPLOYMENT_NS1| cut -c 12-)
#setting log directory
export DIR="/tmp/astro_logs"
#export Ticket=12149
#export mail="nandlalyadav57@yahoo.in"
#Kinfly set base domain info for your cluster 
##For e.g. I had a test cluster with the URL ```https://app.nandlal54.astro-cre.com`then my base domain is ```nandlal54.astro-cre.com``` ###
#export BASEDOMAIN=nandlal51.astro-cre.com     <<<<MAKE SURE TO LOGIN ON ASTRO CLI>>>>>>>>>>>>>
#astro auth login $BASEDOMAIN
#####====================================================================================================================================================#####
echo "====> Here is the list of Namespaces found:"
kubectl get namespaces
echo "====> You have specied $ASTRONOMER_NAMESPACE as a namespace where all the core Astronomer platform pods are running.Please make sure it's correctly specified."
echo "====> Your astronomer release name is $ASTRONOMER_RELEASE."
#echo $DEPLOYMENT_NS1
#echo $Release1
echo "====> The path where logs would be stored is $DIR."
#echo "You have specified zendesk ticket numeber as $Ticket & this would be used in the mail subject line."
#echo "Mail would be sent to $mail using mutt & sendmail package in linux.If you don't have the package you can install it else you can simple attach the logs to the ticket."
#####====================================================================================================================================================#####
echo "====> Creating log file directory $DIR."
mkdir -p "$DIR"
chmod -R 777 "$DIR"
###https://stackoverflow.com/questions/589149/bash-script-to-cd-to-directory-with-spaces-in-pathname
cd "$DIR"
####creating namespace Directories###
for NS in $(kubectl get ns --no-headers|grep $ASTRONOMER_NAMESPACE| awk '{print $1}'); do
    echo "creating namespace $NS Directory ";mkdir $NS 
    done
#####====================================================================================================================================================#####
####Gathering Describe output of bad state pods in all namespaces###
echo "======================Gathering Describe output of Bad state pod======================"
for NS in $(kubectl get ns --no-headers| awk '{print $1}'); 
do
  for POD in $(kubectl get pods --no-headers -n $NS |grep -v Running|grep -v Completed|awk '{ print $1}') ; do
    echo $POD pod is in bad state;echo "Collecting Describe output of bad state pods in $NS Namespace ";kubectl describe pod $POD  > "$NS/BADpodDESCRIBE_$POD_$NS.log" -n $NS   
    done
done
#####====================================================================================================================================================#####
#####====================================================================================================================================================#####
####Gathering Describe output of all the Nodes
echo "======================Gathering Describe output of all the nodes======================"
for NODE in $(kubectl get nodes --no-headers |awk '{ print $1}') ; do
    echo "Collecting Describe output of Node $NODE ";kubectl describe nodes $NODE > "$ASTRONOMER_NAMESPACE/DESCRIBE_$NODE.log"
done
#####==================================================================================================================================================#####
####Gathering All the $ASTRONOMER_NAMESPACE logs###
echo "======================Gathering All the $ASTRONOMER_NAMESPACE namespace logs======================"
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
echo "Gathering jobs Status in $ASTRONOMER_NAMESPACE Namespace ";kubectl get jobs > "$ASTRONOMER_NAMESPACE/cronjobs_$ASTRONOMER_NAMESPACE.log" -n $ASTRONOMER_NAMESPACE
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
      echo "Gathering jobs Status in $NS Namespace ";kubectl get jobs > "$NS/cronjobs_$NS.log" -n $NS
      echo "Exporting Release name ";export Release_Name=$(echo $NS| cut -c 12-)
      echo "Your Release_Name in current namespace is $Release_Name."
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
#####====================================================================================================================================================#####
echo "======================creating GZ and zip files======================"
#####====================================================================================================================================================#####
cd ..
tar -czvf "$DIR"_$(date +%F).tar.gz "$DIR"
zip -r "$DIR"_$(date +%F).zip "$DIR"
cdir=$PWD
echo "Here is the list of files created:"
ls -lhtr $DIR/*
ls -lhtr /tmp/astro_logs/$ASTRONOMER_NAMESPACE*
echo "Please attach the zip file or .gz file created in $cdir to the zendesk ticket for reference."
#echo "Timing out for 30 sec for zip file to be present before sending"
#@timeout /t 30
#####====================================================================================================================================================#####
#echo "Sharing the logs via mail for troubleshooting"
#echo "Here are the Platform logs for troubleshooting $Ticket" | mutt -a "$DIR".zip" -a $DIR"_$(date +%F).tar.gz -s "Platform logs for troubleshooting $Ticket" -- $mail
#####====================================================================================================================================================#####
#echo "Here are the Platform logs for troubleshooting $Ticket" | mutt -a "$DIR".zip" -s "Platform logs for troubleshooting $Ticket" -- $mail