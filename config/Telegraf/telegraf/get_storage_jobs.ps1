$jobs = Get-StorageJob

if ($jobs) {
    foreach ($job in $jobs) {
        $name = $job.Name -replace ' ','_'
        $state = $job.JobState
        $pct = if ($null -eq $job.PercentComplete) { 0 } else { $job.PercentComplete }
        $processed = if ($null -eq $job.BytesProcessed -or $job.BytesProcessed -eq '') { 0 } else { $job.BytesProcessed }
        $total = if ($null -eq $job.BytesTotal -or $job.BytesTotal -eq '') { 0 } else { $job.BytesTotal }
        $elapsed = [math]::Round($job.ElapsedTime.TotalSeconds, 0)
        $isBackground = if ($job.IsBackgroundTask) { 1 } else { 0 }
        Write-Output "s2d_storage_job,job=$name JobState=""$state"",PercentComplete=$pct,BytesProcessed=$processed,BytesTotal=$total,ElapsedSeconds=$elapsed,IsBackground=$isBackground"
    }
} else {
    Write-Output "s2d_storage_job,job=none JobState=""None"",PercentComplete=0,BytesProcessed=0,BytesTotal=0,ElapsedSeconds=0,IsBackground=0"
}
