Implementation:

kubectl apply -f cron-job.yaml
kubectl get cronjob -n metricgaming-test
kubectl config set-context --current --namespace=metricgaming-test
kubectl apply -f nginx_deployment.yaml

Rollback:

kubectl delete -f cron-job.yaml
kubectl delete -f nginx_deployment.yaml

Test Case:

kubectl config set-context --current --namespace=metricgaming-test
kubectl apply -f nginx_deployment.yaml
deployment.apps/nginx-deployment created



apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-deployment
  labels:
    app: nginx
spec:
  replicas: 3
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
      - name: nginx
        image: nginx:1.14.2
        ports:
        - containerPort: 80





kubectl apply -f cron-job.yaml
serviceaccount/restart-nginx-deployment created
role.rbac.authorization.k8s.io/restart-nginx-deployment created
rolebinding.rbac.authorization.k8s.io/restart-nginx-deployment created
cronjob.batch/restart-nginx-deployment created









# Create file cron-job.yaml
---
kind: ServiceAccount
apiVersion: v1
metadata:
  name: restart-nginx-deployment
  namespace: metricgaming-test

---
apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
  name: restart-nginx-deployment
  namespace: metricgaming-test
rules:
  - apiGroups: ["apps", "extensions"]
    resources: ["deployments"]
    resourceNames: ["nginx-deployment"]
    verbs: ["get", "patch"]

---
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  name: restart-nginx-deployment
  namespace: metricgaming-test
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: Role
  name: restart-nginx-deployment
subjects:
  - kind: ServiceAccount
    name: restart-nginx-deployment
    namespace: metricgaming-test
---
apiVersion: batch/v1beta1
kind: CronJob
metadata:
  name: restart-nginx-deployment
  namespace: metricgaming-test
spec:
  concurrencyPolicy: Forbid # Do not run concurrently!
  schedule: '*/5 * * * *'     # At every 5th minute
  jobTemplate:
    spec:
      backoffLimit: 2 
      activeDeadlineSeconds: 600 
      template:
        spec:
          serviceAccountName: restart-nginx-deployment # Run under the service account created above
          restartPolicy: Never
          containers:
            - name: kubectl
              image: raspbernetes/kubectl # Specify the kubectl image
              command: # The kubectl command to execute
                - 'kubectl'
                - 'rollout'
                - 'restart'
                - 'deployment/nginx-deployment'
# kubectl apply -f cron-job.yaml
# kubectl get cronjob -n metricgaming-test



Manually triggered cronjob:





Cronjob ran after 5 minutes:


