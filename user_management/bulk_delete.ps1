$users = Get-Content .\users_to_delete.txt

foreach($user in $users)
{
	try {
		Write-Host "Deleting User: $user"
		Remove-ADUser -Identity "$user"
		Write-Host "Deleted User"
	} catch {
		Write-Host "Error, view code below for details:"
		Write-Host $_
	}
}

Clear-Content ".\users_to_delete.txt"