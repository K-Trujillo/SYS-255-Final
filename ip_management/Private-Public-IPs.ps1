try {
	Write-Output "Searching for IP Addresses."

	$privateIP = Get-NetIPAddress | Where-Object { $_.AddressFamily -eq "IPv4" -and $_.InterfaceAlias -notlike "Loopback*" } | Select-Object -ExpandProperty IPv4Address
	Write-Output "Private IP Address:$privateIP"

	$publicIP = Invoke-RestMethod -Uri "https://ipinfo.io/ip"
	Write-Output "Public IP Address:$publicIP"
	
	Write-Output "Thank You!"
	
	Read-Host "Press Enter to Exit"

} catch {
	Write-Output "An error has occurred"
	Write-Output $_.Exception.Message
}