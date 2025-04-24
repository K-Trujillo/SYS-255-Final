try { 
	Write-Host "Monitoring the Network..."

	Get-NetTCPConnection | Select-Object LocalAddress, LocalPort, RemoteAddress, RemotePort, State, OwningProcess | Format-Table -AutoSize

	Write-Host "Mapping Connections..."
	$connections = Get-NetTCPConnection | Select-Object LocalAddress, LocalPort, RemoteAddress, RemotePort, State, OwningProcess

	

	Read-Host "Press Enter to Exit"
} catch {
	Write-Host "An error has occurred."
	Write-Host $_.Exception.Message
}