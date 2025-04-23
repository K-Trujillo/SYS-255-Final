try {
	Write-Host "Releasing Current Address"
	ipconfig /release

	Start-Sleep -Seconds 5	

	Write-Host "Requesting New Address"
	ipconfig /renew
	
	Start-Sleep -Seconds 3
	
	Write-Host ""
	Write-Host "Above are your new details. Thank You!"
	Write-Host ""

	Start-Sleep -Seconds 2

	Invoke-Expression "Get-NetIPConfiguration | Select-Object IPv4Address, InterfaceAlias, DNSServer, DhcpServer"
	
	Read-Host "Press Enter to Exit"

	} catch {
		Write-Host "An error occurred while renewing DHCP:"
		Write-Host $_.Exception.Message
}