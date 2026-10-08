# Indicators of Compromise

The following indicators are documented in the malware analysis report.

## File Hashes

| Type | Value |
|---|---|
| MD5 | `8bc5d0081f7c99103331cb408e45601a` |
| SHA-1 | `796ade52d238971ed98543c7b4670f5e746d22b1` |
| Primary SHA-256 | `4b3fccf8e3e8cf25b5b63ba8f397687dd733fd884efe7c78083d154310f272e4` |
| Startup/launcher SHA-256 | `5dd26a5996a8fb517c6c00c424c165eec89e3d1e2cd1771dba8c8194ea89cb01` |
| WER dump SHA-256 | `9966f4f9193403c9b1f92f8a16f6ad22770186e3e6ec104cda5523475d8063e0` |
| Imphash | `4b00809` |

## File-System Indicators

- `C:\Users\[user]\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\unbarricading.vbs`
- `C:\Users\[user]\AppData\Local\Temp\...`
- `C:\ProgramData\Microsoft\Windows\WER\Temp\WERE00.tmp.dmp`

## Behavioral Indicators

- `malware.exe → unbarricading.exe → RegSvcs.exe → WerFault.exe`
- Process hollowing of `RegSvcs.exe`
- `wscript.exe` executing `unbarricading.vbs`
- VM detection through VirtualBox/VMware-related registry queries
- Keylogging through `GetAsyncKeyState`

## Network Indicators

- `login.live.com`
- `https://login.live.com/RST2.srf`
- Microsoft Dr. Watson-style traffic masquerading through `WerFault.exe`
- `Microsoft-CryptoAPI/10.0` user-agent noted in the report

> Treat domains such as `login.live.com` carefully: the report identifies the observed destination in this sample; the legitimate domain itself is not inherently malicious.
