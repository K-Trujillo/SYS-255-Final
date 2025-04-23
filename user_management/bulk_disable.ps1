$users = Get-Content .\users_to_disable.txt

foreach($user in $users)
{
	try {
		Write-Host "Disabling User: $user"
		Disable-ADAccount -Identity $user

		Add-Content -Path ".\users_to_delete.txt" -Value "$user"
	} catch {
		Write-Host "Error, view code below for details:"
		Write-Host $_
	}
}

Clear-Content ".\users_to_disable.txt"