#!/bin/bash

# ==============================================================================
# macOS Dock Setup Script
#
# Description:
# This script configures the Dock with the following settings:
#   - Positions the Dock on the left side of the screen.
#   - Turns on Dock auto-hiding.
#   - Removes all persistent app icons from the Dock.
#   - Sets the minimize window effect to "scale".
#   - Disables showing recent or suggested applications in the Dock.
#
# Author: Your Name
# Date:   October 26, 2023
# ==============================================================================

echo "› Configuring Dock settings..."

# Position the Dock on the left of the screen
defaults write com.apple.dock orientation -string "left"

# Set the icon size of Dock items to 36 pixels (optional, a good default)
# defaults write com.apple.dock tilesize -int 36

# Turn on Dock auto-hiding
defaults write com.apple.dock autohide -bool true

# Set the animation speed for showing/hiding the Dock (0 = no animation)
# defaults write com.apple.dock autohide-time-modifier -float 0;

# Use the "scale" effect for minimizing windows
defaults write com.apple.dock mineffect -string "scale"

# Don't show suggested and recent apps in the Dock
defaults write com.apple.dock show-recents -bool false

# Remove all persistent app icons from the Dock
# Note: This leaves Finder and Trash, which are handled separately.
defaults write com.apple.dock persistent-apps -array

echo "› Settings applied. Restarting Dock to see changes..."

# Restart the Dock process to apply all changes
killall Dock

echo "› Done! Your Dock has been configured."