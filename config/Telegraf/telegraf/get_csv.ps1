Get-ClusterSharedVolume | ForEach-Object {
    $name = $_.Name -replace ' ','_' -replace '[()]',''
    $state = [int]$_.State
    $owner = $_.OwnerNode.Name
    Write-Output "s2d_csv_status,volume=$name State=$state,OwnerNode=""$owner"""
}
