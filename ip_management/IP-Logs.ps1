try {
	$logFile = "C:\IP_Logs.txt"

	$currentIP = (Get-NetIPAddress | Where-Object { $_.AddressFamily -eq "IPv4" }).IPv4Address

	if (-not $currentIP) {
		throw "No IPv4 address detected."
}

	$logEntry = "$(Get-Date) - IP Address: $currentIP"
	Add-Content -Path $logFile -Value $logEntry

	Write-Host "'nShowing Last 20 IP Alerts"
	Get-Content $logFile | Select-Object -Last 20

	Read-Host "'nPress Enter to Exit"
}
catch { 
	Write-Host "An error has occured"
	Write-Host $_.Exception.Message
}