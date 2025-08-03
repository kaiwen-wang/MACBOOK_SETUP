#!/bin/bash

# macOS Setup Script
# This script configures menu bar, recent items, hiding behavior, and minimize effects

echo "🍎 Starting macOS Setup Configuration..."

# Remove apps from menu bar (Control Center items)
echo "📱 Configuring menu bar items..."

# Remove Control Center modules from menu bar
defaults write com.apple.controlcenter "NSStatusItem Visible WiFi" -bool false
defaults write com.apple.controlcenter "NSStatusItem Visible Bluetooth" -bool false
defaults write com.apple.controlcenter "NSStatusItem Visible AirDrop" -bool false
defaults write com.apple.controlcenter "NSStatusItem Visible Focus" -bool false
defaults write com.apple.controlcenter "NSStatusItem Visible StageManager" -bool false
defaults write com.apple.controlcenter "NSStatusItem Visible ScreenMirroring" -bool false
defaults write com.apple.controlcenter "NSStatusItem Visible Display" -bool false
defaults write com.apple.controlcenter "NSStatusItem Visible Sound" -bool false
defaults write com.apple.controlcenter "NSStatusItem Visible NowPlaying" -bool false

# Remove battery percentage from menu bar
defaults write com.apple.menuextra.battery ShowPercent -string "NO"

# Remove clock from menu bar (Note: This might not work on newer macOS versions)
defaults write com.apple.menuextra.clock IsAnalog -bool false

# Turn off recent items
echo "📂 Disabling recent items..."

# Disable recent applications in Apple menu
defaults write com.apple.recentitems RecentApplications -dict MaxAmount 0

# Disable recent documents in Apple menu
defaults write com.apple.recentitems RecentDocuments -dict MaxAmount 0

# Disable recent servers in Apple menu
defaults write com.apple.recentitems RecentServers -dict MaxAmount 0

# Disable recent items in Finder
defaults write com.apple.finder FXRecentFolders -array

# Clear recent items from various applications
defaults write NSGlobalDomain NSRecentDocumentsLimit -int 0

# Enable auto-hide for Dock and Menu Bar
echo "🫥 Enabling auto-hide behavior..."

# Auto-hide the Dock
defaults write com.apple.dock autohide -bool true

# Auto-hide the menu bar
defaults write NSGlobalDomain _HIHideMenuBar -bool true

# Set Dock auto-hide delay to be faster
defaults write com.apple.dock autohide-delay -float 0.1

# Set Dock auto-hide animation duration to be faster
defaults write com.apple.dock autohide-time-modifier -float 0.5

# Set minimize effect to scale
echo "📐 Setting minimize effect to scale..."

# Set minimize effect to scale (genie is the default, scale is the alternative)
defaults write com.apple.dock mineffect -string "scale"

# Additional menu bar customizations
echo "⚙️  Additional menu bar configurations..."

# Remove Spotlight from menu bar
sudo chmod 600 /System/Library/CoreServices/Search.bundle/Contents/MacOS/Search

# Remove Notification Center from menu bar
launchctl unload -w /System/Library/LaunchAgents/com.apple.notificationcenterui.plist 2>/dev/null

# Restart affected services
echo "🔄 Restarting services to apply changes..."

# Restart Dock to apply changes
killall Dock

# Restart Control Center to apply changes
killall ControlCenter

# Restart SystemUIServer to apply menu bar changes
killall SystemUIServer

# Restart Finder to apply recent items changes
killall Finder

echo "✅ macOS setup configuration complete!"
echo ""
echo "📝 Summary of changes:"
echo "   • Removed Control Center items from menu bar"
echo "   • Disabled recent items in Apple menu and Finder"
echo "   • Enabled auto-hide for Dock and Menu Bar"
echo "   • Set minimize effect to scale"
echo ""
echo "⚠️  Note: Some changes may require a logout/login or system restart to take full effect."
echo "🔧 You can manually adjust additional menu bar items in System Preferences > Control Center"