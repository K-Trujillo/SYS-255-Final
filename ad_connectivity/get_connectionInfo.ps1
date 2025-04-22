$ipAddress = Read-Host "Enter the IP Address to Ping"

$pingResult = Test-Connection -ComputerName $ipAddress -Count 1 -Quiet

if ($pingResult) {
    Write-Host "IP Address $ipAddress is reachable."

    # Try to get network interface details and filter by the provided IP address
    $ipDetails = Get-NetIPAddress | Where-Object {$_.IPAddress -eq $ipAddress}
    if ($ipDetails) {
        Write-Host "IP Address: $($ipDetails.IPAddress)"
        Write-Host "Interface Alias: $($ipDetails.InterfaceAlias)"
        Write-Host "Subnet Mask: $($ipDetails.PrefixLength)"
        
        # Retrieve the Default Gateway using Get-NetRoute
        $gateway = (Get-NetRoute -DestinationPrefix '0.0.0.0/0' | Where-Object { $_.InterfaceIndex -eq $ipDetails.InterfaceIndex }).NextHop
        Write-Host "Default Gateway: $gateway"
    } else {
        Write-Host "No network configuration found for the IP Address in local configuration."
    }
} else {
    Write-Host "Cannot connect to $ipAddress."
}
