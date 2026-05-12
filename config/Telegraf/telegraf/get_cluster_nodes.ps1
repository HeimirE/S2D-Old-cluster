Get-ClusterNode | ForEach-Object {
    $name = $_.Name -replace ' ','_'
    $state = $_.State.ToString()
    $weight = $_.NodeWeight
    Write-Output "s2d_cluster_node,cluster_node=$name NodeName=""$($_.Name)"",StateText=""$state"",NodeWeight=$weight"
}
