# Prompt for the first IP address
$startIP = Read-Host "Enter the starting IP address (e.g., 10.0.0.1)"

# Prompt for the last IP address
$endIP = Read-Host "Enter the ending IP address (e.g., 10.0.0.10)"

# Function to convert an IP address to an array of integers
function Convert-IPToArray {
    param([string]$ip)
    return $ip.Split('.') | ForEach-Object { [int]$_ }
}

# Convert the starting and ending IPs to arrays of integers
$startArray = Convert-IPToArray $startIP
$endArray = Convert-IPToArray $endIP

# Check that the first three octets match for both IPs
if ($startArray[0] -ne $endArray[0] -or $startArray[1] -ne $endArray[1] -or $startArray[2] -ne $endArray[2]) {
    Write-Host "The IP range must be within the same subnet (the first three octets must match)."
    exit
}

# Loop through the range of IP addresses
for ($i = $startArray[3]; $i -le $endArray[3]; $i++) {
    # Build the current IP address
    $currentIP = "$($startArray[0]).$($startArray[1]).$($startArray[2]).$i"

    # Ping the current IP address
    $pingResult = Test-Connection -ComputerName $currentIP -Count 1 -Quiet

    # Output whether the IP address is reachable or not
    if ($pingResult) {
        Write-Host "$currentIP is reachable." -ForegroundColor Green
    } else {
        Write-Host "$currentIP is not reachable." -ForegroundColor Red
    }
}
