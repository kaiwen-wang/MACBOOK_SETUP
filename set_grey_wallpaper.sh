#!/bin/bash

# Script to set macOS wallpaper to grey using built-in solid color
echo "Setting wallpaper to grey..."

# Use AppleScript to set desktop to solid grey color
osascript -e "
tell application \"System Events\"
    tell every desktop
        set picture to \"\"
    end tell
end tell
"

# Restart Dock to ensure wallpaper change takes effect immediately
killall Dock

echo "Wallpaper set to grey successfully!"