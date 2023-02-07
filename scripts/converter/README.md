# Short intro

If K8s was upgraded to version 1.22 but Airflow chart is < 1.0 - deployment could be counted as partially broken.

# Solution

1. Save convertor.py file to your local system or share with customer.

2. Add execution bit to file by command: `chmod u+x convertor.py`.

3. Export helm values for broken deployment (chart version is <1.0) into a file.

4. Define shebang in script.

5. Run comman: `convertor.py <deployment values yaml file> <deployment name> > <new deployment yaml file>`.

6. Save last helm secret to a file.

7. Delete all helm secrets from release namespace

8. Apply new file on your broken deployment via `helm upgrade --install`.
