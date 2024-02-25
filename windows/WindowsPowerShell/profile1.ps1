Import-Module posh-git
# Import-Module oh-my-posh
# Set-PoshPrompt -Theme .custom
$ENV:STARSHIP_CONFIG = "$HOME\.starship\config.toml"
Invoke-Expression (&starship init powershell)
