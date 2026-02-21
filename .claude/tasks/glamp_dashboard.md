# GLamp Dashboard Upgrade — Full Task

## Status: Phase 1 DONE, Phase 2 TODO

## Overview

Upgrade the kid's WLED lamp dashboard (`/config/ui/dashboards/glamp.yaml`) from plain mushroom cards to beautiful square image-backed cards using `lovelace-card-mod`.

## What's Done

- [x] Card-mod installed via HACS
- [x] Card-mod resource added to `/config/configuration.yaml`
- [x] Test dashboard built at `/config/ui/dashboards/test.yaml` — 6 sample cards working
- [x] Approved card style: 200px square, background image, white icon (no bg circle), white bold text with shadow, tap scale-down
- [x] 6 test images downloaded to `/config/www/glamp/` (rainbow, fire, ocean, fairy, lava, sakura)
- [x] ComfyUI MCP setup script at `/config/tmp/claude_init.sh` (ComfyUI at `192.168.2.101:8188`)

## What's TODO

### Phase 2A: Generate All Images via ComfyUI

Generate 512x512 images using **Flux.1 Schnell** via ComfyUI MCP. Save all to `/config/www/glamp/`.

**Prompt template** (adjust per image):
```
[subject description], kid-friendly cartoon illustration style, vibrant colors, dark background, simple clean composition, no text
```

**Effects (30 images needed):**

| # | Filename | Prompt subject | Russian name | WLED effect |
|---|----------|---------------|--------------|-------------|
| 1 | `rainbow.jpg` | DONE (already exists) | Радуга | Rainbow |
| 2 | `fireworks.jpg` | colorful fireworks exploding in night sky, sparks and trails | Салют | Fireworks |
| 3 | `fire.jpg` | DONE (already exists) | Огонь | Fire 2012 |
| 4 | `aurora.jpg` | northern lights aurora borealis, green and purple curtains in sky | Сияние | Aurora |
| 5 | `fairy.jpg` | DONE (already exists) | Фея | Fairy |
| 6 | `stars.jpg` | twinkling stars in deep space, sparkling starfield | Звёзды | Twinkle |
| 7 | `candle.jpg` | warm candle flame glowing in darkness | Свеча | Candle |
| 8 | `lightning.jpg` | dramatic lightning bolt striking, electric discharge | Молния | Lightning |
| 9 | `heartbeat.jpg` | glowing neon heart pulsing with light | Сердце | Heartbeat |
| 10 | `ocean.jpg` | DONE (already exists) | Океан | Pacifica |
| 11 | `sparkle.jpg` | bright sparkles and glitter particles floating | Блеск | Sparkle |
| 12 | `colorloop.jpg` | swirling spiral of rainbow colors, color wheel | Цвета | Colorloop |
| 13 | `meteor.jpg` | bright meteor shooting across starry sky, glowing trail | Метеор | Meteor |
| 14 | `rain.jpg` | rain drops falling with soft blue glow | Дождь | Rain |
| 15 | `ghost.jpg` | cute cartoon ghost with eerie glow | Призрак | Ghost Rider |
| 16 | `balls.jpg` | colorful bouncing balls, rubber balls bouncing | Мячики | Bouncing Balls |
| 17 | `matrix.jpg` | green digital rain code falling, matrix style | Матрица | Matrix |
| 18 | `polar.jpg` | polar lights over snowy landscape, green glow | Полярное | Polar Lights |
| 19 | `waves.jpg` | colorful abstract sound waves, neon wave pattern | Волны | Colorwaves |
| 20 | `fox.jpg` | cute cartoon fox with twinkling lights around it | Лисичка | Twinklefox |
| 21 | `glitter.jpg` | silver and gold glitter sparkling particles | Глиттер | Glitter |
| 22 | `sunrise.jpg` | beautiful sunrise over horizon, warm orange sky | Рассвет | Sunrise |
| 23 | `lake.jpg` | calm lake with moonlight reflection, serene water | Озеро | Lake |
| 24 | `bees.jpg` | cute cartoon bees flying with yellow trails | Пчёлки | Crazy Bees |
| 25 | `popcorn.jpg` | popcorn kernels popping with warm glow | Попкорн | Popcorn |
| 26 | `dna.jpg` | glowing DNA double helix spiral, neon blue and green | ДНК | DNA Spiral |
| 27 | `plasma.jpg` | plasma ball with purple and blue electric arcs | Плазма | Plasma Ball |
| 28 | `flow.jpg` | flowing liquid light streams, teal and green | Поток | Flow |
| 29 | `starburst.jpg` | bright starburst explosion, radiating light rays | Взрыв | Fireworks Starburst |
| 30 | `dissolve.jpg` | particles dissolving into colorful dust cloud | Растворение | Dissolve Rnd |

**Palettes (20 images needed):**

| # | Filename | Prompt subject | Russian name | WLED palette |
|---|----------|---------------|--------------|--------------|
| 1 | `pal_rainbow.jpg` | rainbow color spectrum bands flowing | Радуга | Rainbow |
| 2 | `lava.jpg` | DONE (already exists) | Лава | Lava |
| 3 | `pal_ocean.jpg` | deep blue ocean gradient with light rays | Океан | Ocean |
| 4 | `forest.jpg` | lush green forest canopy, dappled light | Лес | Forest |
| 5 | `party.jpg` | colorful party lights, disco atmosphere | Вечеринка | Party |
| 6 | `pal_fire.jpg` | warm fire gradient, embers and flames | Пламя | Fire |
| 7 | `pal_aurora.jpg` | soft aurora glow, teal and green mist | Сияние | Aurora |
| 8 | `sakura.jpg` | DONE (already exists) | Сакура | Sakura |
| 9 | `garland.jpg` | colorful christmas string lights, C9 bulbs | Гирлянда | C9 |
| 10 | `candy.jpg` | pink and white candy swirl, sweet treats | Конфетка | Candy |
| 11 | `sunset.jpg` | dramatic sunset sky, orange purple clouds | Закат | Sunset |
| 12 | `beach.jpg` | tropical beach with turquoise water and sand | Пляж | Beach |
| 13 | `icefire.jpg` | ice and fire colliding, blue frost meets orange flame | Лёд и пламя | Icefire |
| 14 | `pastel.jpg` | soft pastel color blobs, gentle gradient | Пастель | Pastel |
| 15 | `cloud.jpg` | fluffy clouds with soft light | Облака | Cloud |
| 16 | `autumn.jpg` | golden autumn leaves falling, warm amber | Осень | Autumn |
| 17 | `bands.jpg` | bright rainbow stripes, parallel color bands | Полоски | Rainbow Bands |
| 18 | `fairy_reef.jpg` | magical purple coral reef with fairy lights | Фея | Fairy Reaf |
| 19 | `atlantica.jpg` | deep atlantic ocean, blue depths with light beams | Атлантика | Atlantica |
| 20 | `default.jpg` | soft neutral white and grey gradient glow | Обычный | Default |

**Total: 44 images to generate** (6 already exist from test phase).

### Phase 2B: Update glamp.yaml with Card-Mod Styles

After all images are in `/config/www/glamp/`, rewrite `/config/ui/dashboards/glamp.yaml`.

**Validated card-mod CSS pattern** (from test.yaml):
```yaml
- type: custom:mushroom-template-card
  primary: <Russian Name>
  icon: <mdi:icon>
  layout: vertical
  tap_action:
    action: call-service
    service: light.turn_on  # or select.select_option for palettes
    data:
      entity_id: light.wled  # or select.wled_color_palette
      effect: <Effect Name>  # or option: <Palette Name>
  card_mod:
    style:
      mushroom-shape-icon$: |
        .shape {
          --shape-color: none !important;
          --icon-color: #fff !important;
          --icon-size: 42px;
        }
      .: |
        ha-card {
          background: url('/local/glamp/<filename>.jpg') center/cover no-repeat !important;
          aspect-ratio: 1 / 1;
          max-width: 200px;
          border-radius: 16px !important;
          border: none !important;
          color: #fff !important;
          text-shadow: 0 2px 6px rgba(0,0,0,0.7);
          font-weight: 700;
          box-shadow: 0 4px 15px <themed-shadow-color> !important;
          transition: transform 0.2s ease, box-shadow 0.2s ease !important;
          overflow: hidden;
          display: flex;
          align-items: center;
          justify-content: center;
        }
        ha-card:active {
          transform: scale(0.95) !important;
        }
```

**Dashboard structure:**
```
vertical-stack
  ├── mushroom-light-card (frosted glass card_mod)
  ├── horizontal-stack: speed + intensity sliders (frosted glass card_mod)
  ├── horizontal-stack: section headers (transparent card_mod)
  └── horizontal-stack: 3 columns
        ├── vertical-stack: 15 effect cards (column 1)
        ├── vertical-stack: 15 effect cards (column 2)
        └── vertical-stack: 20 palette cards (column 3)
```

**Frosted glass CSS** (for light card and sliders):
```css
ha-card {
  background: rgba(255, 255, 255, 0.1) !important;
  backdrop-filter: blur(12px) !important;
  -webkit-backdrop-filter: blur(12px) !important;
  border: 1px solid rgba(255, 255, 255, 0.15) !important;
  border-radius: 24px !important;
  box-shadow: 0 8px 32px rgba(0, 0, 0, 0.25) !important;
}
```

**Section header CSS** (for markdown cards):
```css
ha-card {
  background: transparent !important;
  border: none !important;
  box-shadow: none !important;
}
```

### Phase 2C: Verify and Polish

- [ ] Reload dashboard in browser
- [ ] Check all 50 images load (no 404s)
- [ ] Verify tap actions work for all effects and palettes
- [ ] Test on mobile/tablet — cards should be tappable and readable
- [ ] Optional: add `switch.wled_nightlight` toggle card (bedtime mode)
- [ ] Optional: add `switch.wled_reverse` toggle card (fun for kids)

## Reference Files

| File | Purpose |
|------|---------|
| `/config/ui/dashboards/glamp.yaml` | Main dashboard to upgrade |
| `/config/ui/dashboards/test.yaml` | Working test with 6 styled cards |
| `/config/www/glamp/` | Image storage dir (`/local/glamp/` in HA) |
| `/config/configuration.yaml` | Card-mod resource already added (line 46) |
| `/config/tmp/glamp` | Full WLED entity attributes dump |
| `/config/tmp/claude_init.sh` | ComfyUI MCP setup script |

## WLED Entity Reference

- `light.wled` — main light entity (effects via `light.turn_on` + `effect:`)
- `select.wled_color_palette` — palette selector (via `select.select_option` + `option:`)
- `number.wled_speed` — effect speed (0-255)
- `number.wled_intensity` — effect intensity (0-255)
- `switch.wled_nightlight` — nightlight mode
- `switch.wled_reverse` — reverse effect direction
