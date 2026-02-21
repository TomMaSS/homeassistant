#!/bin/bash
# Claude Code init script for Home Assistant
# Run after fresh install: bash /config/tmp/claude_init.sh
set -euo pipefail

echo "=== Claude Code Environment Setup ==="

# --- System deps ---
# apt-get update
# apt-get install -y libatomic1

# --- Claude Code ---
# curl -fsSL https://claude.ai/install.sh | bash
# echo 'export PATH="$ROOT/.local/bin:$PATH"' >> ~/.zshrc

# --- Node.js (nvm) ---
# curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.4/install.sh | bash
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
# nvm install --lts
# nvm use --lts

# --- Source nvm ---
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

NODE_BIN=$(which node 2>/dev/null)
if [[ -z "$NODE_BIN" ]]; then
  echo "[ERROR] node not found. Install nvm + node first."
  exit 1
fi
echo "[node] $NODE_BIN ($(node --version))"

# --- Install ComfyUI MCP (if needed) ---
NPM_GLOBAL_ROOT=$(npm root -g)
MCP_SERVER_JS="${NPM_GLOBAL_ROOT}/mcp-comfy-ui-builder/dist/mcp-server.js"

if [[ ! -f "${MCP_SERVER_JS}" ]]; then
  echo "[ComfyUI MCP] Installing mcp-comfy-ui-builder..."
  npm install -g mcp-comfy-ui-builder
  MCP_SERVER_JS="${NPM_GLOBAL_ROOT}/mcp-comfy-ui-builder/dist/mcp-server.js"
fi
echo "[ComfyUI MCP] Server: ${MCP_SERVER_JS}"

# --- ComfyUI MCP Server (stdio) ---
COMFYUI_HOST="${COMFYUI_HOST:-http://192.168.2.101:8188}"

echo "[ComfyUI MCP] Registering as stdio server -> ${COMFYUI_HOST}"
claude mcp add-json "comfyui" "{
  \"type\": \"stdio\",
  \"command\": \"${NODE_BIN}\",
  \"args\": [\"${MCP_SERVER_JS}\"],
  \"env\": {\"COMFYUI_HOST\": \"${COMFYUI_HOST}\"}
}"

# --- Home Assistant MCP (uncomment to enable) ---
# HA_TOKEN="${HA_TOKEN:-}"
# if [ -z "$HA_TOKEN" ]; then
#   read -rp "Enter Home Assistant Long-Lived Access Token: " HA_TOKEN
# fi
# claude mcp add-json "HA" "{
#   \"type\": \"http\",
#   \"url\": \"https://ha.tommass.com/api/mcp\",
#   \"headers\": {
#     \"Authorization\": \"Bearer ${HA_TOKEN}\"
#   }
# }"

echo ""
echo "=== Setup Complete ==="
echo ""
echo "Registered MCP servers:"
echo "  - comfyui: stdio -> ${COMFYUI_HOST}"
echo ""
echo "Restart Claude Code to pick up MCP changes."
