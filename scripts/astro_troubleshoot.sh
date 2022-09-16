export NAMESPACE=astronomer
export HOUSTON1=$(kubectl get pods -n $NAMESPACE | grep houston | head -n1 | awk '{ print $1}')
export HOUSTON2=$(kubectl get pods -n $NAMESPACE | grep houston | head -n1 | awk '{ print $2}')
export COMMANDER=$(kubectl get pods -n $NAMESPACE | grep commander | head -n1 | awk '{ print $1}')
export UI=$(kubectl get pods -n $NAMESPACE | grep astro-ui | head -n1 | awk '{ print $1}')
mkdir -p /tmp/astronomer-debug/
mkdir -p /tmp/astronomer-debug/logs/
kubectl logs $HOUSTON1 -n $NAMESPACE > /tmp/astronomer-debug/logs/houston1-logs.txt
kubectl logs $HOUSTON2 -n $NAMESPACE > /tmp/astronomer-debug/logs/houston2-logs.txt
kubectl logs $COMMANDER -n $NAMESPACE > /tmp/astronomer-debug/logs/commander-logs.txt
kubectl logs $UI -n $NAMESPACE > /tmp/astronomer-debug/logs/astro-ui-logs.txt


mkdir /tmp/astronomer-debug/helm
ASTRONOMER_DEPLOY=$(helm list -a | grep astronomer | head -n1 | awk '{ print $1}')
helm get values -a $ASTRONOMER_DEPLOY  > /tmp/astronomer-debug/helm/astronomer-values.yaml

mkdir /tmp/astronomer-debug/kubernetes
kubectl get all -n $ASTRONOMER_DEPLOY > /tmp/astronomer-debug/kubernetes/kubernetes-resources.yaml

debug_airflow_deployment() {
    mkdir /tmp/astronomer-debug/airflow
    AIRFLOW_DEPLOY=$1
    AIRFLOW_NAMESPACE=$ASTRONOMER_DEPLOY-$AIRFLOW_DEPLOY
    WEBSERVER=$(kubectl get pods -n $AIRFLOW_NAMESPACE | grep webserver | head -n1 | awk '{ print $1}')
    SCHEDULER=$(kubectl get pods -n $AIRFLOW_NAMESPACE | grep scheduler | head -n1 | awk '{ print $1}')
    kubectl logs $WEBSERVER webserver -n $AIRFLOW_NAMESPACE > /tmp/astronomer-debug/airflow/webserver.txt
    kubectl logs $SCHEDULER scheduler -n $AIRFLOW_NAMESPACE > /tmp/astronomer-debug/airflow/scheduler.txt
    kubectl get events -n $AIRFLOW_NAMESPACE > /tmp/astronomer-debug/airflow/events.txt
    WORKERS=(`kubectl get pods -n $AIRFLOW_NAMESPACE | grep worker | awk '{ print $1}'`)
    echo "workers are"  $WORKERS
    for i in "${WORKERS[@]}"
    do
        echo "writing logs for $i"
        kubectl logs $i worker > /tmp/astronomer-debug/airflow/$i.txt
    done
}

if [ $# -eq 1 ]
    then
    debug_airflow_deployment $1
fi