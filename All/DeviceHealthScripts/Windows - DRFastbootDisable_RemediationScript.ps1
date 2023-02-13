#Create a tag file just so Intune knows this was installed
If(-not(Test-Path -Path "$($env:ProgramData)\CXN\Scripts\FastbootDisableRemediationR"))
    {
    New-Item -itemtype "directory" -path "$($env:ProgramData)\CXN\Scripts\FastbootDisableR"
    Set-Content -Path "$($env:ProgramData)\CXN\Scripts\FastbootDisableR\FastbootDisableR.ps1.tag" -Value "Installed"
    }

#Begin Script
if ((Test-Path -LiteralPath "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Power") -ne $true) 
    {  
    New-Item "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Power" -force -ErrorAction SilentlyContinue
    }
    
New-ItemProperty -LiteralPath 'HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Power' -Name 'HiberbootEnabled' -Value 0 -PropertyType DWord -Force -ErrorAction SilentlyContinue

