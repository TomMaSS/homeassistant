# AGENTS.md — Zigbee2MQTT

## Purpose

Zigbee2MQTT configuration for the Zigbee device coordinator. Bridges Zigbee devices to Home Assistant via MQTT.

## Key Files

| File | Purpose |
|------|---------|
| `configuration.yaml` | Main Zigbee2MQTT config: MQTT broker, serial port, network settings, device list |
| `coordinator_backup.json` | Coordinator state backup (auto-generated) |
| `database.db` | Zigbee device database (auto-generated) |
| `state.json` | Current device states (auto-generated) |
| `log/` | Timestamped log directories |

## Configuration

- **MQTT broker**: `mqtt://core-mosquitto:1883` (user: `mqtt_user`)
- **Serial port**: `/dev/ttyACM0` (adapter: zstack, baudrate: 115200)
- **Zigbee channel**: 11
- **Frontend**: enabled on port 8099

## Paired Devices

| IEEE Address | Friendly Name | Type |
|-------------|---------------|------|
| `0x60a423fffefc8181` | `moes_zigbee_black_4_buttons_switch` | Moes 4-button wall switch (TS004F) |

## MQTT Topics

- Base topic: `zigbee2mqtt/`
- Device actions: `zigbee2mqtt/<friendly_name>/action`
- Button payloads: `<button_number>_single`, `<button_number>_double`, `<button_number>_hold`

## Conventions

- Device `friendly_name` is used in MQTT topics and HA entity naming
- Use descriptive snake_case names for devices
- Automations consuming Zigbee actions use `platform: mqtt` triggers in `includes/automations/switch.yaml`

## Constraints

- Do NOT modify `database.db`, `state.json`, or `coordinator_backup.json` — they are auto-managed
- MQTT password is stored in plaintext in `configuration.yaml` — consider moving to secrets
- The `network_key` and `ext_pan_id` are sensitive — do not expose or share
- Adding new Zigbee devices requires physical pairing through the Zigbee2MQTT frontend (port 8099)
