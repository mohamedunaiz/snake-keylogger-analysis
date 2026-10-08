# Snake Keylogger — Malware Analysis & Reverse Engineering

> **Educational / defensive cybersecurity research repository**

This repository contains the report and detection artifacts from a controlled Snake Keylogger malware-analysis laboratory.

## Overview

The analysis examined a Snake Keylogger sample through:

- Static analysis
- Dynamic analysis
- Hybrid sandbox analysis with ANY.RUN
- IOC extraction
- YARA detection engineering
- MITRE ATT&CK mapping
- Incident-response planning

The lab used an isolated REMnux + Windows 10 VirtualBox environment with a Host-Only network and INetSim for simulated network services.

## Key Findings

| Area | Finding |
|---|---|
| Malware family | Snake Keylogger |
| File type | PE32 executable |
| Reported builder | AutoIt3 |
| Keylogging | `GetAsyncKeyState` |
| Persistence | Startup folder / registry persistence |
| Injection | Process hollowing into `RegSvcs.exe` |
| C2 | HTTP/HTTPS activity |
| Masquerading | `WerFault.exe` / Microsoft Dr. Watson user-agent |
| Anti-analysis | VM/environment checks and timing checks |
| Primary SHA-256 | `4b3fccf8e3e8cf25b5b63ba8f397687dd733fd884efe7c78083d154310f272e4` |

## Repository Structure

```
snake-keylogger-analysis/
├── README.md
├── .gitignore
├── report/
│   └── Snake_Keylogger_Analysis_Report.pdf
├── rules/
│   └── snake_keylogger_autoit.yar
└── docs/
    ├── IOCs.md
    └── MITRE-ATT&CK.md
```

## Tools Used

- REMnux
- Windows 10 VM
- VirtualBox
- INetSim
- PEcheck
- Exeinfo PE
- Ghidra
- FLOSS
- Sysinternals Process Monitor
- Sysinternals Process Explorer
- Regshot
- ANY.RUN
- YARA

## Detection Highlights

The report identifies indicators including:

- `unbarricading.vbs`
- `unbarricading.exe`
- `RegSvcs.exe` process-hollowing behavior
- `WerFault.exe` used as a decoy
- `GetAsyncKeyState`
- `RegSetValueExW`
- `HttpOpenRequestW`
- `HttpSendRequestW`
- Suspicious Startup-folder and registry activity

## Safety Notice

**Do not execute the malware sample on a normal host, personal computer, production system, or unrestricted network.**

This repository intentionally contains the **analysis report and defensive detection artifacts**, not the malware executable itself.

If reproducing the lab, use an isolated disposable VM/sandbox and keep malware traffic contained.

## References

See the full report in `report/Snake_Keylogger_Analysis_Report.pdf` for the original analysis evidence and references.
