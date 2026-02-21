# AGENTS.md — Frontend Assets (www)

## Purpose

Custom frontend cards and static assets served by Home Assistant at the `/local/` URL path. The `community/` subdirectory is managed by HACS.

## Structure

```
www/
└── community/                          # HACS-managed frontend cards
    ├── apexcharts-card/                # Advanced charting (ApexCharts)
    ├── clock-weather-card/             # Clock & weather forecast display
    ├── lovelace-mushroom/              # Mushroom cards (modern UI controls)
    ├── lovelace-xiaomi-vacuum-card/    # Xiaomi vacuum control card
    ├── mini-graph-card/                # Time-series sensor graphs
    ├── mini-humidifier/                # Humidifier control card
    └── stack-in-card/                  # Card layout stacking utility
```

## Card Loading

Cards are registered in `configuration.yaml` under `lovelace.resources` using `/hacsfiles/<card>/` paths:

| Card | Resource URL |
|------|-------------|
| mini-graph-card | `/hacsfiles/mini-graph-card/mini-graph-card-bundle.js` |
| clock-weather-card | `/hacsfiles/clock-weather-card/clock-weather-card.js` |
| apexcharts-card | `/hacsfiles/apexcharts-card/apexcharts-card.js` |
| stack-in-card | `/hacsfiles/stack-in-card/stack-in-card.js` |
| mushroom | `/hacsfiles/lovelace-mushroom/mushroom.js` |
| mini-humidifier | `/hacsfiles/mini-humidifier/mini-humidifier-bundle.js` |
| xiaomi-vacuum-card | `/hacsfiles/lovelace-xiaomi-vacuum-card/xiaomi-vacuum-card.js` |

## Constraints

**DO NOT modify any files in `community/` subdirectories.**

- All community cards are managed by HACS — manual edits will be overwritten on update
- To add a new custom card: install via HACS, then register the resource URL in `configuration.yaml`
- Custom non-HACS assets can be placed directly in `www/` (accessible at `/local/<filename>`)
