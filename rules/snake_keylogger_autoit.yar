rule Snake_Keylogger_AutoIt_Variant {
    meta:
        author = "Analysis report"
        description = "Detects characteristics documented for a Snake Keylogger AutoIt3 variant"
        sha256 = "4b3fccf8e3e8cf25b5b63ba8f397687dd733fd884efe7c78083d154310f272e4"
        malware_family = "SnakeKeylogger"
        severity = "HIGH"
        reference = "MalwareBazaar"

    strings:
        $autoit_magic = { 41 75 74 6F 49 74 }
        $autoit_ver = "AutoIt3 [v3.3.3" ascii nocase
        $startup_vbs = "unbarricading.vbs" ascii nocase wide
        $startup_exe = "unbarricading.exe" ascii nocase wide
        $hollow_target = "RegSvcs.exe" ascii nocase wide
        $werfault_ua = "Microsoft Dr. Watson" ascii nocase
        $c2_login = "login.live.com" ascii nocase wide
        $http_send = "HttpSendRequestW" ascii
        $http_open = "HttpOpenRequestW" ascii
        $key_api = "GetAsyncKeyState" ascii
        $clip_api = "GetClipboardData" ascii
        $reg_persist = "RegSetValueExW" ascii
        $reg_path = "Software\\Microsoft\\Windows\\CurrentVersion\\Run" ascii nocase wide
        $anti_vm1 = "VBOX" wide ascii nocase
        $anti_vm2 = "VMware" wide ascii nocase
        $tick_count = "GetTickCount" ascii

    condition:
        uint16(0) == 0x5A4D and
        filesize < 5MB and
        ($autoit_magic or $autoit_ver) and
        ($startup_vbs or $startup_exe) and
        $hollow_target and
        ($key_api and $reg_persist) and
        ($http_send or $http_open or $c2_login)
}
