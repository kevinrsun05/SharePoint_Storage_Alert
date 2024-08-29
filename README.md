# SharePoint_Storage_Alert

*Description:* This powershell script sends the user an email when the SharePoint storage crosses a certain threshold.

**Prerequisites**

For Newer PowerShell Versions (7.2+):
```
Install-Module -Name PnP.PowerShell -AllowClobber -Force -Scope CurrentUser
```

For Older PowerShell Versions (5.1+):
```
Install-Module -Name SharePointPnPPowerShellOnline -AllowClobber -Force -Scope CurrentUser
```

Note: If you are asked to install NuGet and it fails, your powershell is likely v1. Run the following beforehand:
```
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
```

**YOUR changes in the script:**

    1) Fill in the values for $TenantAdminURL $EmailTo $AdminUserName $SecurePassword
    2) Change the fields in the New-AzureADPIMRequest field. All are filled in, but you must replace "role" with the PIM role you need activated. E.g. SharePoint Administrator
    3) Set the threshold percentage to what you want (i.e. 0.9 means 90% storage used)
    4) Fill/Change $subject, $body
*Note, for full automation, SSO is needed. If you have MFA, there's no way to activate PIM roles wihtout user authentication, so this script will only run completely when the user has the PIM role activated. 

**To Store Password elsewhere:**
```
# Convert the plain text password to a secure string
$securePassword = ConvertTo-SecureString "YourPlainPassword" -AsPlainText -Force

# Convert the secure string to an encrypted standard string and save it to a file
$securePassword | ConvertFrom-SecureString | Out-File "C:\path\to\password.txt"
```

**Automate Running Script in set time interval (Windows):**

    1) Open Task Scheduler
    2) Click Create Basic Task on right side of screen
    3) Put Name and Description
    4) Choose when you want task to run
    5) Select Start a program
    6) In Program/Script: type powershell or copy the path of the powershell there
    7) In Add arguments (optional): type "& ""path of script"""
    8) Leave Start in (optional) blank
    9) You can test it as well by clicking on the task and clicking Run
