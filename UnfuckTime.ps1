try {
    $S = [Net.Sockets.UdpClient]::new("pool.ntp.org", 123)
    $S.Send(([byte[]](,27 + ,0*47)), 48); $Raw = $S.Receive([ref][Net.IPEndPoint]::new(0,0))
    $S.Dispose()
    $Seconds = [BitConverter]::ToUInt32($Raw[43..40], 0)
    Set-Date -Date ([datetime]::new(1900,1,1).AddSeconds($Seconds).ToLocalTime())
}
catch {
    (New-Object -ComObject WScript.Shell).Popup("CHECK YOUR FUCKING CLOCK BITCH", 0, "FUCK YOU AND YOUR TIME", 16)
}
