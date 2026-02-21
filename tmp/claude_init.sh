#!/bin/bash
# Claude Code init script for Home Assistant
# Run after fresh install: bash /config/tmp/claude_init.sh

# --- Home Assistant MCP Server ---

# Option 1: OAuth (authenticates via browser)
# claude mcp add-json "HA" '{
#   "type": "http",
#   "url": "https://ha.tommass.com/api/mcp",
#   "oauth": {
#     "clientId": "http://localhost:12345",
#     "callbackPort": 12345
#   }
# }'

# Option 2: Long-Lived Access Token
HA_TOKEN="${HA_TOKEN:-}"
if [ -z "$HA_TOKEN" ]; then
  read -rp "Enter Home Assistant Long-Lived Access Token: " HA_TOKEN
fi

if [ -z "$HA_TOKEN" ]; then
  echo "Error: No token provided. Exiting."
  exit 1
fi

claude mcp add-json "HA" "{
  \"type\": \"http\",
  \"url\": \"https://ha.tommass.com/api/mcp\",
  \"headers\": {
    \"Authorization\": \"Bearer ${HA_TOKEN}\"
  }
}"
