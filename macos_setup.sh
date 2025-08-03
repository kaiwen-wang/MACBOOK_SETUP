#!/bin/bash

# macOS Setup Script
echo "🍎 Configuring macOS settings..."

# Remove all apps from menu bar (Control Center items)
defaults write com.apple.controlcenter "NSStatusItem Visible WiFi" -bool false
defaults write com.apple.controlcenter "NSStatusItem Visible Bluetooth" -bool false
defaults write com.apple.controlcenter "NSStatusItem Visible AirDrop" -bool false
defaults write com.apple.controlcenter "NSStatusItem Visible Focus" -bool false
defaults write com.apple.controlcenter "NSStatusItem Visible StageManager" -bool false
defaults write com.apple.controlcenter "NSStatusItem Visible ScreenMirroring" -bool false
defaults write com.apple.controlcenter "NSStatusItem Visible Display" -bool false
defaults write com.apple.controlcenter "NSStatusItem Visible Sound" -bool false
defaults write com.apple.controlcenter "NSStatusItem Visible NowPlaying" -bool false

# Turn off recent items
defaults write com.apple.dock show-recents -bool false

# Turn on hiding (auto-hide dock)
defaults write com.apple.dock autohide -bool true

# Set minimize effect to scale
defaults write com.apple.dock mineffect -string "scale"

# Restart Dock to apply changes
killall Dock

echo "✅ Done!"