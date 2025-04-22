param([string] $path, [string] $dc)

Write-Host OU: $path

try {
	Get-ADOrganizationalUnit -Filter 'Name -like $path' | Format-Table Name, DistinguishedName -A
	Write-Host "Located OU, preparing to remove..."
} catch {
	Write-Host "Error, cannot find OU"
}

try {
	Get-ADOrganizationalUnit -Identity "OU=$path,DC=$dc,DC=local" | Set-ADObject -ProtectedFromAccidentalDeletion:$false -PassThru | Remove-ADOrganizationalUnit
	Write-Host "Successfully removed OU"
} catch {
	Write-Host "Error in removing OU, please try again"
}