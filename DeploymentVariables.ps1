Write-Host  -ForegroundColor Cyan "Starting custom OSDCloud"
Start-Sleep -Seconds 5

#Change Display Resolution for Virtual Machine
if ((Get-MyComputerModel) -match 'Virtual') {
    Write-Host  -ForegroundColor Cyan "Setting Display Resolution to 1600x"
    Set-DisRes 1600
}

#Make sure I have the latest OSD Content
Write-Host  -ForegroundColor Cyan "Updating the OSD PowerShell Module"
Install-Module OSD -Force

Write-Host  -ForegroundColor Cyan "Importing the OSD PowerShell Module"
Import-Module OSD -Force

#Start OSDCloud ZTI the RIGHT way
Write-Host  -ForegroundColor Cyan "Starting installation"
StartOSDCloud -OSName 'Windows 11 24H2 x64' -OSEdition Enterprise -OSLanguage nl-nl -OSLicense Retail -ZTI"

#Anything I want  can go right here and I can change it at any time since it is in the Cloud!!!!!
Write-Host  -ForegroundColor Cyan "Copying config files to image"
Copy-Item -Path "D:\OSDCloud\PowerShell\Offline\Scripts*" -Destination "C:\Program Files\PowerShell\Scripts" -Recurse
Copy-Item -Path "D:\OSDCloud\PowerShell\Offline\Scripts*" -Destination "C:\Program Files\PowerShell\Scripts" -Recurse

#Restart from WinPE
Write-Host  -ForegroundColor Cyan "Restarting in 20 seconds!"
Start-Sleep -Seconds 20
wpeutil reboot
