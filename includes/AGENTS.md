# AGENTS.md — Includes Directory

## Purpose

Modular configuration fragments loaded into `configuration.yaml` via `!include` and `!include_dir_merge_list` directives. This directory keeps the main config clean by splitting entity definitions, automations, and sensor templates into separate files.

## Structure

```
includes/
├── automations/          # Automation YAML files (merged as list)
│   ├── main.yaml         # Core automations: lights, humidifier, air purifier
│   ├── norifications.yaml # Notification automations (14 automations)
│   └── switch.yaml       # Zigbee wall switch (Moes TS004F) button actions
├── sensor/               # Template sensor definitions (merged as list)
│   ├── vacuum.yaml       # Vacuum mop status template
│   ├── xiaomi_airpurifier.yaml  # Air purifier attribute sensors (AQI, filter, temp, etc.)
│   └── xiaomi_deerma.yaml       # Humidifier attribute sensors (temp, humidity, water)
├── fan.yaml              # Fan platform: Xiaomi Deerma humidifier + Air purifier (via xiaomi_miio_airpurifier)
├── vacuum.yaml           # Vacuum platform: Viomi V8 (via viomi_vacuum_v8)
├── input_select.yaml     # Dropdowns: humidifier_mode, airpurifier_mode
├── input_number.yaml     # Sliders: target humidity (40-70%), purifier level (0-14)
```

## How Includes Work

| configuration.yaml directive | Target | Method |
|------------------------------|--------|--------|
| `automation: !include_dir_merge_list includes/automations` | All `*.yaml` in `automations/` | Each file contains a YAML list of automations; all lists are merged |
| `template: !include_dir_merge_list includes/sensor` | All `*.yaml` in `sensor/` | Each file contains template sensor definitions |
| `fan: !include includes/fan.yaml` | Single file | Direct include |
| `vacuum: !include includes/vacuum.yaml` | Single file | Direct include |

## Conventions

- Files loaded via `!include_dir_merge_list` must be **YAML lists** (items start with `- `)
- Files loaded via `!include` are **YAML mappings** (key-value pairs)
- Automation aliases in Russian (Cyrillic)
- All device tokens via `!secret`
- When adding a new file to `automations/` or `sensor/`, it is automatically picked up — no changes to `configuration.yaml` needed

## Constraints

- Do NOT mix list and mapping formats — `automations/` files must be lists, `fan.yaml` must be a mapping
- Commented-out includes in `configuration.yaml` (`sensor`, `switch`, `number`, `humidifier`) are intentionally disabled — do not re-enable without checking for conflicts
