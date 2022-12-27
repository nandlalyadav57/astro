Set-ExecutionPolicy Bypass -Scope Process -Force
cd "C:\Users\nandl\OneDrive - Astronomer\scripts"
Start-Process -FilePath "C:\Users\nandl\OneDrive - Astronomer\scripts\wsl_backup_start.bat" -NoNewWindow > "C:\Users\nandl\OneDrive - Astronomer\WSL_Backup\wsl_backup_start_$(date +"%Y_%m_%d").log"