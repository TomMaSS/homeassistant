# AGENTS.md — ESPHome Configurations

## Purpose

ESPHome device configurations for ESP32-based BLE proximity trackers. These devices scan for Xiaomi ATC MiThermometer BLE sensors and report temperature, humidity, and battery data to Home Assistant.

## Key Files

| File | Purpose |
|------|---------|
| `ble-tracker.yaml` | Main ESP32 BLE tracker device — scans and reports all BLE sensors |
| `secrets.yaml` | ESPHome-specific secrets (WiFi passwords) — git-ignored |
| `archive/test.yaml` | Archived/experimental configs |

## Device: ble-tracker

- **Board**: `esp-wrover-kit`
- **Framework**: `esp-idf` (smaller binaries, better performance)
- **Platform**: `atc_mithermometer` sensors via `esp32_ble_tracker`
- **Features**: WiFi, API, OTA, web server on port 80, captive portal fallback

## Active BLE Sensors

| MAC Address | Room | HA Entity Prefix |
|------------|------|------------------|
| `A4:C1:38:40:CC:6C` | BedRoom | `sensor.ble_tracker_bedroom_*` |
| `A4:C1:38:99:86:B4` | ChildRoom | `sensor.ble_tracker_childroom_*` |
| `A4:C1:38:55:50:09` | LivingRoom | `sensor.ble_tracker_livingroom_*` |

Each sensor exposes: `temperature`, `humidity`, `battery_level`, `battery_voltage`

Commented-out sensors: Kitchen, BathRoom, Balcony (MAC addresses preserved for future use).

## Conventions

- Sensor names in ESPHome use English room names (e.g., "BedRoom Temperature") — HA converts to entity IDs like `sensor.ble_tracker_bedroom_temperature`
- Device name uses hyphens: `ble-tracker` (DHCP compatibility)
- WiFi credentials use `!secret home_wifi_password`

## Constraints

- ESPHome configs are compiled and deployed **separately** via ESPHome CLI or HA add-on — NOT through git workflow
- Do NOT expose WiFi passwords in YAML — use `!secret`
- The fallback AP password in `ble-tracker.yaml` is hardcoded (consider moving to secrets)
- Adding a new sensor requires the BLE MAC address of the physical device
