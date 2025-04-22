param([string] $name, [string] $path, [string] $dc)

Write-Host User: $name

try {
	New-ADUser -Name $name -SamAccountName $name -Path "OU=$path,DC=$dc,DC=local"
} catch {
	Write-Host "Error in creating new User; either new User exists or cannot find OU"
}

try {
	Get-ADUser -Identity $name
} catch {
	Write-Host "Error, cannot find User"
}