# Snake Keylogger — Malware Analysis & Reverse Engineering

> **Educational / defensive cybersecurity research repository documenting a controlled Snake Keylogger analysis.**

[![Focus](https://img.shields.io/badge/Focus-Malware%20Analysis-red)](#)
[![Detection](https://img.shields.io/badge/Detection-YARA-purple)](#)
[![ATT%26CK](https://img.shields.io/badge/Mapping-MITRE%20ATT%26CK-orange)](#)
[![Research](https://img.shields.io/badge/Type-Defensive%20Research-blue)](#)

## Overview

This repository presents a controlled malware-analysis project covering:

**Static Analysis → Dynamic Analysis → Hybrid Analysis → IOC Extraction → YARA Detection → ATT&CK Mapping → Incident Response**

## Lab Architecture

![Malware Analysis Lab Architecture](docs/visuals/lab-architecture.svg)

The project uses an isolated analysis environment with REMnux, a Windows VM, Host-Only networking and simulated Internet services.

## Key Findings

| Area | Finding |
|---|---|
| Malware family | Snake Keylogger |
| File type | PE32 executable |
| Reported builder | AutoIt3 |
| Keylogging | GetAsyncKeyState |
| Persistence | Startup folder / registry persistence |
| Injection | Process hollowing into RegSvcs.exe |
| C2 | HTTP/HTTPS activity |
| Masquerading | WerFault.exe / Microsoft Dr. Watson user-agent |
| Anti-analysis | VM/environment and timing checks |
| Primary SHA-256 | 4b3fccf8e3e8cf25b5b63ba8f397687dd733fd884efe7c78083d154310f272e4 |

## Detection

![Snake Keylogger IOC Map](docs/visuals/ioc-map.svg)

The project correlates file hashes, suspicious filenames, API usage, persistence artifacts, process behavior and network indicators.

See [docs/IOCs.md](docs/IOCs.md).

## YARA

Defensive rule:

[rules/snake_keylogger_autoit.yar](rules/snake_keylogger_autoit.yar)

## MITRE ATT&CK & Response

![Detection to ATT&CK to Response](docs/visuals/defense-mapping.svg)

See [docs/MITRE-ATT&CK.md](docs/MITRE-ATT&CK.md).

## Tools

REMnux • Windows 10 VM • VirtualBox • INetSim • PEcheck • Exeinfo PE • Ghidra • FLOSS • Process Monitor • Process Explorer • Regshot • ANY.RUN • YARA

## Safety

**Do not execute malware on a normal host, personal computer, production system or unrestricted network.**

This repository intentionally excludes the malware executable and focuses on defensive documentation and detection artifacts.

## Author

**Mohamed Unaiz** — Malware Analysis • Reverse Engineering • Cybersecurity Research