#!/bin/bash
timestamp=`date '+%d/%m/%Y %H:%M:%S'`
# Put the name of the astronomer ASTRONOMER_NAMESPACE below
export ASTRONOMER_NAMESPACE=$(kubectl config view --minify -o jsonpath='{..namespace}')
export DIR="/tmp/ASTRO_$(date +"%Y_%m_%d")"
#export BASEDOMAIN=nandlal51.astro-cre.com 
#secho "Enter your Astronomer Namespace Name if it's not set already in context else press enter:"
#read ASTRONOMER_NAMESPACE
#echo "Enter the path of directory where you want to keep your log files exported:"
#read DI
#export DIR=$DI/\astro_logs


#Get Astronomer Release name
#export ASTRONOMER_RELEASE=$(helm ls -A|grep -i "$ASTRONOMER_NAMESPACE"|head -n1 | awk '{ print $1}')
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
#echo "====> Your astronomer release name is $ASTRONOMER_RELEASE."
#echo $DEPLOYMENT_NS1
#echo $Release1
echo "====> The path where logs would be stored is $DIR."
#echo "====> Your Base Domain is $BASEDOMAIN.This means you should access your Astronomer UI at https://app.$BASEDOMAIN"
#echo "You have specified zendesk ticket numeber as $Ticket & this would be used in the mail subject line."
#echo "Mail would be sent to $mail using mutt & sendmail package in linux.If you don't have the package you can install it else you can simple attach the logs to the ticket."
#####====================================================================================================================================================#####
echo "====> cleaning any older $DIR directory to avoid script failure"
rm -rf $DIR
echo "====> Creating log file directory $DIR."
mkdir -p "$DIR"
chmod -R 777 "$DIR"
###https://stackoverflow.com/questions/589149/bash-script-to-cd-to-directory-with-spaces-in-pathname
cd "$DIR"
####creating namespace Directories###
for NS in $(kubectl get ns --no-headers| awk '{print $1}'); do
    echo "creating namespace $NS";mkdir $NS
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




####Gathering All the Deployment namespace logs###
for NS in $(kubectl get ns --no-headers|grep -i "$ASTRONOMER_NAMESPACE" | awk '{print $1}'); do

echo "======================Collecting Some General enviornment Information in the $NS======================"
      echo "creating $ASTRONOMER_NAMESPACE/Nodes Directory ";mkdir -p $ASTRONOMER_NAMESPACE/Nodes
      echo "Gathering get all status  in $NS Namespace";kubectl get all > "$NS/getall_status_$NS.log" -n $NS
      echo "Gathering All replica status in all namespaces";kubectl get rs -n $NS|grep -v '0         0         0' > "$NS/rs_status_all_namespaces.log"
      echo "Gathering Pod Running status in $NS Namespace";kubectl get pods -o wide > "$NS/pods_$NS.log" -n $NS
      echo "Gathering events in $NS Namespace ";kubectl get events > "$NS/events_$NS.log" -n $NS
      echo "Gathering events in $NS Namespace ";kubectl get events --sort-by=.metadata.creationTimestamp ${1:+"$1"} ${2:+"$2"} > "$NS/events_sortedbyTimestamp_$NS.log" -n $NS
      echo "Gathering events in $NS Namespace ";kubectl get nodes -o custom-columns="Name:metadata.name,STATUS:status.conditions[-1].type,NODE TYPE:metadata.labels.beta\.kubernetes\.io/instance-type,NODE POOL:metadata.labels.eks\.amazonaws\.com/nodegroup,ProviderID:.spec.providerID" > "$ASTRONOMER_NAMESPACE/Nodes/NODE_POOL_$NS.log" -n $NS
  #    echo "Gathering secrets in $NS Namespace ";kubectl get secrets > "$NS/secrets_$NS.log" -n $NS
      echo "Gathering sevice Status in $NS Namespace ";kubectl get svc > "$NS/svc_$NS.log" -n $NS
      echo "Gathering persistent volume Status in $NS Namespace ";kubectl get pvc > "$NS/pvc_$NS.log" -n $NS
      echo "Gathering ingress Status in $NS Namespace ";kubectl get ingress > "$NS/ingress_$NS.log" -n $NS
 #     echo "Gathering cronjobs Status in $NS Namespace ";kubectl get cronjobs > "$NS/cronjobs_$NS.log" -n $NS
      echo "Gathering jobs Status in $NS Namespace ";kubectl get jobs > "$NS/jobs_NS.log" -n $NS

echo "======================Gathering All the Deployment namespace logs in the $NS======================"
      echo "Gathering logs of scheduler in $NS Namespace ";kubectl logs deployment/$ASTRONOMER_NAMESPACE-scheduler -c scheduler > "$NS/Dep_scheduler_$NS.log" -n $NS  
      echo "Gathering logs of worker in $NS Namespace ";kubectl logs deployment/$ASTRONOMER_NAMESPACE-worker-default -c worker > "$NS/Dep_worker_$NS.log" -n $NS
      echo "Gathering logs of webserverin $NS Namespace ";kubectl logs deployment/$ASTRONOMER_NAMESPACE-webserver -c webserver > "$NS/Dep_webserver$NS.log" -n $NS
      echo "Gathering logs of triggerer in $NS Namespace ";kubectl logs deployment/$ASTRONOMER_NAMESPACE-triggerer -c triggerer > "$NS/Dep_triggerer $NS.log" -n $NS
      echo "Gathering logs of pgbouncer in $NS Namespace "Release_Name-pgbouncer -c pgbouncer > "$NS/Dep_pgbouncer _$NS.log" -n $NS    
 #     echo "Gathering logs of flower  in $NS Namespace ";kubectl logs deployment/$ASTRONOMER_NAMESPACE-flower -c flower > "$NS/flower _$NS.log" -n $NS
      echo "Gathering logs of statsd in $NS Namespace ";kubectl logs deployment/$ASTRONOMER_NAMESPACE-statsd -c statsd > "$NS/Dep_statsd_$NS.log" -n $NS
      echo "Gathering logs of redis in $NS Namespace ";kubectl logs sts/$ASTRONOMER_NAMESPACE-redis -c redis > "$NS/Dep_redis_$NS.log" -n $NS 


echo "======================Gathering Describe output pods in $ASTRONOMER_NAMESPACE======================"
for NS in $(kubectl get ns --no-headers|grep -i "$ASTRONOMER_NAMESPACE" | awk '{print $1}'); 
do
  for POD in $(kubectl get pods --no-headers -n $NS |awk '{ print $1}') ; do
    export POD=$POD;echo "Collecting Describe output of pod $POD in $NS Namespace ";kubectl describe pod $POD  > "$NS/Describe_$POD-Pod_$NS.log" -n $NS   
    done
done

done


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



#####====================================================================================================================================================#####
####Gathering Describe output of all the Nodes
echo "======================Gathering Describe output of all the nodes======================"
for NODE in $(kubectl get nodes --no-headers |awk '{ print $1}') ; do
    echo "Collecting Describe output of Node $NODE ";kubectl describe nodes $NODE > "$ASTRONOMER_NAMESPACE/Nodes/DESCRIBE_$NODE.log"
done
#####==================================================================================================================================================#####
####Gathering All the $ASTRONOMER_NAMESPACE logs###




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
