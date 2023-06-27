• To resolve the issue immediately, you can just reset Prometheus. This will let you lose the metrics. 

~~~
kubectl scale sts astronomer-prometheus --replicas=0 -n astronomer
kubectl delete pvc data-astronomer-prometheus-0 -n astronomer
kubectl scale sts astronomer-prometheus --replicas=1 -n astronomer
~~~

Also, please reduce the data retention period if you still need to. Please refer [here](https://github.com/nandlalyadav57/astro/blob/main/General/prometheus%20memory%20tuning/oom_fix_general.md)

• Kindly try to [enable-feature=memory-snapshot-on-shutdown](https://prometheus.io/docs/prometheus/latest/feature_flags/#memory-snapshot-on-shutdown). This will reduce the startup time since the memory state can be restored with this snapshot and m-mapped chunks without the need of WAL replay.It will look like [this](https://github.com/nandlalyadav57/astro/blob/main/General/prometheus%20memory%20tuning/2023-06-27_10h18_39.png) under the argument section Prometheus sts.

~~~
prometheus:
  replicas: 2
  resources:
    requests:
      memory: "32Gi"
  persistence:
    size: "200Gi"
  extraFlags:
    - "--enable-feature=memory-snapshot-on-shutdown"
~~~

• Due to some OSS changes, There is a known issue for data ingestions through statsd. We can use the below under statsd to get specific metrics only. Reference: helm values [here](https://github.com/astronomer/airflow-chart/blob/master/values.yaml#L366-L456).
The changes should look like [this](https://github.com/nandlalyadav57/astro/blob/main/General/prometheus%20memory%20tuning/2023-06-27_10h09_27.png) in Houston config map. After Applying the change manually, we should do a rollout restart houston and houston-worker.

~~~
           statsd:
              overrideMappings:
              - labels:
                  operator: Value
                match: airflow.operator_successes_(.*)
                match_type: regex
                name: airflow_operator_successes
              - labels:
                  operator: Value
                match: airflow.operator_failures_(.*)
                match_type: regex
                name: airflow_operator_failures
              - labels:
                  type: counter
                match: airflow.scheduler_heartbeat
                match_type: regex
                name: airflow_scheduler_heartbeat
              - labels: {}
                match: airflow.dag.*.*.duration
                name: airflow_task_duration
              - labels: {}
                match: airflow.dagrun.duration.success.*
                name: airflow_dagrun_duration
              - labels: {}
                match: airflow.dagrun.duration.failed.*
                name: airflow_dagrun_failed
              - labels: {}
                match: airflow.dagrun.schedule_delay.*
                name: airflow_dagrun_schedule_delay
              - labels: {}
                match: airflow.dag_processing.last_runtime.*
                name: airflow_dag_processing_last_runtime
              - labels: {}
                match: airflow.dag_processing.last_run.seconds_ago.*
                name: airflow_dag_processing_last_run_seconds_ago
              - labels:
                  pool: $1
                match: airflow.pool.open_slots.*
                name: airflow_pool_open_slots
              - labels:
                  pool: $1
                match: airflow.pool.used_slots.*
                name: airflow_pool_used_slots
              - labels:
                  pool: $1
                match: airflow.pool.starving_tasks.*
                name: airflow_pool_starving_tasks
              - labels: {}
                match: airflow.zombies_killed
                name: airflow_zombies_killed
              - labels: {}
                match: airflow.executor.running_tasks
                name: airflow_executor_running_tasks
              - labels: {}
                match: airflow.executor.queued_tasks
                name: airflow_executor_queued_tasks
              - labels: {}
                match: airflow.ti_failures
                name: airflow_ti_failures
              - labels: {}
                match: airflow.ti_successes
                name: airflow_ti_successes
              - labels: {}
                match: airflow.dagbag_size
                name: airflow_dagbag_size
              - action: drop
                match: .
                match_type: regex
                name: dropped
~~~
