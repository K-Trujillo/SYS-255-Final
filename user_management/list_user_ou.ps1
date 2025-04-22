Write-Host "Printing out all named Users and OUs..."

Get-LocalUser

Get-ADOrganizationalUnit -Filter * | Format-Table Name, DistinguishedName