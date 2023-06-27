

We can attempt to change the liveness readiness probe & see if helps but if it's still getting OOM killed then we may have to try increasing resources first. It has been observed in the past as things grow and Prometheus's workload becomes larger. 
If it's getting OOMKilled before & has a chance to fully start, you'll want to raise the memory limit
To increase it, please alter the values for Prometheus here to higher memory

Get your current helm values:

~~~ 
helm -n astronomer get values astronomer -o yaml > values.yaml​
~~~ 

Open values.YAML in a text editor and find the existing Prometheus config block & try increasing the resources:

~~~ 
prometheus:
  resources:
    limits:
      cpu: 2
      memory: 8Gi
    requests:
      cpu: 1
      memory: 4Gi
~~~ 

Update the values:

~~~ 
helm -n astronomer upgrade astronomer astronomer/astronomer --version=<current astronomer version> -f values.yaml​
~~~ 

One more Scenario could be that WAL files in Prometheus get large enough that the Prometheus pod gets restarted due to an Out of Memory condition and on startup & it takes too long to come back before being restarted
In case we don't need to preserve the metric data then, We may also proceed to provision a new volume for Prometheus by using below:

~~~   
kubectl scale sts astronomer-prometheus --replicas=0 -n astronomer
~~~ 

~~~ 
kubectl delete pvc data-astronomer-prometheus-0 -n astronomer
~~~ 

~~~ 
kubectl scale sts astronomer-prometheus --replicas=1 -n astronomer
~~~ 


If you find the amount of WAL data too large for the limits set you can lower the retention period by adding the following to your helm values and doing a helm upgrade:

~~~ 
prometheus:
  retention: 15d
~~~


For modifying resources and retention both at once we may use like this:

~~~
  prometheus:
  resources:
    limits:
      cpu: 2
      memory: 12Gi
    requests:
      cpu: 2
      memory: 8Gi
  retention: 7d
  ~~~
