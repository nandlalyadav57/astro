
helm ls -A


  (Take Backup)

helm get values astronomer -n astronomer -o yaml > value.yaml



Perform Upgrade


helm upgrade -f value.yaml  --reuse-values astronomer astronomer/astronomer --version=<platform version> --debug --set astronomer.houston.upgradeDeployments.enabled=false --timeout=20m -n astronomer