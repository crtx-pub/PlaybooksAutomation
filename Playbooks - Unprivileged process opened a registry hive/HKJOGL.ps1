# Disclaimer: This script is for educational purposes only and must be executed in a secure, isolated lab environment.
# Do not execute it in production or on-premises environments under any circumstances.

# Import-Module if required for local account management
Import-Module Microsoft.PowerShell.LocalAccounts

# Define MITRE ATT&CK-related behavior
# T1036: Masquerading - Creating folders mimicking legitimate system paths
# T1003: Credential Dumping - Simulating access to sensitive files
# T1552: Unsecured Credentials - Handling potentially sensitive data in an insecure manner
# T1059: Command and Scripting Interpreter - Execution of scripts

function Create-LocalAccount {
    param (
        [string]$Username = "LocalUser",
        [string]$Password = "P@ssw0rd"
    )

    # T1059: Create a local account using scripting
    New-LocalUser -Name $Username -Password (ConvertTo-SecureString -String $Password -AsPlainText -Force) -AccountNeverExpires -UserMayNotChangePassword -PasswordNeverExpires
    Write-Output "Local user '$Username' created."
}

function Create-FolderStructure {
    param (
        [string]$BasePath = "$env:USERPROFILE\Desktop"
    )

    # T1036: Masquerading system paths
    $windowsFolder = Join-Path -Path $BasePath -ChildPath 'Windows'
    $system32Folder = Join-Path -Path $windowsFolder -ChildPath 'System32'
    $configFolder = Join-Path -Path $system32Folder -ChildPath 'config'

    # Simulate creating a folder structure resembling a legitimate system directory
    New-Item -Path $windowsFolder -ItemType Directory -Force | Out-Null
    New-Item -Path $system32Folder -ItemType Directory -Force | Out-Null
    New-Item -Path $configFolder -ItemType Directory -Force | Out-Null

    Write-Output "Folder structure created at: $configFolder"
    return $configFolder
}

function Create-TextFile {
    param (
        [string]$ConfigFolder,
        [string]$FileName = "SAM"
    )

    # T1003: Credential Dumping (Simulated by creating a file named "SAM")
    $filePath = Join-Path -Path $ConfigFolder -ChildPath $FileName
    New-Item -Path $filePath -ItemType File -Force | Out-Null

    # Rename the file to remove extension, simulating sensitive file handling
    Rename-Item -Path $filePath -NewName ([System.IO.Path]::ChangeExtension($filePath, $null))
    Write-Output "File created and renamed: $filePath"
}

function Read-FileWithPowerShell {
    param (
        [string]$FilePath
    )

    # T1552: Unsecured Credentials (Simulated by reading a file)
    Write-Output "Attempting to read file using PowerShell..."
    try {
        $content = Get-Content -Path $FilePath -ErrorAction Stop
        Write-Output "File content:\n$content"
    } catch {
        Write-Output "Failed to read file: $_"
    }
}

# Main Execution
function Main-Execute {
    # Create a local user (T1059)
    $localUser = "TestUser"
    $password = "TestP@ss123"
    Create-LocalAccount -Username $localUser -Password $password

    # Create a folder structure (T1036)
    $folderPath = Create-FolderStructure

    # Create and manipulate a simulated sensitive file (T1003)
    $fileName = "SAM"
    $filePath = Create-TextFile -ConfigFolder $folderPath -FileName "$fileName"

    # Attempt to read the simulated sensitive file (T1552)
    Read-FileWithPowerShell -FilePath "$folderPath\$fileName"
}

# Call the main function
Main-Execute
