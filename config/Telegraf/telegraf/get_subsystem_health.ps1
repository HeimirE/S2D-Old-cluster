Get-StorageSubSystem -Model 'Clustered Windows Storage' | ForEach-Object {
    $sub = $_.FriendlyName -replace ' ','_' -replace ',',''
    $fname = $_.FriendlyName
    $health = $_.HealthStatus
    $ops = $_.OperationalStatus
    Write-Output "s2d_subsystem_health,subsystem=$sub FriendlyName=""$fname"",HealthStatus=""$health"",OperationalStatus=""$ops"""
}
