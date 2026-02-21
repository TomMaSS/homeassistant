# AGENTS.md — Lovelace Dashboards

## Purpose

YAML-mode Lovelace dashboard definitions. These are NOT UI-managed — all changes must be made by editing YAML files directly.

## Key Files

| File | Dashboard Title | Content |
|------|----------------|---------|
| `rooms.yaml` | "Home Assistant - сервер" | Room views: Гостинная (living room), Спальная (bedroom), Веранда (veranda) with climate sensors, lights, vacuum, humidifier, air purifier |
| `lights.yaml` | "Освещение" | Lighting control: desk lamp, Christmas tree, garland, quick action chips |
| `server.yaml` | "Сервер" | System monitoring: CPU, RAM, disk, load graphs |
| `test.yaml` | "Home Assistant - test" | Development/testing dashboard for trying new cards |

## Available Custom Cards

These cards are installed via HACS and loaded in `configuration.yaml` resources:

| Card | Type | Use For |
|------|------|---------|
| `custom:mushroom-light-card` | Light control | Brightness, color temp, color picker with `use_light_color` |
| `custom:mushroom-entity-card` | Entity toggle | Switches with `tap_action: toggle` and `icon_color` |
| `custom:mushroom-chips-card` | Quick actions | Service call chips in horizontal row |
| `custom:mini-graph-card` | Sensor graphs | Time-series with `hours_to_show`, `points_per_hour`, `fill: fade` |
| `custom:clock-weather-card` | Weather | Forecast display with `weather.forecast_home` entity |
| `custom:apexcharts-card` | Advanced charts | ApexCharts-based visualization |
| `custom:stack-in-card` | Layout | Nest cards without borders |
| `custom:xiaomi-vacuum-card` | Vacuum control | Viomi vacuum status and buttons |
| `custom:xiaomi-vacuum-map-card` | Vacuum map | Live map from `camera.xiaomi_cloud_map_extractor` |
| `custom:mini-humidifier` | Humidifier | Custom Deerma humidifier control |

## Conventions

- All card labels, section headers, and names MUST be in **Russian (Cyrillic)**
- Use `vertical-stack` with `markdown` content headers to group card sections (e.g., `**Свет**`, `**Климат**`, `**Ресурсы**`)
- Mushroom cards: always set `fill_container: true` for consistent sizing
- Mushroom light cards: enable `show_brightness_control`, `show_color_temp_control`, `show_color_control`, `use_light_color`
- Mushroom entity cards for switches: use `tap_action: action: toggle`
- Mini-graph-card: standard pattern is `hours_to_show: 24`, `points_per_hour: 1`, `show: graph: line, fill: fade, extrema: true`
- Dashboard registration in `configuration.yaml` requires a hyphen in the key (e.g., `lovelace-rooms`)

## Constraints

- Do NOT switch dashboards to UI mode
- Do NOT reference cards that are not listed in `configuration.yaml` lovelace resources
- `test.yaml` is the sandbox — test new card configurations here before adding to production dashboards
