try { 
	Write-Host "Monitoring the Network..."

	Get-NetTCPConnection | Select-Object LocalAddress, LocalPort, RemoteAddress, RemotePort, State, OwningProcess | Format-Table -AutoSize

	Write-Host "Mapping Connections..."
	$connections = Get-NetTCPConnection | Select-Object LocalAddress, LocalPort, RemoteAddress, RemotePort, State, OwningProcess

	foreach ($conn in $connections) {
		$processName = (Get-Process -Id $conn.OwningProcess).ProcessName
		Write-Host "PID $($conn.OwningProcess) $processName > $($conn.RemoteAddress):$($conn.RemotePort) ($($conn.State))"
}

	Read-Host "Press Enter to Exit"
} catch {
	Write-Host "An error has occurred."
	Write-Host $_.Exception.Message
}