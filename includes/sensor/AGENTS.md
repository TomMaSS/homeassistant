# AGENTS.md — Template Sensors

## Purpose

Template sensor definitions that extract device attributes into standalone HA sensor entities. Loaded via `template: !include_dir_merge_list includes/sensor` — each file must be a **YAML list**.

## Key Files

| File | Device | Sensors Created |
|------|--------|-----------------|
| `vacuum.yaml` | `vacuum.baiden_n` | `sensor.vlazhnaia_uborka` (mop status: да/нет) |
| `xiaomi_airpurifier.yaml` | `fan.xiaomi_airpurifier` | AQI, temperature, humidity, filter life, filter hours, motor speed, average AQI, mode |
| `xiaomi_deerma.yaml` | `fan.xiaomi_deerma` | Temperature, humidity, mode, target humidity, speed, water tank status |

## Template Sensor Pattern

```yaml
- sensor:
    - name: "Human Readable Name"
      unique_id: snake_case_id
      unit_of_measurement: "unit"
      icon: mdi:icon-name
      state: "{{ state_attr('entity.id', 'attribute_name') }}"
```

## Entity Attribute Map

### Air Purifier (`fan.xiaomi_airpurifier`)
| Attribute | Sensor | Unit |
|-----------|--------|------|
| `aqi` | `sensor.air_purifier_aqi` | AQI |
| `temperature` | `sensor.air_purifier_temperature` | °C |
| `humidity` | `sensor.air_purifier_humidity` | % |
| `filter_life_remaining` | `sensor.air_purifier_filter_life` | % |
| `filter_hours_used` | `sensor.air_purifier_filter_hours` | ч |
| `motor_speed` | `sensor.air_purifier_motor_speed` | об/мин |
| `average_aqi` | `sensor.air_purifier_average_aqi` | AQI |
| `preset_mode` | `sensor.air_purifier_mode` | — |

### Humidifier (`fan.xiaomi_deerma`)
| Attribute | Sensor | Unit |
|-----------|--------|------|
| `temperature` | `sensor.air_humidifier_temperature` | °C |
| `humidity` | `sensor.air_humidifier_humidity` | % |
| `mode` | `sensor.air_humidifier_mode` | — |
| `target_humidity` | `sensor.air_humidifier_target_humidity` | % |
| `no_water` | `sensor.air_humidifier_water` | — |

## Conventions

- Sensor `name` in English (HA creates entity IDs from names)
- `unique_id` is required for each sensor (enables UI customization)
- Use `state_attr()` to extract attributes from parent entities
- Units: Russian abbreviations where applicable (ч = hours, об/мин = RPM)

## Constraints

- Each file must be a YAML **list** starting with `- sensor:`
- Do NOT create template sensors for data already exposed as native HA entities
- Sensor `unique_id` must be globally unique across all template files
