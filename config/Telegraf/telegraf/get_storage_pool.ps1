Get-StoragePool -IsPrimordial $false | ForEach-Object {
    $pool = $_.FriendlyName -replace ' ','_' -replace ',',''
    $health = $_.HealthStatus
    $ops = $_.OperationalStatus
    $total = [math]::Round($_.Size/1GB,2)
    $alloc = [math]::Round($_.AllocatedSize/1GB,2)
    Write-Output "s2d_storage_pool,pool=$pool HealthStatus=""$health"",OperationalStatus=""$ops"",TotalSizeGB=$total,AllocatedSizeGB=$alloc"
}
