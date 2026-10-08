# MITRE ATT&CK Mapping

The report maps observed behavior to the following techniques:

| Technique | Name | Observed behavior |
|---|---|---|
| T1059.005 | Command and Scripting Interpreter: Visual Basic | VBScript used for execution/persistence |
| T1547.001 | Registry Run Keys / Startup Folder | Startup persistence |
| T1055.012 | Process Hollowing | Injection into `RegSvcs.exe` |
| T1056.001 | Keylogging | `GetAsyncKeyState` used for keystroke capture |
| T1012 | Query Registry | Registry queries for discovery and VM detection |
| T1082 | System Information Discovery | Computer name, GUID, language and hardware information |
| T1497.001 | System Checks: Virtualization/Sandbox Evasion | VirtualBox/VMware checks |
| T1071.001 | Web Protocols: HTTP/HTTPS | C2 communication |
| T1036.005 | Match Legitimate Name or Location | `WerFault.exe` used to disguise activity |
| T1041 | Exfiltration Over C2 Channel | Stolen information sent over C2 |
| T1027 | Obfuscated Files or Information | High-entropy `.rsrc` section |
| T1140 | Deobfuscate/Decode Files or Information | Runtime decoding of embedded content |
