Set-ExecutionPolicy Bypass -Scope Process -Force
$WD="C:\Users\nandl\OneDrive - Astronomer\scripts"
$myLog = "C:\Users\nandl\OneDrive - Astronomer\WSL_Backup\wsl_backup_start_$(date +"%Y_%m_%d").txt"
$stdErrLog = "C:\Users\nandl\OneDrive - Astronomer\WSL_Backup\wsl_backup_start_$(date +"%Y_%m_%d")_stderr.txt"
$stdOutLog = "C:\Users\nandl\OneDrive - Astronomer\WSL_Backup\wsl_backup_start_$(date +"%Y_%m_%d")_stdout.txt"
Start-Process -File "C:\Users\nandl\OneDrive - Astronomer\scripts\wsl_backup_start.bat" -WorkingDirectory $WD -RedirectStandardOutput $stdOutLog -RedirectStandardError $stdErrLog -wait
Get-Content $stdErrLog, $stdOutLog | Out-File $myLog -Append