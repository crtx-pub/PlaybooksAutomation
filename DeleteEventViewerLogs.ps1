# This script is for educational purposes only and must be executed in a secure, isolated lab environment.
# Do not execute it in production or on-premises environments under any circumstances.

# Define a function to clear security logs using wevtutil
function Invoke-ClearSecurityLogs {
    try {
        # Clear the Security event logs using wevtutil
        wevtutil cl Security
        Write-Output "Security logs have been cleared using wevtutil."
    } catch {
        Write-Output "Failed to clear Security logs. Ensure you have administrative privileges."
    }
}
