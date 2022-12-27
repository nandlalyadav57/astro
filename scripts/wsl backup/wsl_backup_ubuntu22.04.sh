#!/bin/bash
timestamp=`date '+%d/%m/%Y %H:%M:%S'`
# Put the name of the astronomer ASTRONOMER_NAMESPACE below
export DIR="/mnt/c/Users/nandl/OneDrive - Astronomer/WSL_Backup/WSL_$(date +"%Y_%m_%d")"
echo "directory path is $DIR"
#echo "====> Your Base Domain is $BASEDOMAIN.This means you should access your Astronomer UI at https://app.$BASEDOMAIN"
#echo "You have specified zendesk ticket numeber as $Ticket & this would be used in the mail subject line."
#echo "Mail would be sent to $mail using mutt & sendmail package in linux.If you don't have the package you can install it else you can simple attach the logs to the ticket."
mkdir -p "$DIR"
chmod -R 777 "$DIR"
###https://stackoverflow.com/questions/589149/bash-script-to-cd-to-directory-with-spaces-in-pathname
cd "$DIR"
#echo "Here are the Windows Subsystem for Linux Distributions:"
# echo "====> Taking Centos8 WSL BACKUP"
# wsl.exe --export CentOS8 CentOS8_$(date +"%Y_%m_%d_%I_%M_%p")
# @timeout /t 60
# echo "====> Taking Ubuntu WSL BACKUP"
# wsl.exe --export Ubuntu Ubuntu_$(date +"%Y_%m_%d_%I_%M_%p")
# @timeout /t 60
echo "====> Taking Ubuntu22.04 WSL BACKUP"
wsl.exe --export Ubuntu-22.04 Ubuntu-22.04_$(date +"%Y_%m_%d")
wait
#@timeout /t 60
#echo "====> Taking Fedora WSL BACKUP"
#wsl.exe --export Fedora35 Fedora35_$(date +"%Y_%m_%d_%I_%M_%p")
# echo "Removing older backups more than 1 day old"
# #Delete files older than 1 day
# ForFiles /p "C:\Users\nandl\OneDrive - Astronomer\WSL_Backup" /s /d -1 /c "cmd /c del /q @file"
# echo [%DATE%] [%TIME%] Done.