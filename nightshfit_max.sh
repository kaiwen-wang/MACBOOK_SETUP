#!/bin/bash

# 1. Install nightlight if not present
if ! command -v nightlight &> /dev/null; then
    echo "Nightlight tool not found. Installing via Homebrew..."
    brew tap smudge/smudge
    brew install nightlight
fi

# 2. Set the color temperature to 100 (Maximum Warmth)
nightlight temp 100

# 3. Set the schedule to effectively 24 hours
# This prevents macOS from turning it off automatically at sunrise.
nightlight schedule 00:00 23:59

# 4. Force enable it right now
nightlight on

echo "✅ Night Shift is now permanently ON at MAXIMUM warmth."