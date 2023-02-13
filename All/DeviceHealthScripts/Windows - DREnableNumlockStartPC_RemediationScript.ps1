#Create a tag file just so Intune knows this was installed
If(-not(Test-Path -Path "$($env:ProgramData)\CXN\Scripts\EnableNumlockStartPCR"))
    {
    New-Item -itemtype "directory" -path "$($env:ProgramData)\CXN\Scripts\EnableNumlockStartPCR"
    Set-Content -Path "$($env:ProgramData)\CXN\Scripts\EnableNumlockStartPCR\EnableNumlockStartPCR.ps1.tag" -Value "Installed"
    }

#Begin Script
Set-ItemProperty -Path "Registry::HKU\.DEFAULT\Control Panel\Keyboard" -Name "InitialKeyboardIndicators" -Value "2" -Force


