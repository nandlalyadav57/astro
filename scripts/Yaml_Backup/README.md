# Take YAML Backup of ALL Resources

This is going to take backup of all the resources (mostly covered in the script) in YAML format.
The backup would be taken in the respective namespace directories.
For the resources which are not specific to namespaces they would be kept in Other_Files folder.
Usage:
sh backup_all_ns.sh > /dev/stdin > /tmp/scriptlog_$(date +"%Y_%m_%d_%I_%M_%p").log
The script will ask the location where you want to take backup:
e.g.
~~~
sh backup_all_ns.sh > /dev/stdin > /tmp/scriptlog_$(date +"%Y_%m_%d_%I_%M_%p").log
~~~
~~~
Enter the path of directory where you want to keep your log files exported:
/tmp