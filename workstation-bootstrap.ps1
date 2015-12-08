Set-ExplorerOptions -EnableShowHiddenFilesFoldersDrives -EnableShowProtectedOSFiles -EnableShowFileExtension
Install-WindowsUpdate  -acceptEula
Update-ExecutionPolicy RemoteSigned

cinst 7zip
cinst autohotkey
cinst ChocolateyGUI
cinst clink
cinst conemu
cinst Cygwin
cinst ditto
cinst dropbox
cinst Evernote
cinst filezilla
cinst Firefox
cinst gimp
cinst git
cinst git.install
cinst google-chrome-x64
cinst googledrive
cinst greenshot
cinst launchy
cinst licecap
cinst putty
cinst skype
cinst slack
cinst SourceTree
cinst SublimeText3
cinst SublimeText3.PackageControl
cinst sysinternals
cinst vlc
cinst windirstat
cinst wget

#Turn off Aero Shake - Must sign out/in for this to take effect.
New-Item -Path HKCU:\Software\Policies\Microsoft\Windows\Explorer
Set-ItemProperty HKCU:\Software\Policies\Microsoft\Windows\Explorer NoWindowMinimizingShortcuts 1

# Install SublimeText Powershell syntax highlighting
$sublimePackagesPath=Join-Path $env:AppData "Sublime Text 3\Packages"
$target=Join-Path $env:TEMP "PowerShell"
if (Test-Path $target) { Remove-Item -Recurse -Force $target }
cd $env:TEMP
# This command makes noise, but it can be ignored. See https://github.com/dahlbyk/posh-git/issues/109
git clone https://github.com/SublimeText/PowerShell
Move-Item $target $sublimePackagesPath