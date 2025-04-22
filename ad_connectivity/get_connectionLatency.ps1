# Prompt for the IP address to test
$IPAddress = Read-Host "Enter the IP address to test (e.g., 10.0.0.1)"

# Define the number of ping attempts
$pingAttempts = 4

# Initialize an array to store ping times
$pingTimes = @()

# Create a Ping object
$ping = New-Object System.Net.NetworkInformation.Ping

# Ping the IP address the specified number of times
for ($i = 0; $i -lt $pingAttempts; $i++) {
    $pingResult = $ping.Send($IPAddress)

    if ($pingResult.Status -eq [System.Net.NetworkInformation.IPStatus]::Success) {
        # Add the roundtrip time to the array
        $pingTimes += $pingResult.RoundtripTime
    }
}

# Check if we have any valid ping times
if ($pingTimes.Count -gt 0) {
    # Calculate the statistics (low, average, high latency)
    $minLatency = ($pingTimes | Measure-Object -Minimum).Minimum
    $avgLatency = ($pingTimes | Measure-Object -Average).Average
    $maxLatency = ($pingTimes | Measure-Object -Maximum).Maximum

    # Output the results
    Write-Host "$IPAddress is reachable." -ForegroundColor Green
    Write-Host "Low Latency: $minLatency ms"
    Write-Host "Average Latency: $([math]::Round($avgLatency, 2)) ms"
    Write-Host "High Latency: $maxLatency ms"
} else {
    Write-Host "$IPAddress is not reachable." -ForegroundColor Red
}
