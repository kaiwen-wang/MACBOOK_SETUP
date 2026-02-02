#!/bin/bash

# Set Finder to open ~/Downloads by default instead of Recents

echo "Setting Finder default location to ~/Downloads..."

# Set new Finder windows to open ~/Downloads
# NewWindowTarget: PfLo = Path for Location
# NewWindowTargetPath: file path to open
defaults write com.apple.finder NewWindowTarget -string "PfLo"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/Downloads/"

# Restart Finder to apply changes
killall Finder

echo "✓ Finder default location set to ~/Downloads"
echo "New Finder windows will now open ~/Downloads instead of Recents"
