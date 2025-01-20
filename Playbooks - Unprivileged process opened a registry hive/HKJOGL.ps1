# Disclaimer: This script is for educational purposes only and must be executed in a secure, isolated lab environment.
# Do not execute it in production or on-premises environments under any circumstances.

# Import-Module if required for local account management
Import-Module Microsoft.PowerShell.LocalAccounts

# Define MITRE ATT&CK-related behavior
# T1036: Masquerading - Creating folders mimicking legitimate system paths, and hiding the script within them
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

function CreateAndReadSimulatedFile {
  param (
    [string]$BasePath = "$env:USERPROFILE\AppData\Local", # T1036: Hiding in AppData
    [string]$FileName = "SAM"
  )

  # T1036: Masquerading system paths
  $hiddenFolder = Join-Path -Path $BasePath -ChildPath 'Microsoft'
  $windowsFolder = Join-Path -Path $hiddenFolder -ChildPath 'Windows'
  $system32Folder = Join-Path -Path $windowsFolder -ChildPath 'System32'
  $configFolder = Join-Path -Path $system32Folder -ChildPath 'config'
  New-Item -Path $hiddenFolder -ItemType Directory -Force | Out-Null
  New-Item -Path $windowsFolder -ItemType Directory -Force | Out-Null
  New-Item -Path $system32Folder -ItemType Directory -Force | Out-Null
  New-Item -Path $configFolder -ItemType Directory -Force | Out-Null

  # Create the simulated file (T1003)
  $filePath = Join-Path -Path $configFolder -ChildPath $FileName
  New-Item -Path $filePath -ItemType File -Force | Out-Null
  Rename-Item -Path $filePath -NewName ([System.IO.Path]::ChangeExtension($filePath, $null))

  # Attempt to read the simulated file (T1552)
  Write-Output "Attempting to read file using PowerShell..."
  try {
    $content = Get-Content -Path $filePath -ErrorAction Stop
    Write-Output "File content:\n$content"
  } catch {
    Write-Output "Failed to read file: $_"
  }

  # T1036: Hide the script file within the created directory
  $scriptPath = Join-Path -Path $configFolder -ChildPath "maintenance.ps1" 
  $thisScript = Get-Content -Path $PSCommandPath -Raw
  Set-Content -Path $scriptPath -Value $thisScript -Force
}

# Main Execution
function Main-Execute {
  # Create a local user (T1059)
  $localUser = "TestUser"
  $password = "TestP@ss123"
  Create-LocalAccount -Username $localUser -Password $password

  # Create and read the simulated file, and hide the script
  CreateAndReadSimulatedFile

  # Delete the local user
  Remove-LocalUser -Name $localUser
  Write-Output "Local user '$localUser' deleted."
}

# Call the main function
Main-Execute
