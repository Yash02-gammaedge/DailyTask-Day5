# first of all we have taken 2 variables by using $ sign as it denotes the variable 
#In both of these variables we have given path of our source directory in which we are writing script and second one is backup 
#directory in which we have to save our backup files

$SourceDir = "C:\Users\yogit\Desktop\Daily Task"
$BackupDir = "C:\Users\yogit\Desktop\Testing Task"

# here we are Creating the backup directory if it not exist the condition in if (Test-Path -Path $BackupDir) it will check the 
#destination folder which i have named as (testing tasks) exists or not 
# i have used -not because it nevigates the results of test path
#if the folder does not exists then the condition inside if block will execute
#then the backup DIr create a backup file if it is not exists

if (-not (Test-Path -Path $BackupDir)) {
    New-Item -ItemType Directory -Path $BackupDir
    Write-Host "Created backup directory: $BackupDir"
}

# here we have copied the file from source to desitnation like from sourceDIR to backupDIR

Copy-Item -Path "$SourceDir\*" -Destination $BackupDir -Recurse -Force

#then here write-host works to display the message on terminal with date and time 

Write-Host "Backup completed on $(Get-Date)" | Out-File -FilePath "$BackupDir\backup_log.txt" -Append
