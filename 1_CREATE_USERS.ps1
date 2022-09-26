# ----- Edit these Variables for your own Use Case ----- #
$PASSWORD_FOR_USERS   = "Password1"
$USER_FIRST_LAST_LIST = Get-Content .\names.txt
# ------------------------------------------------------ #

# --- Converts plain text or encrypted strings to secure strings --- #
$password = ConvertTo-SecureString $PASSWORD_FOR_USERS -AsPlainText -Force

# --- Creates an Active Directory organizational unit --- #
New-ADOrganizationalUnit -Name _USERS -ProtectedFromAccidentalDeletion $false

# --- A loop function that takes the first alphabet in the first name and combines with the last name--- #
foreach ($n in $USER_FIRST_LAST_LIST) {
    $first = $n.Split(" ")[0].ToLower()
    $last = $n.Split(" ")[1].ToLower()
    $username = "$($first.Substring(0,1))$($last)".ToLower()
    Write-Host "Creating user: $($username)" -BackgroundColor Black -ForegroundColor Cyan
    
# --- Creates an Active Directory user with the details provided--- #

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
