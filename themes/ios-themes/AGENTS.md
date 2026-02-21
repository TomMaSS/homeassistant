# AGENTS.md — iOS Themes

## Purpose

iOS HomeKit-inspired UI themes for the Home Assistant frontend. Loaded via `frontend: themes: !include_dir_merge_named themes` in `configuration.yaml`.

## Key Files

| File | Purpose |
|------|---------|
| `ios-themes.yaml` | All theme definitions (light and dark variants for multiple color schemes) |
| `homekit-bg-*.jpg` | Background images for each color variant (blue-red, dark-blue, dark-green, light-blue, light-green, orange, red) |

## Theme Naming Pattern

- `ios-light-mode-<color>-alternative` — Light mode variants
- `ios-dark-mode-<color>-alternative` — Dark mode variants

## Source

Based on [basnijholt/lovelace-ios-themes](https://github.com/basnijholt/lovelace-ios-themes).

## Conventions

- Background images referenced as `/local/ios-themes/homekit-bg-<color>.jpg`
- CSS variables follow HA theme spec: `primary-color`, `accent-color`, `primary-text-color`, etc.
- Theme applied per dashboard via `theme: <theme-name>` in dashboard YAML

## Constraints

- Do NOT delete background images — they are referenced by theme definitions
- Theme changes are cosmetic only — they do not affect entity behavior
- To add a new theme variant, follow the existing CSS variable structure
