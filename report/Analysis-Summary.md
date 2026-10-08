# Snake Keylogger — Analysis Summary

## Executive Summary

This laboratory exercise documented a controlled analysis of a Snake Keylogger sample using static, dynamic and hybrid analysis. The sample was analyzed in an isolated REMnux + Windows 10 VirtualBox environment.

The analysis identified keylogging, persistence, process hollowing, C2 communication, masquerading and anti-analysis behavior.

## Environment
- REMnux Linux analysis VM
- Windows 10 victim VM
- VirtualBox
- Host-Only networking
- INetSim for simulated network services

## Static Analysis

The sample was identified as a PE32 executable associated with AutoIt3. Analysis used PEcheck, Exeinfo PE, Ghidra and FLOSS.

Important capabilities and strings included:
- GetAsyncKeyState for keylogging
- RegSetValueExW and Windows Run-key related persistence
- HttpOpenRequestW / HttpSendRequestW for HTTP communication
- CreateProcessA for child-process creation
- GetTickCount for timing/anti-analysis behavior

## Dynamic / Hybrid Analysis

The observed execution chain was:

malware.exe → unbarricading.exe → RegSvcs.exe → WerFault.exe → C2 communication

The analysis documented process hollowing into the legitimate RegSvcs.exe process and use of WerFault.exe as a decoy for network activity.

Persistence involved unbarricading.vbs in the Windows Startup folder.

## Primary SHA-256

4b3fccf8e3e8cf25b5b63ba8f397687dd733fd884efe7c78083d154310f272e4

## Detection Engineering

A YARA rule is provided in rules/snake_keylogger_autoit.yar. The rule combines PE validation, AutoIt characteristics, persistence artifacts, process-hollowing indicators, keylogging APIs and HTTP/C2 indicators.

## MITRE ATT&CK

The report mapped observed behavior to T1059.005, T1547.001, T1055.012, T1056.001, T1012, T1082, T1497.001, T1071.001, T1036.005, T1041, T1027 and T1140.

## Incident Response

The report recommends detection, containment, eradication and recovery actions based on the observed behavior. Key actions include isolating infected hosts, preserving forensic evidence, removing persistence, scanning/reimaging where appropriate, changing potentially compromised credentials, enabling MFA and reviewing network logs.

## Safety

The repository does not contain the malware executable. Analysis of malware should only be performed in an isolated, disposable laboratory environment with controlled networking.