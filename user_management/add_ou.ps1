param([string] $path, [string] $dc)

Write-Host OU: $path

try {
	New-ADOrganizationalUnit -Name $path -Path "DC=$dc,DC=local" -ErrorAction Stop
} catch {
	Write-Host "Error in creating new OU; either OU exists, or an error in the command itself"
	Write-Host "Please try running the script as an adminstrator and try again."
}

try {
	Get-ADOrganizationalUnit -Filter 'Name -like $path' | Format-Table Name, DistinguishedName -A
} catch {
	Write-Host "Error, cannot find OU"
}