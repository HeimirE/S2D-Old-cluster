Get-PhysicalDisk | ForEach-Object {
    $serial = if($_.SerialNumber){ $_.SerialNumber.Trim() -replace ' ','_' } else { 'UNKNOWN' }
    $model = $_.FriendlyName -replace ' ','_' -replace ',',''
    $health = $_.HealthStatus
    $ops = $_.OperationalStatus
    $media = $_.MediaType
    $usage = $_.Usage
    $size = [math]::Round($_.Size/1GB,2)
    $fname = $_.FriendlyName
    Write-Output "s2d_physical_disk,serial=$serial,model=$model FriendlyName=""$fname"",HealthStatus=""$health"",OperationalStatus=""$ops"",MediaType=""$media"",Usage=""$usage"",SizeGB=$size"
}
