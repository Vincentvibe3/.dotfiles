Import-Module posh-git
# Import-Module oh-my-posh
# Set-PoshPrompt -Theme .custom
Import-Module "G:\Programs\Microsoft Visual Studio\2022\Community\Common7\Tools\Microsoft.VisualStudio.DevShell.dll"
Enter-VsDevShell a7c8bb23 -DevCmdArguments '-arch=x64 -no_logo'
$ENV:STARSHIP_CONFIG = "$HOME\.starship\config.toml"
Invoke-Expression (&starship init powershell)
cd ~
