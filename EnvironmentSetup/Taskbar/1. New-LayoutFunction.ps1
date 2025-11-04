#Solution via https://awakecoding.com/posts/pinning-apps-to-the-windows-11-taskbar-with-powershell/
function New-LayoutModificationXml {
    [CmdletBinding()]
    param (           
        [string[]] $LnkPaths,
        [string] $OutputPath = "C:\Users\Default\AppData\Local\Microsoft\Windows\Shell\LayoutModification.xml",
        [ValidateSet("Append", "Replace")]
        [string] $PinListPlacement = "Replace"
    )
    $xml = New-Object System.Xml.XmlDocument
    $root = $xml.CreateElement("LayoutModificationTemplate", "http://schemas.microsoft.com/Start/2014/LayoutModification")
    $xml.AppendChild($root) | Out-Null
    $root.SetAttribute("xmlns:defaultlayout", "http://schemas.microsoft.com/Start/2014/FullDefaultLayout")
    $root.SetAttribute("xmlns:taskbar", "http://schemas.microsoft.com/Start/2014/TaskbarLayout")
    $root.SetAttribute("Version", "1")
    $collection = $xml.CreateElement("CustomTaskbarLayoutCollection", $root.NamespaceURI)
    $collection.SetAttribute("PinListPlacement", $PinListPlacement)
    $root.AppendChild($collection) | Out-Null
    $layout = $xml.CreateElement("defaultlayout:TaskbarLayout", $root.GetAttribute("xmlns:defaultlayout"))   
    $collection.AppendChild($layout) | Out-Null
    $pinList = $xml.CreateElement("taskbar:TaskbarPinList", $root.GetAttribute("xmlns:taskbar"))
    $layout.AppendChild($pinList) | Out-Null
    foreach ($lnk in $LnkPaths) {
        $desktopApp = $xml.CreateElement("taskbar:DesktopApp", $root.GetAttribute("xmlns:taskbar"))
        $desktopApp.SetAttribute("DesktopApplicationLinkPath", $lnk)
        $pinList.AppendChild($desktopApp) | Out-Null
    }
    $xml.Save($OutputPath)
}


$LnkPaths = @(
    "%ALLUSERSPROFILE%\Microsoft\Windows\Start Menu\Programs\Microsoft Edge.lnk"
    "%ALLUSERSPROFILE%\Microsoft\Windows\Start Menu\Programs\Windows PowerShell\Windows PowerShell ISE.lnk"
    "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Windows PowerShell\Windows PowerShell.lnk"
    "%APPDATA%\Microsoft\Windows\Start Menu\Programs\System Tools\File Explorer.lnk"
    "%ALLUSERSPROFILE%\Microsoft\Windows\Start Menu\Programs\Accessories\Notepad.lnk"
)
New-LayoutModificationXml -LnkPaths $LnkPaths -PinListPlacement "Replace"