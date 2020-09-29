# PowerShell customizations

# Functions
Function Show-Procs {Get-Process | Out-Host -Paging | Format-List}
Function Set-Docs {Set-Location C:\Users\serio\OneDrive\Documents}
Function Set-Downloads {Set-Location C:\Users\serio\Downloads}
Function Add-Changes ($x) {git add $x}
Function Show-GitStatus {git status}
Function Add-CommitMessage ($x) {git commit -m $x}
Function Push-OriginMaster {git push -u origin master}
Function Get-CloneRepo ($x) {git clone $x}
Function Get-Cheatsheet ($x) { . 'C:\Users\serio\scoop\shims\curl.exe' cheat.sh/$x }
Function Get-Uptime { ((Get-Date) - (gcim Win32_OperatingSystem).LastBootUpTime) }
Function Get-MyIp {
    $ipaddr = Invoke-WebRequest -UseBasicParsing ipinfo.io
    $ipaddr.Content
}
Function Set-Home {
    if ($NULL -eq $args[0]) {
        Set-Location $HOME;
        Get-ChildItemColorFormatWide
    } else {
        Set-Location $args[0];
        Get-ChildItemColorFormatWide
    }
}
Function Restart-Shell {
    Set-Location $HOME;
    Clear-Host;
}
Function Get-CommandDef ($x) {
    $info = Get-Command -ShowCommandInfo $x;
    $info.Definition
}
Function Get-GUID {
    '{'+[guid]::NewGuid().ToString()+'}'
}

# Aliases
Set-Alias -Name lsprocs -Value Show-Procs -Option AllScope
Set-Alias -Name cddoc -Value Set-Docs -Option AllScope
Set-Alias -Name cddl -Value Set-Downloads -Option AllScope
Set-Alias -Name ga -Value Add-Changes
Set-Alias -Name gst -Value Show-GitStatus
Set-Alias -Name gcmsg -Value Add-CommitMessage
Set-Alias -Name gpuom -Value Push-OriginMaster
Set-Alias -Name gcl -Value Get-CloneRepo
Set-Alias -Name cheatsh -Value Get-Cheatsheet
Set-Alias -Name uptime -Value Get-Uptime
Set-Alias -Name myip -Value Get-MyIp
Set-Alias -Name cd -Value Set-Home -Option AllScope
Set-Alias -Name rsrc -Value Restart-Shell -Option AllScope
Set-Alias -Name which -Value Get-CommandDef
Set-Alias -Name ls -Value Get-ChildItemColorFormatWide -Option AllScope
Set-Alias -Name ll -Value Get-ChildItemColor -Option AllScope
