#!/bin/bash

# Script to re-enable Launchpad on macOS
# This script disables the SpotlightPlus feature which can interfere with Launchpad

echo "Re-enabling Launchpad by disabling SpotlightPlus feature..."
echo "You will be prompted for your admin password."

# Create the FeatureFlags directory structure
echo "Creating FeatureFlags directory..."
sudo mkdir -p /Library/Preferences/FeatureFlags/Domain

# Check if the directory was created successfully
if [ $? -eq 0 ]; then
    echo "Directory created successfully."
else
    echo "Failed to create directory. Make sure you have admin privileges."
    exit 1
fi

# Disable SpotlightPlus feature
echo "Disabling SpotlightPlus feature..."
sudo defaults write /Library/Preferences/FeatureFlags/Domain/SpotlightUI.plist SpotlightPlus -dict Enabled -bool false

# Check if the command was successful
if [ $? -eq 0 ]; then
    echo "SpotlightPlus feature disabled successfully."
    echo "Launchpad should now be re-enabled."
    echo "You may need to restart your Mac for changes to take full effect."
else
    echo "Failed to disable SpotlightPlus feature."
    exit 1
fi

echo "Script completed successfully!"