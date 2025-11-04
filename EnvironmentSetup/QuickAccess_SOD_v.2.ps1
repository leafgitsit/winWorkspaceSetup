$day = Read-Host "Please enter the number of what day it is"
$sources = "C:\ClassFiles-KL","C:\ClassFiles-KL\DayLabs\Day-$($day)","C:\ClassFiles-KL\Samples",
    "C:\ClassFiles-KL\Export"
$currentDay = "C:\ClassFiles-KL\DayLabs\Day-$($day)"
$o = New-Object -com shell.application

#Iterative-appr. adding shortcuts to taskbar
foreach ($s in $sources) {
 $o.Namespace($s).self.InvokeVerb("pintohome")  
}

#Copy Files from Previous day into current Day-Lab
if ((Get-ChildItem -Path $currentDay -Recurse | Measure-Object).Count -eq 0){ #Check if Current Day folder has Files already. Prevent overwriting files
    Copy-Item -Path "C:\ClassFiles-KL\DayLabs\Day-$($day-1)\*" -Destination $currentDay -PassThru -Recurse #Copy item from previous day to current day folder
} else {
    Write-Host $currentDay " already has files"
}
#Display New Written Files
tree \F $currentDay