
Please note you can either follow ---> **step 1 to 6** or simply run the command just above **step 7**  (preferbale & takes less time).  

•  we will spin a pod manually in step 1 to 6 and pass a string from the secret to connect to database.

• The other method which is single line command just does similar thing by spinning up a different pssql pod using bitnami/postgresql image.


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

**Skip steps 1 to 6 & Simply run below command:**

~~~
kubectl run psql --rm -it --restart=Never --namespace astronomer --image bitnami/postgresql --command -- psql $(kubectl get secret -n astronomer astronomer-houston-backend --template='' | sed 's/?.*//g')```
~~~


7:- Access the Houston database:

~~~
\l  (to list databases)
~~~

example:

~~~
=> \l
                                               List of databases
                Name                 |  Owner   | Encoding |   Collate   |    Ctype    |   Access privileges
-------------------------------------+----------+----------+-------------+-------------+-----------------------
 astronomer_grafana                  | airflow  | UTF8     | en_US.UTF-8 | en_US.UTF-8 |
 astronomer_houston                  | airflow  | UTF8     | en_US.UTF-8 | en_US.UTF-8 |
 postgres                            | airflow  | UTF8     | en_US.UTF-8 | en_US.UTF-8 |
 rdsadmin                            | rdsadmin | UTF8     | en_US.UTF-8 | en_US.UTF-8 | rdsadmin=CTc/rdsadmin
 template0                           | rdsadmin | UTF8     | en_US.UTF-8 | en_US.UTF-8 | =c/rdsadmin          +
                                     |          |          |             |             | rdsadmin=CTc/rdsadmin
 template1                           | airflow  | UTF8     | en_US.UTF-8 | en_US.UTF-8 | =c/airflow           +
                                     |          |          |             |             | airflow=CTc/airflow
 traditional_precession_8767_airflow | airflow  | UTF8     | en_US.UTF-8 | en_US.UTF-8 |
(7 rows)

~~~

~~~
\c <releasename>_houston
~~~

example: ```\c astronomer_houston```


8:- Set search path to see everything:

~~~
set search_path="houston$default";
~~~

*******************************************************************************************
****Database Changes****  
*******************************************************************************************

9:-  Find the user you want:

~~~
SELECT * FROM "User" where username = '<email address you want to send invitation to>';
~~~

examples:   ```SELECT * FROM "User" where username ='nandlalyadav57@gmail.com';```


~~~

astronomer_houston=> SELECT * FROM "User" where username ='nandlalyadav57@gmail.com';
            id             |         username         | status  | fullName | avatarUrl | localCredentialId |        createdAt        |        updatedAt        |   token   |  source

---------------------------+--------------------------+---------+----------+-----------+-------------------+-------------------------+-------------------------+-----------+---------
--
 cl2cwyedp21056ok6nmsafp1i | nandlalyadav57@gmail.com | pending |          |           |                   | 2022-04-24 06:32:37.454 | 2022-04-24 06:32:37.454 | 9xFWYfT86 | WORKSPAC
E
(1 row)
~~~


10:-  Copy the token from step 10 and replace the below URL:

~~~
https://app.<baseurl>/signup?token=<copy token entry from above step >
~~~

example: ```https://app.nandlal57.astro-cre.com/signup?token=9xFWYfT86```



11:- Send the Required invite link from above step 10 to the user

You can see the last 2nd last field will be blank if the token is accepted 

~~~
astronomer_houston=> SELECT * FROM "User" where username = 'nandlal.yadav@astronomer.io';
            id             |          username           | status |   fullName    |                                       avatarUrl
      | localCredentialId |        createdAt        |        updatedAt        | token | source
---------------------------+-----------------------------+--------+---------------+----------------------------------------------------------------------------------
------+-------------------+-------------------------+-------------------------+-------+--------
 cl7ppouwk001114gzaps4skgf | nandlal.yadav@astronomer.io | active | Nandlal Yadav | https://lh3.googleusercontent.com/a/ALm5wu1uQaIyffDB3iJ3XqXoD0pGCwy0z5kAXjMjvqKz=
s96-c |                   | 2022-09-06 04:48:46.964 | 2022-11-12 03:28:55.063 |       |

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

