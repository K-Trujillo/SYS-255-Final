

try {
	$ip = Get-NetIPAddress | Where-Object { $_.AddressFamily -eq "IPv4" }

	if ($ip) {
		Write-Output "IP Address Info:"
		$ip | Format-Table

		} else {
			throw "No IPv4 Addresses Found."
	}
}
catch {
	Write-Output "An error occurred while retrieving IP information:"
	Write-Output $_.Exception.Message
}