@echo off 
title=Starting WSL backup
set mydate=%date:~6,4%%date:~3,2%%date:~0,2%
echo "Here are the Windows Subsystem for Linux Distributions:"
wsl --list -v| sort /+4
echo "Stopping LxssManager to make sure all wsl's are running"
NET STOP LxssManager 
@timeout /t 05
echo "Status after service stop"
wsl --list -v| sort /+4
echo "stopping them:"
wsl --shutdown Ubuntu
@timeout /t 05
wsl -t Ubuntu
@timeout /t 05
wsl --shutdown Ubuntu-22.04 
@timeout /t 05
wsl --shutdown CentOS8
@timeout /t 10
echo "Current status:"
wsl --list -v| sort /+4


@REM cd "C:\Users\nandl\OneDrive - Astronomer\scripts\"
@REM bash "wsl_backup_ubuntu.sh"
@REM @timeout /t 05
@REM cd "C:\Users\nandl\OneDrive - Astronomer\scripts\"
@REM bash "wsl_backup_centos8.sh"
@REM @timeout /t 05
@REM cd "C:\Users\nandl\OneDrive - Astronomer\scripts\"
@REM bash "wsl_backup_ubuntu22.04.sh"

set DIR='C:\Users\nandl\OneDrive - Astronomer\WSL_Backup\WSL%mydate%
echo "directory path is %DIR% "
cd "C:\Users\nandl\OneDrive - Astronomer\WSL_Backup\"
mkdir WSL%mydate%
@timeout /t 05
cd WSL%mydate%



echo "================================================================================================================================  Taking Ubuntu WSL BACKUP================================================================================================================================ "
wsl.exe --export Ubuntu Ubuntu%mydate%".tar
REM @timeout /t 182
echo "================================================================================================================================ Done Taking Ubuntu WSL BACKUP" ================================================================================================================================"

echo "====> Taking CentOS8  WSL BACKUP================================================================================================================================ ================================================================================================================================ "
wsl.exe --export CentOS8 CentOS8%mydate%".tar
REM @timeout /t 181
echo "====> Done Taking CentOS8  WSL BACKUP================================================================================================================================ ================================================================================================================================"

echo "====> Taking Ubuntu22.04 WSL BACKUP================================================================================================================================ ================================================================================================================================ "
wsl.exe --export Ubuntu-22.04 Ubuntu-22.04%mydate%".tar
REM @timeout /t 180
echo "====> Done Taking Ubuntu22.04 WSL BACKUP================================================================================================================================ ================================================================================================================================ "


echo "====> Starting LxssManager to make sure all wsl's are running"
NET STOP LxssManager 
@timeout /t 05
NET START LxssManager
@timeout /t 05

@REM Get-Service LxssManager | Restart-Service
@REM net stop "LxssManager" & sc start "LxssManager"


echo "====> Here is the WSL Status:"
wsl --list -v| sort /+4


@REM cd "C:\Users\nandl\OneDrive - Astronomer\WSL_Backup"
@REM cd WSL_$(date +"%Y_%m_%d")
@REM wsl --export Ubuntu Ubuntu_$(date +"%Y_%m_%d")


@timeout /t 65
echo "Removing older backups more than 1 day old"
@REM Delete files older than 1 day
ForFiles /p "C:\Users\nandl\OneDrive - Astronomer\WSL_Backup" /s /d -1 /c "cmd /c del /q @file"
echo "we are [%DATE%] [%TIME%] Done."