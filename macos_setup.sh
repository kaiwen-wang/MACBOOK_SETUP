#!/bin/bash

# ==============================================================================
# macOS Aggressive Dock Cleanup Script
#
# Description:
# This script forcefully removes all pinned app and folder icons from the Dock.
# It uses 'defaults delete' which is more effective than writing an empty array
# on modern macOS versions that try to "fix" an empty Dock.
# ==============================================================================

echo "› Forcefully clearing Dock settings..."

# --- Force Deletion of Pinned Icons ---
# This is the key change. We delete the preference keys entirely.
# When the Dock restarts, it will see they are missing and create them as empty.

echo "› Removing all persistent app icons..."
defaults delete com.apple.dock persistent-apps

echo "› Removing all persistent folder/file icons..."
defaults delete com.apple.dock persistent-others

# --- Re-apply the other desired settings ---

echo "› Applying other Dock settings..."
# Position the Dock on the left of the screen
# defaults write com.apple.dock orientation -string "left"

# Turn on Dock auto-hiding
defaults write com.apple.dock autohide -bool true

# Use the "scale" effect for minimizing windows
defaults write com.apple.dock mineffect -string "scale"

# Disable showing recent or suggested applications in the Dock
defaults write com.apple.dock show-recents -bool false


echo "› Settings applied. Restarting Dock to see changes..."

# Restart the Dock process to apply all changes.
killall Dock

echo "› Done! Your Dock has been reset."
echo "› NOTE: Finder and Trash will remain. Any running apps will appear temporarily."