#!/bin/bash

# Define the grey color (RRGGBB hex format)
COLOR_HEX="545554"

# Set the path for our generated wallpaper
OUTPUT_DIR="${HOME}/Pictures/Solid_Colors"
FULL_PATH="${OUTPUT_DIR}/solid_${COLOR_HEX}.png"

# 1. Create directory if it doesn't exist
mkdir -p "$OUTPUT_DIR"

# 2. Silently create a 1-pixel grey image file.
# This command is extremely fast and runs in the background.
magick -size 1x1 xc:#$COLOR_HEX "$FULL_PATH"

# 3. Instantly set the background using the generated file.
# This is the reliable, official way to script background changes.
osascript -e "tell application \"System Events\" to set picture of every desktop to \"$FULL_PATH\""

echo "✅ Background reliably set to grey."

# 4. Disable system transparency
defaults write com.apple.universalaccess reduceTransparency -bool true
killall Dock 2>/dev/null || true
echo "✅ System transparency disabled."
