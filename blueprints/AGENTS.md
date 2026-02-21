# AGENTS.md — Blueprints

## Purpose

Reusable automation, script, and template blueprints provided by Home Assistant. These are factory-default templates that can be instantiated via the HA UI.

## Structure

```
blueprints/
├── automation/homeassistant/
│   ├── motion_light.yaml              # Motion-triggered light automation
│   └── notify_leaving_zone.yaml       # Notification when leaving a geographic zone
├── script/homeassistant/
│   └── confirmable_notification.yaml  # Notification with confirmation dialog
└── template/homeassistant/
    └── inverted_binary_sensor.yaml    # Inverted binary sensor template
```

## Conventions

- Blueprints are templates — they define `input:` parameters and are instantiated via the HA UI or YAML
- The `homeassistant/` subdirectory contains HA-provided defaults
- Custom blueprints can be added as new YAML files in the appropriate subdirectory

## Constraints

- Do NOT modify the default `homeassistant/` blueprints — they may be overwritten on HA updates
- Custom blueprints should be placed in their own subdirectory (e.g., `automation/custom/`)
