# Import the Active Directory module if not already imported
Import-Module ActiveDirectory

# Get all computer objects in the domain
$computers = Get-ADComputer -Filter * -Property Name, IPv4Address

# Loop through each computer and test connectivity
foreach ($computer in $computers) {
    $computerName = $computer.Name
    $ipAddress = $computer.IPv4Address

    # Ping the computer to check connectivity
    $pingResult = Test-Connection -ComputerName $ipAddress -Count 1 -Quiet

    # Output the result for each computer
    if ($pingResult) {
        Write-Host "$computerName ($ipAddress) is reachable." -ForegroundColor Green
    } else {
        Write-Host "$computerName ($ipAddress) is not reachable." -ForegroundColor Red
    }
}
