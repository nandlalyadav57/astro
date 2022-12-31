#!/bin/bash
timestamp=`date '+%d/%m/%Y %H:%M:%S'`
#export DIR="/tmp"
echo "Enter the path of directory where you want to keep your log files exported:"
read DI
export DIR=$DI/\yaml_backup
export other=other_Files
#####====================================================================================================================================================#####
echo "====> Here is the list of Namespaces found:"
kubectl get namespaces
#echo $DEPLOYMENT_NS1
#echo $Release1
echo "====> The path where logs would be stored is $DIR."
echo "====> cleaning any older $DIR directory to avoid script failure"
rm -rf $DI/\yaml_backup
echo "====> Creating log file directory $DIR."
mkdir -p "$DIR"
chmod -R 777 "$DIR"
###https://stackoverflow.com/questions/589149/bash-script-to-cd-to-directory-with-spaces-in-pathname
cd "$DIR"
mkdir -p "$other"
####creating namespace Directories###
for NS in $(kubectl get ns --no-headers| awk '{print $1}'); do
    echo "creating namespace $NS Directory ";mkdir $NS 
    done
#####====================================================================================================================================================#####
echo "======================Gathering Yaml Backup of all the resources ======================"
for NS in $(kubectl get ns --no-headers| awk '{print $1}'); do
  for pod in $(kubectl get pods --no-headers -n $NS |awk '{ print $1}') ; do
  echo "Taking backup of $pod pod in $NS ";kubectl get pod $pod -o yaml -n $NS > "$NS/pod_$pod.yaml" ; done  
  for service in $(kubectl get services --no-headers -n $NS |awk '{ print $1}') ; do
  echo "Taking backup of $service service in $NS ";kubectl get service $service -o yaml -n $NS > "$NS/svc_$service.yaml" ; done   
  for statefulset in $(kubectl get statefulsets --no-headers -n $NS |awk '{ print $1}') ; do
  echo "Taking backup of $statefulset statefulset in $NS ";kubectl get statefulset  $statefulset  -o yaml -n $NS > "$NS/sts_$statefulset.yaml" ; done   
  for deployment in $(kubectl get deployments --no-headers -n $NS |awk '{ print $1}') ; do
  echo "Taking backup of $deployment deployment in $NS ";kubectl get deployment $deployment -o yaml -n $NS > "$NS/deployment$deployment.yaml" ; done   
  for job in $(kubectl get jobs --no-headers -n $NS |awk '{ print $1}') ; do
  echo "Taking backup of $job job in $NS ";kubectl get job $job -o yaml -n $NS > "$NS/job_$job.yaml" ; done     
  for cronjob in $(kubectl get cronjobs --no-headers -n $NS |awk '{ print $1}') ; do
  echo "Taking backup of $cronjob cronjobs in $NS ";kubectl get cronjob $cronjob -o yaml -n $NS > "$NS/cronjob_$cronjob.yaml" ;done  
  for replicaset in $(kubectl get replicasets --no-headers -n $NS |awk '{ print $1}') ; do
  echo "Taking backup of $replicaset replicasets  in $NS ";kubectl get replicaset $replicaset -o yaml -n $NS > "$NS/RS_$replicaset.yaml" ;done  
  for DaemonSet in $(kubectl get DaemonSets --no-headers -n $NS |awk '{ print $1}') ; do
  echo "Taking backup of $DaemonSet DaemonSets  in $NS ";kubectl get DaemonSet $DaemonSet -o yaml -n $NS > "$NS/Dset_$DaemonSet.yaml" ;done  
  for ConfigMap in $(kubectl get ConfigMaps --no-headers -n $NS |awk '{ print $1}') ; do
  echo "Taking backup of $ConfigMap ConfigMap in $NS ";kubectl get ConfigMap $ConfigMap -o yaml -n $NS > "$NS/CM_$ConfigMap.yaml" ;done  
  for HorizontalPodAutoscaler in $(kubectl get HorizontalPodAutoscalers --no-headers -n $NS |awk '{ print $1}') ; do
  echo "Taking backup of $HorizontalPodAutoscaler HorizontalPodAutoscaler in $NS ";kubectl get HorizontalPodAutoscaler $HorizontalPodAutoscaler -o yaml -n $NS > "$NS/HPA_$HorizontalPodAutoscaler.yaml" ;done  
  for ResourceQuota in $(kubectl get ResourceQuotas --no-headers -n $NS |awk '{ print $1}') ; do
  echo "Taking backup of $ResourceQuota ResourceQuota in $NS ";kubectl get ResourceQuota $ResourceQuota -o yaml -n $NS > "$NS/ResourceQuota_$ResourceQuota.yaml" ;done  
  for LimitRange in $(kubectl get LimitRanges --no-headers -n $NS |awk '{ print $1}') ; do
  echo "Taking backup of $LimitRange LimitRange in $NS ";kubectl get LimitRange $LimitRange -o yaml -n $NS > "$NS/LimitRange_$LimitRange.yaml" ;done  
  for secret in $(kubectl get secrets --no-headers -n $NS |awk '{ print $1}') ; do
  echo "Taking backup of $secret secret  in $NS ";kubectl get secret $secret -o yaml -n $NS > "$NS/secret_$secret.yaml" ;done 
  for SealedSecret in $(kubectl get SealedSecret --no-headers -n $NS |awk '{ print $1}') ; do
  echo "Taking backup of $SealedSecret SealedSecret in $NS ";kubectl get SealedSecret $SealedSecret -o yaml -n $NS > "$NS/Sealedsecret_$SealedSecret.yaml" ;done   
  for PodDisruptionBudget in $(kubectl get PodDisruptionBudgets --no-headers -n $NS |awk '{ print $1}') ; do
  echo "Taking backup of $PodDisruptionBudget podDisruptionBudget in $NS ";kubectl get PodDisruptionBudget $PodDisruptionBudget -o yaml -n $NS > "$NS/PDB_$PodDisruptionBudget.yaml" ;done  
  for Lease in $(kubectl get Lease --no-headers -n $NS |awk '{ print $1}') ; do
  echo "Taking backup of $Lease Lease  in $NS ";kubectl get Lease $Lease -o yaml -n $NS > "$NS/lease_$Lease.yaml" ;done  
  for ingres in $(kubectl get ingres --no-headers -n $NS |awk '{ print $1}') ; do
  echo "Taking backup of $ingres ingres in $NS ";kubectl get ingres $ingres -o yaml -n $NS > "$NS/ingres_$ingres.yaml" ;done  
  for Endpoints in $(kubectl get Endpoints --no-headers -n $NS |awk '{ print $1}') ; do
  echo "Taking backup of $Endpoints Endpoints  in $NS ";kubectl get Endpoints $Endpoints -o yaml -n $NS > "$NS/EP_$Endpoints.yaml" ;done  
  for NetworkPolicy in $(kubectl get NetworkPolicy --no-headers -n $NS |awk '{ print $1}') ; do
  echo "Taking backup of $NetworkPolicy NetworkPolicy  in $NS ";kubectl get NetworkPolicy $NetworkPolicy -o yaml -n $NS > "$NS/NP_$NetworkPolicy.yaml" ;done  
  for PersistentVolumeClaim in $(kubectl get PersistentVolumeClaim --no-headers -n $NS |awk '{ print $1}') ; do
  echo "Taking backup of $PersistentVolumeClaim PersistentVolumeClaim in $NS ";kubectl get PersistentVolumeClaim $PersistentVolumeClaim -o yaml -n $NS > "$NS/PVC_$PersistentVolumeClaim.yaml" ;done  
  for PersistentVolume in $(kubectl get PersistentVolume --no-headers -n $NS |awk '{ print $1}') ; do
  echo "Taking backup of $PersistentVolume PersistentVolume in $NS ";kubectl get PersistentVolume $PersistentVolume -o yaml -n $NS > "$NS/PV_$PersistentVolume.yaml" ;done  
  for StorageClass in $(kubectl get StorageClass --no-headers -n $NS |awk '{ print $1}') ; do
  echo "Taking backup of $StorageClass StorageClass  in $NS ";kubectl get StorageClass $StorageClass -o yaml -n $NS > "$NS/SC_$StorageClass.yaml" ;done  
  for Event in $(kubectl get Event --no-headers -n $NS |awk '{ print $4}'|uniq); do
  echo "Taking backup of $Event Event in $NS ";export X=$(echo $Event|tail -c8);echo value x is $X;kubectl get $Event -o yaml -n $NS > "$NS/Event_$X.yaml";echo "here is the updated size of events exported:";ls -lhtr $NS/* ;done  
  for ServiceAccount in $(kubectl get ServiceAccount --no-headers -n $NS |awk '{ print $1}') ; do
  echo "Taking backup of $ServiceAccount ServiceAccount in $NS ";kubectl get ServiceAccount $ServiceAccount -o yaml -n $NS > "$NS/SA_$ServiceAccount.yaml" ;done  
  for ClusterRole in $(kubectl get ClusterRole --no-headers -n $NS |awk '{ print $1}') ; do
  echo "Taking backup of $ClusterRole ClusterRole in $NS ";kubectl get ClusterRole $ClusterRole -o yaml -n $NS > "$NS/CLUSTERROLE_$ClusterRole.yaml" ;done  
  for Role in $(kubectl get Role --no-headers -n $NS |awk '{ print $1}') ; do
  echo "Taking backup of $Role Role in $NS ";kubectl get Role $Role -o yaml -n $NS > "$NS/ROLE_$Role.yaml" ;done  
  for ClusterRoleBinding in $(kubectl get ClusterRoleBinding --no-headers -n $NS |awk '{ print $1}') ; do
  echo "Taking backup of $ClusterRoleBinding ClusterRoleBinding in $NS ";kubectl get ClusterRoleBinding $ClusterRoleBinding -o yaml -n $NS > "$NS/CRB_$ClusterRoleBinding.yaml" ;done  
  for RoleBinding in $(kubectl get RoleBinding --no-headers -n $NS |awk '{ print $1}') ; do
  echo "Taking backup of $RoleBinding RoleBinding in $NS ";kubectl get RoleBinding $RoleBinding -o yaml -n $NS > "$NS/RB_$RoleBinding.yaml" ;done  
  for Application in $(kubectl get Application --no-headers -n $NS |awk '{ print $1}') ; do
  echo "Taking backup of $Application Application in $NS ";kubectl get Application $Application -o yaml -n $NS > "$NS/Application_$Application.yaml" ;done  
  for AppProject in $(kubectl get AppProject --no-headers -n $NS |awk '{ print $1}') ; do
  echo "Taking backup of $AppProject AppProject in $NS ";kubectl get AppProject $AppProject -o yaml -n $NS > "$NS/AppProject_$AppProject.yaml" ;done  
  for Alertmanager in $(kubectl get Alertmanager --no-headers -n $NS |awk '{ print $1}') ; do
  echo "Taking backup of $Alertmanager Alertmanager in $NS ";kubectl get Alertmanager $Alertmanager -o yaml -n $NS > "$NS/Alert_Manager_$Alertmanager.yaml" ;done  
  for Prometheus in $(kubectl get Prometheus --no-headers -n $NS |awk '{ print $1}') ; do
  echo "Taking backup of $Prometheus Prometheus in $NS ";kubectl get Prometheus $Prometheus -o yaml -n $NS > "$NS/PROM_$Prometheus.yaml" ;done  
  for PrometheusRule in $(kubectl get PrometheusRule --no-headers -n $NS |awk '{ print $1}') ; do
  echo "Taking backup of $PrometheusRule PrometheusRule in $NS ";kubectl get PrometheusRule $PrometheusRule -o yaml -n $NS > "$NS/PromRule_$PrometheusRule.yaml" ;done  
  for ServiceMonitor in $(kubectl get ServiceMonitor --no-headers -n $NS |awk '{ print $1}') ; do
  echo "Taking backup of $ServiceMonitor ServiceMonitor  in $NS ";kubectl get ServiceMonitor $ServiceMonitor -o yaml -n $NS > "$NS/ServiceMonitor_$ServiceMonitor.yaml" ;done  
  for EnvoyFilter in $(kubectl get EnvoyFilter --no-headers -n $NS |awk '{ print $1}') ; do
  echo "Taking backup of $EnvoyFilter EnvoyFilter in $NS ";kubectl get EnvoyFilter $EnvoyFilter -o yaml -n $NS > "$NS/EnvoyFilter_$EnvoyFilter.yaml" ;done  
  for Gateway in $(kubectl get Gateway --no-headers -n $NS |awk '{ print $1}') ; do
  echo "Taking backup of $Gateway Gateway in $NS ";kubectl get Gateway $Gateway -o yaml -n $NS > "$NS/Gateway_$Gateway.yaml" ;done  
  for VirtualService in $(kubectl get VirtualService --no-headers -n $NS |awk '{ print $1}') ; do
  echo "Taking backup of $VirtualService VirtualService  in $NS ";kubectl get VirtualService $VirtualService -o yaml -n $NS > "$NS/VS_$VirtualService.yaml" ;done  
  echo "Removing 0 KB files";echo "here are 0 KB files:";find . -type f -size 0;find . -type f -size 0 | xargs rm -rf; 
done



# echo "======================Gathering Describe output of all the nodes======================"
# for NODE in $(kubectl get nodes --no-headers |awk '{ print $1}') ; do
#     echo "Collecting Describe output of Node $NODE ";kubectl describe nodes $NODE > "$other/DESCRIBE_$NODE.log"
# done

echo "======================Collecting CustomResource Backup in $other Namespace ======================"
for IPAMBlock in $(kubectl get IPAMBlock --no-headers |awk '{ print $1}') ; do
echo "Taking backup of $IPAMBlock IPAMBlock ";kubectl get IPAMBlock $IPAMBlock -o yaml  > "$other/IPAMBlock_$IPAMBlock.yaml";done  
for IPPool in $(kubectl get IPPool --no-headers |awk '{ print $1}') ; do
echo "Taking backup of $IPPool IPPool  ";kubectl get IPPool $IPPool -o yaml  > "$other/IPPool_$IPPool.yaml" ;done   
for IPAMHandle in $(kubectl get IPAMHandle --no-headers |awk '{ print $1}') ; do
echo "Taking backup of $IPAMHandle IPAMHandle";kubectl get IPAMHandle $IPAMHandle -o yaml  > "$other/IPAMHandle_$IPAMHandle.yaml";done    
for KubeControllersConfiguration in $(kubectl get KubeControllersConfiguration --no-headers |awk '{ print $1}') ; do
echo "Taking backup of $KubeControllersConfiguration KubeControllersConfiguration";kubectl get KubeControllersConfiguration $KubeControllersConfiguration -o yaml  > "$other/KubeControllersConfiguration_$KubeControllersConfiguration.yaml";done    
for VolumeSnapshotClass in $(kubectl get VolumeSnapshotClass --no-headers |awk '{ print $1}') ; do
echo "Taking backup of $VolumeSnapshotClass VolumeSnapshotClass  ";kubectl get VolumeSnapshotClass $VolumeSnapshotClass -o yaml  > "$other/VolumeSnapshotClass_$VolumeSnapshotClass.yaml" ;done   
for PriorityClass in $(kubectl get PriorityClass --no-headers |awk '{ print $1}') ; do
echo "Taking backup of $PriorityClass PriorityClass";kubectl get PriorityClass $PriorityClass -o yaml  > "$other/PriorityClass_PriorityClass_$PriorityClass_PriorityClass.yaml" ;done   
for ClusterInformation in $(kubectl get ClusterInformation --no-headers |awk '{ print $1}') ; do
echo "Taking backup of $ClusterInformation ClusterInformation";kubectl get ClusterInformation $ClusterInformation -o yaml  > "$other/CLUSTERINFO_$ClusterInformation.yaml";done    
for HostEndpoint in $(kubectl get HostEndpoint --no-headers |awk '{ print $1}') ; do
echo "Taking backup of $HostEndpoint HostEndpoint  ";kubectl get HostEndpoint $HostEndpoint -o yaml  > "$other/Host_EP_$HostEndpoint.yaml";done    
for Namespace in $(kubectl get Namespace --no-headers -n $NS |awk '{ print $1}') ; do
echo "Taking backup of $Namespace Namespace in $NS ";kubectl get Namespace $Namespace -o yaml -n $NS > "$other/Namespace_$Namespace.yaml" ;done  

#####====================================================================================================================================================#####
echo "======================creating GZ and zip files======================"
#####====================================================================================================================================================#####
cd "$DIR"
cd ..
#tar -czvf "yaml_backup"_$(date +"%Y_%m_%d_%I_%M_%p").tar.gz "$DIR"
zip -r "yaml_backup"_$(date +"%Y_%m_%d_%I_%M_%p").zip "$DIR"
cdir=$PWD
echo "Here is the list of files created:"
ls -lhtr $DIR/*
ls -lhtr $DIR/$other/*
ls -lhtr
echo "You may use zip file or .gz file created in $cdir for future reference."
#echo "Timing out for 30 sec for zip file to be present before sending"
#@timeout /t 30
#####====================================================================================================================================================#####
#echo "Sharing the logs via mail for troubleshooting"
#echo "Here are the Platform logs for troubleshooting $Ticket" | mutt -a "$DIR".zip" -a $DIR"_$(date +%F).tar.gz -s "Platform logs for troubleshooting $Ticket" -- $mail
#####====================================================================================================================================================#####
#echo "Here are the Platform logs for troubleshooting $Ticket" | mutt -a "$DIR".zip" -s "Platform logs for troubleshooting $Ticket" -- $mail
