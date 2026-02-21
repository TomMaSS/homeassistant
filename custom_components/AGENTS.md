# AGENTS.md — Custom Components

## Purpose

Custom Home Assistant integrations installed via HACS or manually. These provide device support not available in core HA.

## Installed Components

| Directory | Integration | Purpose |
|-----------|------------|---------|
| `hacs/` | [HACS](https://hacs.xyz/) | Home Assistant Community Store — manages custom components and frontend cards |
| `viomi_vacuum_v8/` | Viomi Vacuum V8 | Custom platform for Viomi robot vacuum (`vacuum.baiden_n`) |
| `xiaomi_cloud_map_extractor/` | Xiaomi Cloud Map | Extracts vacuum cleaning maps from Xiaomi cloud (`camera.xiaomi_cloud_map_extractor`) |
| `xiaomi_miio_airpurifier/` | Xiaomi MiIO Air Purifier | Extended Xiaomi MiIO support for air purifier and humidifier (`fan.xiaomi_airpurifier`, `fan.xiaomi_deerma`) |

## Constraints

**DO NOT modify any files in this directory or its subdirectories.**

- These components are managed by HACS or installed from external repositories
- Manual edits will be overwritten on next HACS update
- To update components, use HACS UI in Home Assistant
- To add new custom components, install them through HACS
- If a component needs debugging, read the code but do not edit it — report issues upstream
