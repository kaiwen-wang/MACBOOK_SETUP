#!/bin/bash

# Disable Hot Corners
# Top left screen corner
defaults write com.apple.dock wvous-tl-corner -int 1
defaults write com.apple.dock wvous-tl-modifier -int 0
# Top right screen corner
defaults write com.apple.dock wvous-tr-corner -int 1
defaults write com.apple.dock wvous-tr-modifier -int 0
# Bottom left screen corner
defaults write com.apple.dock wvous-bl-corner -int 1
defaults write com.apple.dock wvous-bl-modifier -int 0
# Bottom right screen corner
defaults write com.apple.dock wvous-br-corner -int 1
defaults write com.apple.dock wvous-br-modifier -int 0

# Disable Dashboard
defaults write com.apple.dashboard mcx-disabled -bool true

# Restart Dock to apply changes
killall Dock

echo "Hot corners and Dashboard have been disabled."
