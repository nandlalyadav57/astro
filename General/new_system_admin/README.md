
Please note you can either follow ---> **step 1 to 6** or simply run the command just above **step 7**  (preferbale & takes less time)

• The difference would be we will spin a pod manually in step 1 to 6 and pass a string to connect database in those steps.

• The alternate method which is single line command just does similar by spinning up a different pssql pod using bitnami/postgresql image.


Here is the list of commands you need to run:-

1:- Set cluster context:

~~~
 kubectl config set-context --current --namespace=<astronomer namespace>
~~~

2:- Get the database access string and keep it:

~~~
kubectl get secret astronomer-bootstrap -o jsonpath='{.data.connection}' | base64 -d
~~~

3:- Create a new Pod:

~~~
kubectl apply -f https://raw.githubusercontent.com/nandlalyadav57/astro/main/new_pod.yml
~~~

4: Access pod for db connection:

~~~
kubectl exec -it postgres-client -- sh
~~~

5:- Add postgresql client:

~~~
apt update && apt install postgresql-client
~~~

6:- Access database:

~~~
psql <string from step 2>
~~~


You Can also simply use this command to skip steps 1 to 6 :


```kubectl run psql --rm -it --restart=Never --namespace astronomer --image bitnami/postgresql --command -- psql $(kubectl get secret -n astronomer astronomer-houston-backend --template='' | sed 's/?.*//g')```


7:- Access the Houston database:

~~~
\l  (to list databases)
~~~

~~~
\c <releasename>_houston
~~~

8:- Set search path to see everything:

~~~
set search_path="houston$default";
~~~

*******************************************************************************************
****Database Changes****  
*******************************************************************************************

9:-  Find the user you want:

~~~
SELECT id FROM "User" where username = '<email address you want to be admin>';
~~~

10:-  Find the System Admin role binding:

~~~
SELECT id FROM "RoleBinding" WHERE role = 'SYSTEM_ADMIN';
~~~

(If there is more than one, simply use the first one)

11:- Update the System Admin role binding to the user you found in steps 9 and step 10:

~~~
UPDATE "RoleBinding" SET "userId" = '<id from step 9>' WHERE "id" = '<id from step 10>';
~~~
*******************************************************************************************
****Exit****
*******************************************************************************************
12:- Exit Postgres:

~~~
\q
~~~
13:- Exit the Pod:

~~~
exit
~~~
14:- Remove the Postgres-client pod

~~~
kubectl delete -f https://raw.githubusercontent.com/nandlalyadav57/astro/main/new_pod.yml
kubectl delete pod pssql -n astronomer
~~~

