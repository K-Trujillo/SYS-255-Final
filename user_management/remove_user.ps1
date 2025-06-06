param([string] $name)

Write-Host User: $name

try {
	Get-ADUser -Identity $name
	Write-Host "Located user, preparing to remove..."
} catch {
	Write-Host "Error, cannot find User; view error code below:"
	Write-Host $_
}

try {
	Remove-ADUser -Identity $name
	Write-Host "Successfully removed user"
} catch {
	Write-Host "Error in removing User, please try again; view error code below:"
	Write-Host $_
}