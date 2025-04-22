param([string] $path, [string] $dc)

Write-Host OU: $path

try {
	New-ADOrganizationalUnit -Name $path -Path "DC=$dc,DC=local" -ErrorAction Stop
} catch {
	Write-Host "Error in creating new OU; view error code below:"
	Write-Host $_
}

try {
	Get-ADOrganizationalUnit -Filter 'Name -like $path' | Format-Table Name, DistinguishedName -A
} catch {
	Write-Host "Error, cannot find OU"
	Write-Host $_
}