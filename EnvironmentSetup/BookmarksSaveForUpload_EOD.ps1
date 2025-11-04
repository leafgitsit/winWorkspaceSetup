#Booksmarks stored here
$source = "C:\Users\Administrator.ADATUM\AppData\Local\Microsoft\Edge\User Data\Default\Bookmarks"
$destination = "C:\ClassFiles-KL\Bookmarks"

if (!(Test-Path -Path $source)) {
    Write-Host "Source Path: $source Does Not Exist"
    } else {
    Copy-Item -Path $source -Destination $destination
    Write-Host "Successfully Copied EOD Bookmarks to $destination"
}

