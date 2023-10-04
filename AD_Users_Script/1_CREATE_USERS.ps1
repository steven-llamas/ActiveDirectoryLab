# ----- Edit these Variables for your own Use Case ----- #
$PASSWORD_FOR_USERS   = "Password!"                # sets Password! as the password for all the users when created.
$USER_FIRST_LAST_LIST = Get-Content .\names.txt    # places .\names.txt in the variable $USER_FIRST_LAST_LIST.
# ------------------------------------------------------ #

$password = ConvertTo-SecureString $PASSWORD_FOR_USERS -AsPlainText -Force  
New-ADOrganizationalUnit -Name _USERS -ProtectedFromAccidentalDeletion $false   # Created AD organizational unit _USERS and does not protect them from accidential deletion.

foreach ($n in $USER_FIRST_LAST_LIST) {
    $first = $n.Split(" ")[0].ToLower()
    $last = $n.Split(" ")[1].ToLower()
    $username = "$($first.Substring(0,1))$($last)".ToLower()
    Write-Host "Creating user: $($username)" -BackgroundColor Black -ForegroundColor Cyan
    
    New-AdUser -AccountPassword $password `
               -GivenName $first `
               -Surname $last `
               -DisplayName $username `
               -Name $username `
               -EmployeeID $username `
               -PasswordNeverExpires $true `
               -Path "ou=_USERS,$(([ADSI]`"").distinguishedName)" `
               -Enabled $true
}

# the code above states for each name in file ($n) it created $first (first name) and $last (last name) by splitting the space into two and puts their name in respective varables.
# then the username variable is created by taking the first letter (0) and using + the rest of the last name.
# new-adUser --- creates a new user with the variables for each user.
