param([string] $name)

try {
	Get-ADUser -Identity $name
	Add-Content -Path ".\users_to_disable.txt" -Value "$name"
} catch {
	Write-Host "Error, see code below for error details:"
	Write-Host $_
}