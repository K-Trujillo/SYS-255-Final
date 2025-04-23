try {
	Write-Output "Releasing Current Address"
	ipconfig / release

	Start-Sleep -Seconds 5	

	Write-Output "Requesting New Address"
	ipconfig /renew

	Write-Output "Here are your new details:"
	Get-NetIPConfiguration | Select-Object IPv4Address, InterfaceAlias, DNSServer
	
	Read-Host "Press Enter to Exit"

	} catch {
		Write-Output "An error occurred while renewing DHCP:"
		Write-Output $_.Exception.Message
}