function Create-LocalAccount {
    param (
        [string]$Username = "LocalUser",
        [string]$Password = "P@ssw0rd"
    )

    New-LocalUser -Name $Username -Password (ConvertTo-SecureString -String $Password -AsPlainText -Force) -AccountNeverExpires -UserMayNotChangePassword -PasswordNeverExpires
    Write-Output "Local user '$Username' created."
}

function Create-FolderStructure {
    param (
        [string]$BasePath = "$env:USERPROFILE\Desktop"
    )

    $windowsFolder = Join-Path -Path $BasePath -ChildPath 'Windows'
    $system32Folder = Join-Path -Path $windowsFolder -ChildPath 'System32'
    $configFolder = Join-Path -Path $system32Folder -ChildPath 'config'

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

    $filePath = Join-Path -Path $ConfigFolder -ChildPath $FileName
    New-Item -Path $filePath -ItemType File -Force | Out-Null
    Rename-Item -Path $filePath -NewName ([System.IO.Path]::ChangeExtension($filePath, $null))
    Write-Output "File created and renamed: $filePath"
}

function Read-FileWithPowerShell {
    param (
        [string]$FilePath
    )

    Write-Output "Attempting to read file using PowerShell..."
    try {
        $content = Get-Content -Path $FilePath -ErrorAction Stop
        Write-Output "File content:\n$content"
    } catch {
        Write-Output "Failed to read file: $_"
    }
}

# Main Execution
function Main-Execute{
$localUser = "TestUser"
$password = "TestP@ss123"
Create-LocalAccount -Username $localUser -Password $password

$folderPath = Create-FolderStructure
$fileName = "SAM"
$filePath = Create-TextFile -ConfigFolder $folderPath -FileName "$fileName"

Read-FileWithPowerShell -FilePath "$folderPath\$fileName"
}
