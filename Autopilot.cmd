@echo off
rem This batch file will run the PowerShell commands to create a directory, set the location, install the NuGet provider, install a script, and get the Windows Autopilot info
powershell -Command "& { [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; New-Item -Type Directory -Path 'C:\HWID'; Set-Location -Path 'C:\HWID'; $env:Path += ';C:\Program Files\WindowsPowerShell\Scripts'; Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force; Set-PSRepository -Name PSGallery -InstallationPolicy Trusted; Install-Module PSWindowsUpdate -Force; Add-WUServiceManager -ServiceID 7971f918-a847-4430-9279-4a52d1efe18d -Confirm:$false }"
echo Done pc will be shutdown after 5 sec
rem This command will shut down the computer after 5 seconds
shutdown /s /f /t 5
pause