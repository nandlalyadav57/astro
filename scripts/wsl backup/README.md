## WSL Backup Job for Windows

#### Significance: 
WSL instances are easy to set up, but without a backup, you'll have to redo everything manually if something goes wrong. WSL backups are also an easy way to transfer your environment between machines


This script can help you to take regular backups as per your need using task scheduler.Just import the task and make sure those files are kept at right location:


• wsl_backup_start.bat

• wsl_backup_start.ps1


__________________________________________________________________________________________________________________

![image](https://user-images.githubusercontent.com/33649510/209679729-6b33f9bb-56c9-489f-a81b-289a1568530d.png)
__________________________________________________________________________________________________________________


~~~
C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -File "C:\Users\nandl\OneDrive - Astronomer\scripts\wsl_backup_start.ps1"
~~~


Here I took 3 WSL's backup

![image](https://user-images.githubusercontent.com/33649510/209679889-c31d99ff-0f7e-405e-8c24-383b5a4144b4.png)

Below Log files can be followed during script execution.They can help you to troubleshoot for any errors.

![image](https://user-images.githubusercontent.com/33649510/209680338-47017cd4-539e-4a7d-be85-8b8f28cfbb71.png)
