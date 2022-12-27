Set-ExecutionPolicy Bypass -Scope Process -Force
$WD="C:\Users\nandl\OneDrive - Astronomer\scripts"
$myLog = "C:\Users\nandl\OneDrive - Astronomer\WSL_Backup\wsl_backup_start_$(date +"%Y%m%d").log"
$stdErrLog = "C:\Users\nandl\OneDrive - Astronomer\WSL_Backup\wsl_backup_start_$(date +"%Y%m%d")_stderr.log"
$stdOutLog = "C:\Users\nandl\OneDrive - Astronomer\WSL_Backup\wsl_backup_start_$(date +"%Y%m%d")_stdout.log"
$logpath = "C:\Users\nandl\OneDrive - Astronomer\WSL_Backup"
$backuppath = "C:\Users\nandl\OneDrive - Astronomer\WSL_Backup\WSL$(date +"%Y%m%d")"
Get-ChildItem $logpath -recurse *.log -force | Remove-Item -force
Get-ChildItem $logpath -recurse *.txt -force | Remove-Item -force    ####Cleaning logs BEFORE BACKUP if for some day ran it will overwrite
Get-ChildItem $backuppath -recurse *.tar -force | Remove-Item -force  ####Cleaning FOLDER BEFORE BACKUP
Start-Process -File "C:\Users\nandl\OneDrive - Astronomer\scripts\wsl_backup_start.bat" -NoNewWindow -WorkingDirectory $WD -RedirectStandardOutput $stdOutLog -RedirectStandardError $stdErrLog -wait
Get-Content $stdErrLog, $stdOutLog | Out-File $myLog -Append

