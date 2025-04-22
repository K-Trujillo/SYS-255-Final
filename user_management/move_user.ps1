param([string] $name, [string] $oldPath, [string] $newPath, [string] $dc)

Write-Host User: $name
Write-Host Old OU: $oldPath
Write-Host New OU: $newPath

try {
	Write-Host "Moving User to new OU"
	Move-ADObject -Identity "CN=$name,OU=$oldPath,DC=$dc,DC=local" -TargetPath "OU=$newPath,DC=$dc,DC=local"
} catch {
	Write-Host "An error occurred, view error code below:"
	Write-Host $_
}

try {
	Get-ADUser -Identity $name
} catch {
	Write-Host "Error, cannot find User"
	Write-Host $_
}