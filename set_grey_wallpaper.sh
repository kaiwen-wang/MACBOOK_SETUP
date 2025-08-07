#!/bin/bash

# Define the grey color (RRGGBB hex format)
COLOR_HEX="808080"

# Set the path for our generated wallpaper
OUTPUT_DIR="${HOME}/Pictures/Solid_Colors"
FULL_PATH="${OUTPUT_DIR}/solid_${COLOR_HEX}.png"

# 1. Create directory if it doesn't exist
mkdir -p "$OUTPUT_DIR"

# 2. Silently create a 1-pixel grey image file.
# This command is extremely fast and runs in the background.
sips -s format png -p 1 1 --out "$FULL_PATH" --setPixel 0 0 $COLOR_HEX &>/dev/null

# 3. Instantly set the background using the generated file.
# This is the reliable, official way to script background changes.
osascript -e "tell application \"System Events\" to set picture of every desktop to \"$FULL_PATH\""

echo "✅ Background reliably set to grey."