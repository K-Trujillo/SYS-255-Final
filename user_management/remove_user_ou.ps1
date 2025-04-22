param([string] $name, [string] $path, [string] $dc)

Write-Host User: $name
Write-Host OU: $path

try {
	Write-Host "Removing User..."
	Get-ADUser -Identity $name
	Write-Host "Located user, preparing to remove..."
} catch {
	Write-Host "Error, cannot find User; view error code below:"
	Write-Host $_
}

try {
	Write-Host "Removing OU..."
	Get-ADOrganizationalUnit -Filter 'Name -like $path' | Format-Table Name, DistinguishedName -A
	Write-Host "Located OU, preparing to remove..."
} catch {
	Write-Host "Error, cannot find OU; view error code below:"
	Write-Host $_
}

try {
	Remove-ADUser -Identity $name
	Get-ADOrganizationalUnit -Identity "OU=$path,DC=$dc,DC=local" | Set-ADObject -ProtectedFromAccidentalDeletion:$false -PassThru | Remove-ADOrganizationalUnit
	Write-Host "Successfully removed User and OU"
} catch {
	Write-Host "Error in removing User or OU, please try again; view error code below:"
	Write-Host $_
}