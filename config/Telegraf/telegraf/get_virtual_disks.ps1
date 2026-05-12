Get-VirtualDisk | ForEach-Object {
    $disk = $_.FriendlyName -replace ' ','_' -replace ',',''
    $fname = $_.FriendlyName
    $health = $_.HealthStatus
    $ops = $_.OperationalStatus
    $resil = $_.ResiliencySettingName
    $size = [math]::Round($_.Size/1GB,2)
    $foot = [math]::Round($_.FootprintOnPool/1GB,2)
    Write-Output "s2d_virtual_disk_health,disk=$disk FriendlyName=""$fname"",HealthStatus=""$health"",OperationalStatus=""$ops"",ResiliencySettingName=""$resil"",SizeGB=$size,FootprintGB=$foot"
}
