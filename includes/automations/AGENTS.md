# AGENTS.md — Automations

## Purpose

Home Assistant automation definitions. All files in this directory are merged via `!include_dir_merge_list` — each file must contain a **YAML list** of automation items.

## Key Files

| File | Content | Automations |
|------|---------|-------------|
| `main.yaml` | Core device automations | Scheduled lights (елка, гирлянда, midnight off), humidifier mode/humidity sync, air purifier mode/level sync |
| `norifications.yaml` | Push notifications (14 automations) | Battery low, sensor offline, CPU high, disk full, HA restart, AQI, filter replace, water empty, extreme temp, low humidity, vacuum done/error, device offline, HA update |
| `switch.yaml` | Zigbee wall switch button actions | Moes 4-button switch: btn1=lamp, btn2=елка, btn3=гирлянда, btn4=test notification |

## Automation Structure

Every automation must follow this pattern:

```yaml
- id: unique_snake_case_id
  alias: "Описание на русском языке"
  triggers:
    - trigger: <type>
      <trigger_config>
  actions:
    - action: <service>
      target:
        entity_id: <entity>
      data:
        <service_data>
```

## Key Entities Used

| Entity | Type | Used In |
|--------|------|---------|
| `switch.elka_socket_1` | Switch | Christmas tree on/off |
| `switch.girlianda_socket_1` | Switch | Garland on/off |
| `light.nastolnaia_lampa` | Light | Desk lamp control |
| `fan.xiaomi_deerma` | Fan | Humidifier (via xiaomi_miio_airpurifier platform) |
| `fan.xiaomi_airpurifier` | Fan | Air purifier (via xiaomi_miio_airpurifier platform) |
| `vacuum.baiden_n` | Vacuum | Viomi vacuum |
| `input_select.humidifier_mode` | Input Select | Humidifier mode sync |
| `input_select.airpurifier_mode` | Input Select | Purifier mode sync |
| `input_number.airhumidifier_target_humidity` | Input Number | Humidity target sync |
| `input_number.airpurifier_favorite_level` | Input Number | Purifier level sync |
| `notify.mobile_app_iphone_artem` | Notification | All push notifications target |

## Zigbee Wall Switch (switch.yaml)

MQTT-based via Zigbee2MQTT. Topic: `zigbee2mqtt/moes_zigbee_black_4_buttons_switch/action`

| Payload | Action |
|---------|--------|
| `1_single` | Lamp on (1% brightness) |
| `1_double` | Lamp 50% brightness |
| `1_hold` | Lamp off |
| `2_single` / `2_hold` | Елка on / off |
| `3_single` / `3_hold` | Гирлянда on / off |
| `4_single` | Test notification |

## Conventions

- Automation `id` must be unique across ALL files in this directory
- Automation `alias` in Russian (Cyrillic)
- Group related automations with YAML comments using section headers: `# === SECTION NAME ===`
- Notification automations: always use `notify.mobile_app_iphone_artem` as the target
- Bidirectional sync pattern (humidifier/purifier): one automation for UI→device, another for device→UI

## Constraints

- Each file must be a YAML **list** (items start with `- `)
- Do NOT duplicate automation IDs across files
- Note: `norifications.yaml` filename has a typo ("norifications" instead of "notifications") — preserve this to avoid breaking git history
