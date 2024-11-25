import subprocess
import random

# Extended lists of first and last names for generating realistic usernames
FIRST_NAMES = [
    "John", "Jane", "Alex", "Emily", "Chris", "Sara", "Michael", "Laura",
    "David", "Emma", "Daniel", "Sophia", "James", "Olivia", "Robert", "Isabella",
    "William", "Mia", "Joseph", "Charlotte", "Joshua", "Amelia", "Andrew", "Evelyn",
    "Matthew", "Hannah", "Ryan", "Grace", "Benjamin", "Lily", "Jacob", "Zoe"
]

LAST_NAMES = [
    "Smith", "Johnson", "Brown", "Taylor", "Anderson", "Clark", "Walker", "Robinson",
    "Harris", "Hall", "Lewis", "Allen", "Young", "King", "Wright", "Scott", "Green",
    "Baker", "Adams", "Nelson", "Carter", "Mitchell", "Perez", "Turner", "Phillips",
    "Campbell", "Parker", "Evans", "Edwards", "Collins", "Stewart", "Morris", "Murphy"
]

def generate_random_username():
    first_name = random.choice(FIRST_NAMES)
    last_name = random.choice(LAST_NAMES)
    return f"{first_name}.{last_name}".lower()

def create_userAddAdministroars(username, password="P@ssw0rd123"):
    try:
        # PowerShell command to create a new local user
        create_user_command = f'New-LocalUser -Name "{username}" -Password (ConvertTo-SecureString "{password}" -AsPlainText -Force) -FullName "{username}" -AccountNeverExpires -PasswordNeverExpires'
        
        # Run the PowerShell command and keep the window open
        subprocess.run(
            ["powershell", "-Command", create_user_command],
            text=True
        )
        print(f"User '{username}' created successfully with default password.")
    except Exception as e:
        print(f"An error occurred while creating the user: {e}")

    try:
        # PowerShell command to add the user to the Administrators group
        add_to_admin_command = f'Add-LocalGroupMember -Group "Administrators" -Member "{username}"'
        
        # Run the PowerShell command and keep the window open
        subprocess.run(
            ["powershell", "-NoExit", "-Command", add_to_admin_command],
            text=True
        )
        print(f"User '{username}' was successfully added to the Administrators group.")
        localAdminCMD= "net localgroup 'Administrators'"
        subprocess.run(
            ["cmd.exe", localAdminCMD],
            text=True
        )
    except Exception as e:
        print(f"An error occurred while adding the user to the Administrators group: {e}")

if __name__ == "__main__":
    # Generate a random username
    username = generate_random_username()
    print(f"Generated random username: {username}")
    
    # Create the user and add them to the Administrators group
    create_userAddAdministroars(username)
