try {
	Write-Host "Determining IP Geolocation Info..."

	$publicIP = Invoke-RestMethod -Uri "https://ip-api64.ipify.org?format=text"

	$geoInfo = Invoke-RestMethod -Uri "http://ip-api.com/json/$publicIP"

	Write-Host "IP Address: $(geoInfo.query)"
	Write-Host "Country: $(geoInfo.country)"  
	Write-Host "Region: $(geoInfo.regionName)"
	Write-Host "City: $(geoInfo.city)"
	Write-Host "ISP: $(geoInfo.isp)"
	Write-Host "Timezone: $(geoInfo.timezone)"
	

	Read-Host "Press Enter to Exit"
} catch {
	Write-Host "An error has occurred."
	Write-Host $_.Exception.Message