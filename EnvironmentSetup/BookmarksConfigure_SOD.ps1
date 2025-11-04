#Booksmarks stored here
$source = "C:\ClassFiles-KL\Bookmarks"
$destination = "C:\Users\Administrator.ADATUM\AppData\Local\Microsoft\Edge\User Data\Default\"

if (!(Test-Path -Path $destination)) {
    Write-Host "Destination Path: $destination Does Not Exist"
    } else {
    Copy-Item -Path $source -Destination $destination
}

