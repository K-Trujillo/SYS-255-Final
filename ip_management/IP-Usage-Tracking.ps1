try {
	Write-Host "Tracking IP Usage..."

	$connections = Get-NetTCPConnection | Select-Object LocalAddress, LocalPort, RemoteAddress, RemotePort, State, OwningProcess

	Write-Host "Searching Names..."

	foreach ($conn in $connections) {
		try {
			$processName = (Get-Process -Id $conn.OwningProcess).ProcessName
			Write-Host "$processName (PID: $($conn.OwningProcess)) > $($conn.RemoteAddress):$($conn.RemotePort) [$($conn.State)]"
	} catch { 
		Write-Host "Unable to resolve PID process: $($conn.OwningProcess)"
	}
}
	Read-Host "Press Enter to Exit"
} catch {
	Write-Host "An error has occurred"
	Write $_.Exception.Message
}