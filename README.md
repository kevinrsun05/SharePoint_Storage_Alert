# SharePoint_Storage_Alert

*Description:* This powershell script sends the user an email when the SharePoint storage crosses a certain threshold.

**YOUR changes in the script:**

    1) Fill in the values for $TenantAdminURL $EmailTo $AdminUserName $SecurePassword
    2) Change the fields in the New-AzureADPIMRequest field. All are filled in, but you must replace "role" with the PIM role you need activated. E.g. SharePoint Administrator
    3) Set the threshold percentage to what you want (i.e. 0.9 means 90% storage used)
    4) Fill/Change $subject, $body
*Note, for your account, it has to be either SSO, or MFA with an app password generated. This allows for complete automation of the script.

**To Generate App Password**

*For Google Accounts:*

    1) First ensure you have MFA on
    2) Then go to this link: https://myaccount.google.com/apppasswords?pli=1&rapt=AEjHL4OsY4KSWwJT8ilXBJWZy4DYPOgOaye3hCf6KOcvlV7Ee6GMTLwKy5AmQAxTFPvSzHEOnHDgFY91il_AYtlHQIlxcpPGt7DNHGeawvQGGIn22czV8ws to create your app password
    3) For the APP name, enter anything then hit Create.
    4) You will see a string of 16 letters. Copy it into your password field. This way, the user won't have to perform any interactions for MFA
*For Outlook Account:*

    1) Ensure MFA is on
    2) Go to office.com
    3) Click your profile top right, and click View Account
    4) Go to Security Info and Click Add sign-in method
    5) From the dropdown select app password

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
