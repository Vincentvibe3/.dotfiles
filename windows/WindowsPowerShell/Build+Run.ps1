$OUTPUT= $(Get-Item $args[0]).basename
cl $args[0]
Write-Output "Starting Program:"
Invoke-Expression ".\${OUTPUT}.exe"