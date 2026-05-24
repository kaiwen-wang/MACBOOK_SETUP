#!/bin/bash
# Installs Chrome extensions via enterprise policy (silent, no tabs).
# Uses ExtensionInstallForceList — extensions install and update silently.
#
# Usage: bash chrome-setup.sh
#        bash chrome-setup.sh --browser chrome
#        bash chrome-setup.sh --browser helium
#        bash chrome-setup.sh --browser chromium

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

BROWSER="${1:-chrome}"
case "$BROWSER" in
  chrome|google-chrome)
    APP="Google Chrome"
    APP_PATH="/Applications/Google Chrome.app"
    POLICY_DIR="$HOME/Library/Application Support/Google/Chrome/policies/managed"
    ;;
  helium)
    APP="Helium"
    APP_PATH="/Applications/Helium.app"
    POLICY_DIR="$HOME/Library/Application Support/Helium/policies/managed"
    ;;
  chromium)
    APP="Chromium"
    APP_PATH="/Applications/Chromium.app"
    POLICY_DIR="$HOME/Library/Application Support/Chromium/policies/managed"
    ;;
  *)
    echo "Unknown browser: $BROWSER"
    echo "Usage: $0 [chrome|helium|chromium]"
    exit 1
    ;;
esac

if [ ! -f "$SCRIPT_DIR/chrome-extensions.json" ]; then
  echo "Missing chrome-extensions.json. Run chrome-extract.sh first."
  exit 1
fi

if [ ! -d "$APP_PATH" ]; then
  echo "$APP not found at $APP_PATH"
  echo "Install it first, then run this script."
  exit 1
fi

echo "Installing extensions for $APP via enterprise policy..."

mkdir -p "$POLICY_DIR"
cp "$SCRIPT_DIR/chrome-extensions.json" "$POLICY_DIR/extensions.json"

echo "Policy written to: $POLICY_DIR/extensions.json"

# Quit if running
if pgrep -x "$APP" &>/dev/null; then
  echo "Quitting $APP..."
  osascript -e "tell application \"$APP\" to quit"
  sleep 1
fi

# Relaunch
echo "Launching $APP..."
open -a "$APP_PATH"

echo ""
echo "Done! Extensions are installed and managed by policy:"
echo "  - Installed silently (no user prompts)"
echo "  - Pinned (cannot be removed manually)"
echo "  - Auto-updated via Chrome Web Store"
echo ""

# Show what was installed
echo "Installed extensions:"
python3 -c "
import json
with open('$SCRIPT_DIR/chrome-extensions.json') as f:
    data = json.load(f)
for e in data.get('ExtensionInstallForceList', []):
    print(f'  {e[\"id\"]}')
"
