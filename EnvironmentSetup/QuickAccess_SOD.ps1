$day = Read-Host "Please enter the number of what day it is"
$sources = "C:\ClassFiles-KL","C:\ClassFiles-KL\DayLabs\Day-$($day)","C:\ClassFiles-KL\Samples",
    "C:\ClassFiles-KL\Export"
$o = New-Object -com shell.application
foreach ($s in $sources) {
 $o.Namespace($s).self.InvokeVerb("pintohome")  
}