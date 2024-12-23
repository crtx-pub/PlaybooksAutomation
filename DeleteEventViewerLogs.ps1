

# Define a function to clear security logs using wevtutil
function Invoke-ClearSecurityLogs {
# Check if running as Administrator
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Output "This script must be run as an Administrator. Please restart PowerShell with elevated permissions."
    exit
}
    try {
        # Clear the Security event logs using wevtutil
        wevtutil cl Security
        Write-Output "Security logs have been cleared using wevtutil."
    } catch {
        Write-Output "Failed to clear Security logs. Ensure you have administrative privileges."
    }
}
