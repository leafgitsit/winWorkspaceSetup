FOLDER CONTENTS:
-BookmarksConfigure_SOD.ps1
-BookmarkersSaveForUpload_EOD.ps1
-QuickAccess_SOD_v.2.ps1
-New-LayoutFunction.ps1
-ResetTaskbar.ps1

CONTENT DESC:
BookmarksConfigure_SOD.ps1 "Start of Day"
	- Copy Bookmarks from Class Files into Windows Edge Bookmarks 
	location on Administrator.ADATUM

BookmarkersSaveForUpload_EOD.ps1 "End of Day"
	- Copy Bookmarks from Windows Edge Bookmarks location on Administrator.ADATUM
	to Class Files for upload

QuickAccess_SOD.ps1 "Start of Day"
	- Pin ClassFiles-KL, Day-#, Samples and Export to Quick Access
	-Copy Over DayLabs

New-LayoutFunction.ps1 "Start of Day"
	- Pin Essential application shortcuts to taskbaar
	- Will create new layout but will not work until use ResetTaskbar.ps1
ResetTaskbar.ps1 "Start of Day"
	- Resets user taskbar to implement Layout modication created by 
	New-LayoutFunction.ps1
