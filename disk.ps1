$diskDevices = Get-WmiObject Win32_DiskDrive | Select-Object -ExpandProperty PNPDeviceID
foreach ($device in $diskDevices) {
    $escapedDevice = $device -replace "&", "^&"
    $removeCommand = "pnputil.exe /remove-device $escapedDevice /force"
    Start-Process -FilePath "cmd.exe" -ArgumentList "/c $removeCommand" -NoNewWindow -Wait
}