# Define source and destination directories
$SourceDir = "C:\Users\yogit\Desktop\Daily Task"
$BackupDir = "C:\Users\yogit\Desktop\Testing Task"

# Function to create a backup directory if it doesn't exist
function Ensure-BackupDirectory {
    param (
        [string]$Path
    )
    
    if (-not (Test-Path -Path $Path)) {
        New-Item -ItemType Directory -Path $Path | Out-Null
        Write-Host "Created backup directory: $Path"
    }
}

# Function to perform the backup
function Perform-Backup {
    param (
        [string]$Source,
        [string]$Destination
    )
    
    # Copy files from source to backup
    Copy-Item -Path "$Source\*" -Destination $Destination -Recurse -Force
    Write-Host "Backup completed on $(Get-Date)" | Out-File -FilePath "$Destination\backup_log.txt" -Append
}

# Main script execution
Ensure-BackupDirectory -Path $BackupDir
Perform-Backup -Source $SourceDir -Destination $BackupDir