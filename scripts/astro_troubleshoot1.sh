NAMESPACE=astronomer
PRISMA=$(kubectl get pods -n $NAMESPACE | grep prisma | head -n1 | awk '{ print $1}')
HOUSTON=$(kubectl get pods -n $NAMESPACE | grep houston | head -n1 | awk '{ print $1}')
COMMANDER=$(kubectl get pods -n $NAMESPACE | grep commander | head -n1 | awk '{ print $1}')
UI=$(kubectl get pods -n $NAMESPACE | grep astro-ui | head -n1 | awk '{ print $1}')
mkdir astronomer-debug
mkdir astronomer-debug/logs
kubectl logs $HOUSTON -n $NAMESPACE > astronomer-debug/logs/houston-logs.txt
kubectl logs $PRISMA -n $NAMESPACE > astronomer-debug/logs/prisma-logs.txt
kubectl logs $COMMANDER -n $NAMESPACE > astronomer-debug/logs/commander-logs.txt
kubectl logs $UI -n $NAMESPACE > astronomer-debug/logs/astro-ui-logs.txt
mkdir astronomer-debug/helm
ASTRONOMER_DEPLOY=$(helm list -a | grep astronomer | head -n1 | awk '{ print $1}')
helm get values -a $ASTRONOMER_DEPLOY  > astronomer-debug/helm/astronomer-values.yaml
mkdir astronomer-debug/kubernetes
kubectl get all -n $ASTRONOMER_DEPLOY > astronomer-debug/kubernetes/kubernetes-resources.yaml
debug_airflow_deployment() {
    mkdir astronomer-debug/airflow
    AIRFLOW_DEPLOY=$1
    AIRFLOW_NAMESPACE=$ASTRONOMER_DEPLOY-$AIRFLOW_DEPLOY
    WEBSERVER=$(kubectl get pods -n $AIRFLOW_NAMESPACE | grep webserver | head -n1 | awk '{ print $1}')
    SCHEDULER=$(kubectl get pods -n $AIRFLOW_NAMESPACE | grep scheduler | head -n1 | awk '{ print $1}')
    kubectl logs $WEBSERVER webserver -n $AIRFLOW_NAMESPACE > astronomer-debug/airflow/webserver.txt
    kubectl logs $SCHEDULER scheduler -n $AIRFLOW_NAMESPACE > astronomer-debug/airflow/scheduler.txt
    kubectl get events -n $AIRFLOW_NAMESPACE > astronomer-debug/airflow/events.txt
}
if [ $# -eq 1 ]
    then
    debug_airflow_deployment $1
fi