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

echo "› Removing all persistent app icons except Safari..."
defaults write com.apple.dock persistent-apps -array '<dict><key>GUID</key><integer>1</integer><key>tile-data</key><dict><key>bundle-identifier</key><string>com.apple.Safari</string><key>dock-extra</key><false/><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/Safari.app</string><key>_CFURLStringType</key><integer>0</integer></dict><key>file-label</key><string>Safari</string><key>file-mod-date</key><integer>0</integer><key>file-type</key><integer>41</integer><key>parent-mod-date</key><integer>0</integer></dict><key>tile-type</key><string>file-tile</string></dict>'

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