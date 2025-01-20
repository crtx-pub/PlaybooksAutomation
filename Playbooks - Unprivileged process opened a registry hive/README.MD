# Alert Simulation Process

This guide outlines the process to simulate alerts by creating specific file structures and executing commands. Follow the steps carefully to perform the simulation.

## Prerequisites

1. A computer running Windows.
2. Administrator access to create a new local user account.
3. Python 2 installed on your machine.

## Setup Instructions

### Step 1: Create a New Local User Account

1. Open the Control Panel.
2. Navigate to **User Accounts > Manage another account > Add a new user in PC settings**.
3. Create a new local account (ensure the account is not an administrator).

### Step 2: Create the Folder Structure

1. Log in to the newly created local user account.
2. On the desktop, create a new folder named `Windows`.
3. Inside the `Windows` folder, create another folder named `System32`.
4. Within the `System32` folder, create a folder named `config`.
5. Inside the `config` folder, create a new text file and name it one of the following:
   - `SAM`
   - `SECURITY`
   - `SOFTWARE`
   - `SYSTEM`
6. Remove the `.txt` extension from the file name (e.g., the file should be named `SAM` without `.txt`).

### Step 3: Install Python 2

1. Download Python 2 from the [official Python website](https://www.python.org/downloads/release/python-2718/).
2. Run the installer and follow the prompts to complete the installation.
3. Note the installation directory (e.g., `C:\Python27`).

### Step 4: Run the Simulation Commands

#### Using Command Prompt (CMD)

1. Open Command Prompt.
2. Navigate to the Python 2 installation directory using the `cd` command. For example:
   ```
   cd C:\Python27
   ```
3. Execute the following command:
   ```
   python.exe -c "with open('C:\\Users\\yourlocaluser\\Desktop\\Windows\\System32\\config\\Filename','r') as file: print(file.read())"
   ```
   Replace `yourlocaluser` with the username of the local account created earlier and `Filename` with the file name (e.g., `SAM`, `SECURITY`).

## Notes

- Ensure Python 2 is installed correctly, and the system's PATH variable includes the Python 2 directory if needed.
- The commands above simulate reading specific files in a Windows-like folder structure.
- This simulation should only be performed on a test system and not on a production machine.

For any issues or questions, feel free to open an issue on this repository.
