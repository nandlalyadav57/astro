#!/bin/zsh
timestamp=`date '+%d/%m/%Y %H:%M:%S'`
# Put the name of the astronomer ASTRONOMER_NAMESPACE below
export ASTRONOMER_NAMESPACE=astronomer
#Get Astronomer Release name
export ASTRONOMER_RELEASE=$(helm ls -A|grep -i "astronomer"|head -n1 | awk '{ print $1}')
# Put the name of the deployment ASTRONOMER_NAMESPACE 1 where we are having issues
#export DEPLOYMENT_NS1=astronomer-combusting-plane-6703
# removing astronomer- and putting as release name
#export Release1=$(echo $DEPLOYMENT_NS1| cut -c 12-)
#setting log directory
export DIR="/tmp/n"
#export Ticket=12149
#export mail="nandlalyadav57@yahoo.in"
#Kinfly set base domain info for your cluster 
##For e.g. I had a test cluster with the URL ```https://app.nandlal54.astro-cre.com`then my base domain is ```nandlal54.astro-cre.com``` ###
#export BASEDOMAIN=nandlal51.astro-cre.com     <<<<MAKE SURE TO LOGIN ON ASTRO CLI>>>>>>>>>>>>>
#astro auth login $BASEDOMAIN
#####====================================================================================================================================================#####
echo "You have specied $ASTRONOMER_NAMESPACE as a namespace where all the core Astronomer platform pods are running.Please make sure it's correctly specified."
echo "Your astronomer release name is $ASTRONOMER_RELEASE."
#echo $DEPLOYMENT_NS1
#echo $Release1
echo "The path where logs would be stored is $DIR."
#echo "You have specified zendesk ticket numeber as $Ticket & this would be used in the mail subject line."
#echo "Mail would be sent to $mail using mutt & sendmail package in linux.If you don't have the package you can install it else you can simple attach the logs to the ticket."
#####====================================================================================================================================================#####
mkdir -p "$DIR"
chmod -R 777 "$DIR"
###https://stackoverflow.com/questions/589149/bash-script-to-cd-to-directory-with-spaces-in-pathname
cd "$DIR"
####creating namespace Directories###
#!/bin/bash
for NS in $(kubectl get ns --no-headers|grep $ASTRONOMER_NAMESPACE| awk '{print $1}'); do
    echo "creating namespace $NS Directory ";mkdir $NS 
    done


####Gathering Describe output of bad state pods in all namespaces###
for NS in $(kubectl get ns --no-headers| awk '{print $1}'); 
do
  for POD in $(kubectl get pods --no-headers -n $NS |grep -v Running|grep -v Completed|awk '{ print $1}') ; do
    echo $POD pod is in bad state;echo "Collecting Describe output of bad state pods in $NS Namespace ";kubectl describe pod $POD  > "$NS/BADpodDESCRIBE_$POD_$NS.log" -n $NS   
    done
done

####Gathering All the $ASTRONOMER_NAMESPACE logs###
echo "Gathering All the $ASTRONOMER_NAMESPACE namespace logs"
echo "Getting Pod Running status in $ASTRONOMER_NAMESPACE Namespace";kubectl get pods -o wide > "$ASTRONOMER_NAMESPACE/pods_$ASTRONOMER_NAMESPACE.log" -n $ASTRONOMER_NAMESPACE
echo "Getting events in $ASTRONOMER_NAMESPACE Namespace ";kubectl get events > "$ASTRONOMER_NAMESPACE/events_$ASTRONOMER_NAMESPACE.log" -n $ASTRONOMER_NAMESPACE
echo "Getting secrets in $ASTRONOMER_NAMESPACE Namespace ";kubectl get secrets > "$ASTRONOMER_NAMESPACE/secrets_$ASTRONOMER_NAMESPACE.log" -n $ASTRONOMER_NAMESPACE
echo "Getting logs of worker in $ASTRONOMER_NAMESPACE Namespace ";kubectl logs deployment/astronomer-houston  > "$ASTRONOMER_NAMESPACE/worker_$ASTRONOMER_NAMESPACE.log" -n $ASTRONOMER_NAMESPACE
echo "Getting logs of webserverin $ASTRONOMER_NAMESPACE Namespace ";kubectl logs deployment/astronomer-astro-ui > "$ASTRONOMER_NAMESPACE/webserver$ASTRONOMER_NAMESPACE.log" -n $ASTRONOMER_NAMESPACE
echo "Getting logs of triggerer in $ASTRONOMER_NAMESPACE Namespace ";kubectl logs deployment/astronomer-commander  > "$ASTRONOMER_NAMESPACE/triggerer $ASTRONOMER_NAMESPACE.log" -n $ASTRONOMER_NAMESPACE
echo "Getting logs of pgbouncer in $ASTRONOMER_NAMESPACE Namespace ";kubectl logs deployment/astronomer-elasticsearch-client > "$ASTRONOMER_NAMESPACE/pgbouncer _$ASTRONOMER_NAMESPACE.log" -n $ASTRONOMER_NAMESPACE    
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
echo "Getting kube-system pod status";kubectl get pods -o wide -n kube-system > kube-system.log > "$ASTRONOMER_NAMESPACE/kube-system.log"
echo "=======================Astro version output==========================================================================" > "$ASTRONOMER_NAMESPACE/Enviornment_Info.log"
echo "Getting Astro version status";astro version  >> "$ASTRONOMER_NAMESPACE/Enviornment_Info.log"
echo "=======================Docker version output==========================================================================" >> "$ASTRONOMER_NAMESPACE/Enviornment_Info.log"
echo "Getting Astro version status";docker version  >> "$ASTRONOMER_NAMESPACE/Enviornment_Info.log"
echo "Getting helm status";helm ls -A >> "$ASTRONOMER_NAMESPACE/helm_status.log"
echo "Getting helm history in $ASTRONOMER_NAMESPACE Namespace";helm history $ASTRONOMER_RELEASE -n $ASTRONOMER_NAMESPACE > "$ASTRONOMER_NAMESPACE/helm_history_$ASTRONOMER_RELEASE.log"
echo "Getting helm values from $ASTRONOMER_NAMESPACE Namespace";helm get values $ASTRONOMER_RELEASE -n $ASTRONOMER_NAMESPACE -o yaml > "$ASTRONOMER_NAMESPACE/helm_values_$ASTRONOMER_RELEASE.yaml"








####Gathering All the Deployment namespace logs###
echo "Gathering All the Deployment namespace logs"
for NS in $(kubectl get ns --no-headers|grep -i "$ASTRONOMER_NAMESPACE-" | awk '{print $1}'); do
      echo "Getting Pod Running status in $NS Namespace";kubectl get pods -o wide > "$NS/pods_$NS.log" -n $NS
      echo "Getting events in $NS Namespace ";kubectl get events > "$NS/events_$NS.log" -n $NS
      echo "Getting secrets in $NS Namespace ";kubectl get secrets > "$NS/secrets_$NS.log" -n $NS
      echo "export release name ";export Release_Name=$(echo $NS| cut -c 12-)
      echo "Your Release_Name in current namespace is $Release_Name."
      echo "Getting logs of scheduler in $NS Namespace ";kubectl logs deployment/$Release_Name-scheduler -c scheduler > "$NS/scheduler_$NS.log" -n $NS  
      echo "Getting logs of worker in $NS Namespace ";kubectl logs deployment/$Release_Name-worker -c worker > "$NS/worker_$NS.log" -n $NS
      echo "Getting logs of webserverin $NS Namespace ";kubectl logs deployment/$Release_Name-webserver -c webserver > "$NS/webserver$NS.log" -n $NS
      echo "Getting logs of triggerer in $NS Namespace ";kubectl logs deployment/$Release_Name-triggerer -c triggerer > "$NS/triggerer $NS.log" -n $NS
      echo "Getting logs of pgbouncer in $NS Namespace ";kubectl logs deployment/$Release_Name-pgbouncer -c pgbouncer > "$NS/pgbouncer _$NS.log" -n $NS    
      echo "Getting logs of flower  in $NS Namespace ";kubectl logs deployment/$Release_Name-flower > "$NS/flower _$NS.log" -n $NS
      echo "Getting logs of statsd in $NS Namespace ";kubectl logs deployment/$Release_Name-statsd > "$NS/statsd_$NS.log" -n $NS
      echo "Getting logs of redis in $NS Namespace ";kubectl logs sts/$Release_Name-redis > "$NS/redis_$NS.log" -n $NS 
      echo "Getting helm history in $NS Namespace";helm history $Release_Name -n $NS > "$NS/helm_history_$Release_Name.yaml"
      echo "Getting helm values from $NS Namespace";helm get values $Release_Name -o yaml -n $NS  > "$NS/helm_values_$Release_Name.yaml"
    done
#####====================================================================================================================================================#####
echo "creating GZ and zip files"
#####====================================================================================================================================================#####
cd ..

tar -czvf "$DIR"_$(date +%F).tar.gz "$DIR"
zip -r "$DIR".zip "$DIR"
cdir=$PWD
echo "Please attach the zip file or .gz file created in $cdir to the zendesk ticket for reference."
#echo "Timing out for 30 sec for zip file to be present before sending"
#@timeout /t 30
#####====================================================================================================================================================#####
#echo "Sharing the logs via mail for troubleshooting"
#echo "Here are the Platform logs for troubleshooting $Ticket" | mutt -a "$DIR".zip" -a $DIR"_$(date +%F).tar.gz -s "Platform logs for troubleshooting $Ticket" -- $mail
#####====================================================================================================================================================#####
#echo "Here are the Platform logs for troubleshooting $Ticket" | mutt -a "$DIR".zip" -s "Platform logs for troubleshooting $Ticket" -- $mail





    
