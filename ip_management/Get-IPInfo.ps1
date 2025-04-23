$ip = Get-NetIPAddress | Where-Object { $_.AddressFamily -eq "IPv4" }
$ip | Format-Table