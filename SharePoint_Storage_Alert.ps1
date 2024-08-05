# Replace values
$TenantAdminURL = "https://yourOrganization-admin.sharepoint.com" 
$EmailTo = "emailto@email.com"
$AdminUserName = "admin@email.com"
$SecurePassword = ConvertTo-SecureString "yourpassword" -AsPlainText -Force

# OR for PW, store it and call it here
# $SecurePassword = Get-Content "Your Path" | ConvertTo-SecureString

$Credential = new-object -typename System.Management.Automation.PSCredential -argumentlist $AdminUserName, $SecurePassword

#Connect-AzureAD

# Activate Necessary PIM Role. Replace "Role" with PIM role (i.e. SharePoint Administrator) and you can change reason and duration
#New-AzureADPIMRequest -DurationInHours 8 -RoleName "Role" -Reason "Activation Reason"  

#Connect to PnP Online
Connect-PnPOnline -Url $TenantAdminURL -Credentials $Credential

# Define the threshold percentage (e.g., 90%)
$thresholdPercentage = 0.9

# Get the total storage and current usage
$tenant = Get-PnPTenant
$sites = Get-PnPTenantSite
$totalStorage = $tenant.StorageQuota
$currentUsage = 0

foreach ($site in $sites) {
    $currentUsage += $site.storageUsage
}

# Calculate percent of storage used
$storagePercentUsed = ($currentUsage / $totalStorage)

# Check if above threshold
if ($storagePercentUsed -gt $thresholdPercentage) {
    $storagePercentUsed = [math]::Round($storagePercentUsed * 100, 2)
    # Enter Email Subject
    $subject = "SharePoint Storage Alert" 
    # Enter Email body 
    $body = "The current storage usage is at $($storagePercentUsed)% of the total capacity."
    Send-PnPMail -To $EmailTo -Subject $subject -Body $body
}

Disconnect-PnPOnline