#!/bin/bash
# Downloads every extension in chrome-extensions.json as a .crx into ./helium-crx/
# Hits Google's REAL update endpoint directly (curl), bypassing Helium/ungoogled-chromium's
# scrambled Web Store domains. Then drag the .crx files onto helium://extensions
# (Developer mode ON) to install them.
#
# Usage: bash download-crx.sh
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
JSON="$SCRIPT_DIR/chrome-extensions.json"
OUT="$SCRIPT_DIR/helium-crx"
PRODVERSION="9999.0"  # high so the store never replies "no update for your version"

[ -f "$JSON" ] || { echo "Missing $JSON"; exit 1; }
mkdir -p "$OUT"

# Pull IDs (accept either key capitalization).
IDS=$(python3 -c "
import json
d=json.load(open('$JSON'))
e=d.get('ExtensionInstallForcelist') or d.get('ExtensionInstallForceList') or []
print('\n'.join(x['id'] for x in e))
")

total=$(echo "$IDS" | grep -c .)
i=0; ok=0; fail=0
for id in $IDS; do
  i=$((i+1))
  url="https://clients2.google.com/service/update2/crx?response=redirect&acceptformat=crx2,crx3&prodversion=${PRODVERSION}&x=id%3D${id}%26installsource%3Dondemand%26uc"
  dest="$OUT/$id.crx"
  printf "[%2d/%d] %s ... " "$i" "$total" "$id"
  if curl -sLf -o "$dest" "$url" && [ "$(head -c4 "$dest")" = "Cr24" ]; then
    echo "ok ($(wc -c < "$dest") bytes)"; ok=$((ok+1))
  else
    echo "FAILED"; rm -f "$dest"; fail=$((fail+1))
  fi
done

echo ""
echo "Done: $ok ok, $fail failed -> $OUT"
echo "Install: open helium://extensions, enable Developer mode, drag the .crx files in."
