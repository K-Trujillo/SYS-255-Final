param([string] $name, [string] $path, [string] $dc)

Write-Host User: $name
Write-Host OU: $path

try {
	Write-Host "Creating OU..."
	New-ADOrganizationalUnit -Name $path -Path "DC=$dc,DC=local" -ErrorAction Stop
} catch {
	Write-Host "Error in creating new OU; view error code below:"
	Write-Host $_
}

try {
	Write-Host "Creating User..."
	New-ADUser -Name $name -SamAccountName $name -Path "OU=$path,DC=$dc,DC=local"
} catch {
	Write-Host "Error in creating new User; view error code below:"
	Write-Host $_
}

try {
	Get-ADUser -Identity $name
	Get-ADOrganizationalUnit -Filter 'Name -like $path' | Format-Table Name, DistinguishedName -A
} catch {
	Write-Host "Error, cannot find User and/or OU"
	Write-Host $_
}