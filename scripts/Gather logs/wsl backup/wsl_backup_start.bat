title=Starting WSL backup
echo "Here are the Windows Subsystem for Linux Distributions:"
wsl.exe --list --verbose
echo "stopping them:"
wsl.exe --shutdown Ubuntu
@timeout /t 05
wsl.exe -t Ubuntu
@timeout /t 05
wsl.exe --shutdown Ubuntu-22.04 
@timeout /t 05
wsl.exe --shutdown CentOS8
@timeout /t 10
echo "Current status:"
wsl.exe --list --verbose
cd "C:\Users\nandl\OneDrive - Astronomer\scripts\"
bash wsl_backup_ubuntu.sh
@timeout /t 05
cd "C:\Users\nandl\OneDrive - Astronomer\scripts\"
bash wsl_backup_centos8.sh
@timeout /t 05
cd "C:\Users\nandl\OneDrive - Astronomer\scripts\"
bash wsl_backup_ubuntu22.04.sh
@timeout /t 05
echo "Restarting LxssManager to make sure all wsl's are running"
Get-Service LxssManager | Restart-Service
net stop "LxssManager" & sc start "LxssManager"
echo "Here is the WSL Status:"
wsl.exe --list --verbose
cd "C:\Users\nandl\OneDrive - Astronomer\WSL_Backup"
cd WSL_$(date +"%Y_%m_%d")
wsl.exe --export Ubuntu Ubuntu_$(date +"%Y_%m_%d")
@timeout /t 65
echo "Removing older backups more than 1 day old"
#Delete files older than 1 day
ForFiles /p "C:\Users\nandl\OneDrive - Astronomer\WSL_Backup" /s /d -1 /c "cmd /c del /q @file"
echo [%DATE%] [%TIME%] Done.