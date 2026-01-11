# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a **Home Assistant configuration repository** for a smart home automation setup running Home Assistant 2025.12.5. The configuration uses YAML-based declarative definitions for dashboards, automations, and device integrations.

## Key Architecture

### Data Flow
```
BLE Devices (ATC MiThermometer sensors)
    ↓
ESP32 (ble-tracker via ESPHome)
    ↓
Home Assistant (entity registry: sensor.ble_tracker_*)
    ↓
Lovelace Dashboards (custom cards for visualization)
```

### Configuration Structure

- **`configuration.yaml`** - Main config with integrations, themes, dashboard references, and HTTP settings
- **`ui/dashboards/`** - Lovelace dashboard definitions in YAML mode (not UI-managed)
- **`esphome/`** - ESPHome device configurations for ESP32 BLE trackers
- **`custom_components/hacs/`** - HACS integration for community component management
- **`www/community/`** - Custom frontend cards (mini-graph-card, clock-weather-card, apexcharts-card, stack-in-card)
- **`themes/ios-themes/`** - iOS HomeKit-style themes
- **`blueprints/`** - Automation blueprint templates

### Secrets Management

Sensitive data (WiFi credentials, API keys) is stored in `secrets.yaml` (git-ignored). Reference secrets in configs using `!secret secret_name` syntax.

## Development Workflow

There is no build system - Home Assistant auto-loads YAML configurations on restart. To apply changes:
1. Edit YAML configuration files
2. Validate config: Use Home Assistant's built-in configuration check (Developer Tools → YAML → Check Configuration)
3. Reload or restart Home Assistant as needed

### ESPHome Devices

ESPHome configurations in `esphome/` are compiled and deployed separately using the ESPHome CLI or Home Assistant ESPHome add-on, not through this repository's git workflow.

## Dashboard Development

Dashboards use YAML mode (defined in `ui/dashboards/`). Key custom cards in use:
- **mini-graph-card**: Time-series sensor graphs
- **clock-weather-card**: Weather forecast display
- **apexcharts-card**: Advanced charting with ApexCharts
- **stack-in-card**: Card layout stacking
- **mushroom cards**: Modern UI controls

Cards are loaded from `/hacsfiles/` paths managed by HACS.

## Localization

Dashboard UI uses Russian language (Cyrillic) for room names and labels (e.g., "Гостинная" for Living Room, "Спальная" for Bedroom).

## Git Strategy

The `.gitignore` uses a **whitelist approach** - everything is ignored by default except explicitly allowed files. When adding new configuration files, update `.gitignore` to include them.
