$drive = gwmi win32_volume -Filter "DriveLetter = 'D:'"
$drive.DriveLetter = "K:"
$drive.Put()
sleep 10S
foreach ($disk in get-wmiobject Win32_DiskDrive -Filter "Partitions = 0"){ 
   $disk.DeviceID
   $disk.Index
   "select disk "+$disk.Index+"`r clean`r create partition primary`r format fs=ntfs unit=65536 quick`r active`r assign letter=D" | diskpart
}
