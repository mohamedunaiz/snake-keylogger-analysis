# Snake Keylogger — Malware Analysis & Reverse Engineering

> **Educational / defensive cybersecurity research repository**

This repository contains the analysis summary and defensive detection artifacts from a controlled Snake Keylogger malware-analysis laboratory.

## Overview

The analysis examined a Snake Keylogger sample through:

- Static analysis
- Dynamic analysis
- Hybrid sandbox analysis using ANY.RUN
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
│   └── Analysis-Summary.md
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

The analysis identified:

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

This repository intentionally does **not** contain the malware executable. It contains defensive analysis documentation and detection artifacts.

For the detailed source report, use the original analysis PDF supplied with this project. The repository contains an analysis summary because the connected GitHub file-writing interface cannot upload binary PDF files directly.

## References

See `docs/IOCs.md`, `docs/MITRE-ATT&CK.md`, and `rules/snake_keylogger_autoit.yar` for the extracted defensive artifacts.
