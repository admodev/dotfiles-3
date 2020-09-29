$modules = @("Get-ChildItemColor", "posh-git", "PSReadline")
Import-Module $modules

. "C:\Users\serio\OneDrive\Documents\WindowsPowerShell\Microsoft.PowerShell_aliases.ps1"

Set-PSReadLineOption -HistoryNoDuplicates
Set-PSReadLineOption -HistorySearchCursorMovesToEnd
Set-PSReadLineOption -HistorySaveStyle SaveIncrementally
Set-PSReadLineOption -MaximumHistoryCount 4000

# history substring search
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward

# tab completion
Set-PSReadLineKeyHandler -Chord 'Shift+Tab' -Function Complete
Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete

Invoke-Expression (&starship init powershell)