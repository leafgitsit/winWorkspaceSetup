function Reset-TaskbarLayout {
    Get-Process explorer | Stop-Process -Force
    Remove-Item "$Env:AppData\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar\*" -Force -ErrorAction SilentlyContinue
    Remove-Item "$Env:AppData\Microsoft\Windows\Shell\*.dat" -Force -ErrorAction SilentlyContinue
    Remove-Item "$Env:AppData\Microsoft\Windows\Shell\LayoutModification.xml" -Force -ErrorAction SilentlyContinue
    Remove-Item -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Taskband" -Recurse -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\TrayNotify" -Name "IconStreams" -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\TrayNotify" -Name "PastIconsStream" -ErrorAction SilentlyContinue
}
Reset-TaskbarLayout