#!/bin/bash
timestamp=`date '+%d/%m/%Y %H:%M:%S'`
# Put the name of the astronomer ASTRONOMER_NAMESPACE below
echo "switch to required namespace if not do now kubens namespacename"
export ASTRONOMER_NAMESPACE=$(kubectl config view --minify -o jsonpath='{..namespace}')
export ASTRONOMER_RELEASE=$(echo $ASTRONOMER_NAMESPACE| cut -c 12-)
export DIR="/tmp/gen1_logs"
#export BASEDOMAIN=nandlal51.astro-cre.com 
#echo "Enter the Primary Namespace where you want to collect All the important Infrastructure logs"
#read ASTRONOMER_NAMESPACE
#echo "Enter the path of directory where you want to keep your log files exported:"
#read DI
#export DIR=$DI/\astro_logs

echo "====> cleaning any older $DIR directory to avoid script failure"
rm -rf /tmp/gen1_logs
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
for NS in $(kubectl get ns --no-headers| awk '{print $1}'|grep $ASTRONOMER_NAMESPACE); do
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
      # echo "Number of digits to trim while getting release name";export X=$(echo $ASTRONOMER_NAMESPACE|wc -m);echo "VALUE to be increased by 1 for trimming is $X in $NS";export Y=$(($X+1)); echo "Number of digits to be trimmed while getting release name is $Y in $NS"
      echo "Exporting Release name ";export Release_Name=$(echo $NS| cut -c 12-)
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

















####Gathering All the $ASTRONOMER_NAMESPACE logs###
echo "======================Gathering All the Deployment logs in $ASTRONOMER_NAMESPACE namespace logs======================"


echo "======================Gathering logs of All the pods ======================"
for NS in $(kubectl get deployments --no-headers| awk '{print $1}'); 
do
  for DEPLOYMENT in $(kubectl get deployments --no-headers -n $NS |awk '{ print $1}') ; do
    export POD=$DEPLOYMENT;echo "Starting to Collect log of the DEPLOYMENT $DEPLOYMENT in $NS namespace";for deployment_name in $(kubectl get pods $DEPLOYMENT -o jsonpath='{.spec.containers[*].name}' -n $NS|awk '{NF-=0; OFS="\n"; $1=$1}1' | sort);do
    echo Collecting log of the Deployment $deployment_name in deployment $DEPLOYMENT in the $NS namespace now;kubectl logs deployment/$DEPLOYMENT -n $NS > "$NS/$DEPLOYMENT.log"  
    done
done
done




echo "======================Gathering Describe output of Bad state pod======================"
for NS in $(kubectl get ns --no-headers| awk '{print $1}'); 
do
  for BAD_POD in $(kubectl get pods --no-headers -n $NS |grep -v Running|grep -v Completed|awk '{ print $1}') ; do
    export BAD_POD=$BAD_POD;echo $BAD_POD pod is in bad state;echo "Collecting Describe output of bad state pod $BAD_POD in $NS Namespace ";kubectl describe pod $BAD_POD  > "$NS/$BAD_POD-DescribeBADPOD_$NS.log" -n $NS   
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


# echo "======================Gathering logs of All the pods ======================"
# for NS in $(kubectl get ns --no-headers| awk '{print $1}'); 
# do
#   for POD in $(kubectl get pods --no-headers -n $NS |awk '{ print $1}') ; do
#     export POD=$POD;echo "Starting to Collect log of the pod $POD in $NS namespace";for container_name in $(kubectl get pods $POD -o jsonpath='{.spec.containers[*].name}' -n $NS|awk '{NF-=0; OFS="\n"; $1=$1}1' | sort);do
#     echo Collecting log of the container $container_name in pod $POD in the $NS namespace now;kubectl logs $POD -n $NS -c $container_name > "$NS/AllPodlogs/$POD-pod_$container_name-container.log"  
#     done
# done
# done




#####====================================================================================================================================================#####
####Gathering Describe output of all the Nodes
echo "======================Gathering Describe output of all the nodes======================"
for NODE in $(kubectl get nodes --no-headers |awk '{ print $1}') ; do
    echo "Collecting Describe output of Node $NODE ";kubectl describe nodes $NODE > "$ASTRONOMER_NAMESPACE/DESCRIBE_$NODE.log"
done
#####==================================================================================================================================================#####
#####====================================================================================================================================================#####
echo "======================creating GZ and zip files======================"
#####====================================================================================================================================================#####
cd "$DIR"
cd ..
tar -czvf "gen1_logs"_$(date +"%Y_%m_%d_%I_%M_%p").tar.gz "$DIR"
zip -r "gen1_logs"_$(date +"%Y_%m_%d_%I_%M_%p").zip "$DIR"
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


