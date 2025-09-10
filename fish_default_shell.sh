#!/usr/bin/env bash

#
# This script sets fish as the default shell on macOS for Homebrew installations.
# It performs two main actions based on the issue described in fish-shell/fish-shell#989:
# 1. It adds the Homebrew fish path to the list of approved shells in /etc/shells.
# 2. It uses the `chsh` command to change the current user's default shell to fish.
#

# --- Configuration ---
# Path to the fish shell executable installed by Homebrew.
# This is the standard path for Apple Silicon (M1/M2/M3) Macs.
# For Intel Macs, you might need to change this to "/usr/local/bin/fish".
FISH_PATH="/opt/homebrew/bin/fish"

# --- Script Logic ---

# 1. Check if fish is actually installed at the specified path.
if [ ! -f "$FISH_PATH" ]; then
    echo "Error: The fish shell is not found at '$FISH_PATH'."
    echo "Please install it with Homebrew first: brew install fish"
    exit 1
fi

echo "Found fish shell at: $FISH_PATH"

# 2. Check if the fish path is already in /etc/shells.
# We use grep with -F (fixed string) and -q (quiet) to check for existence.
if grep -qF "$FISH_PATH" /etc/shells; then
    echo "Fish shell path is already present in /etc/shells. No changes needed there."
else
    # 3. If it's not there, add it.
    # This requires administrator privileges, so `sudo` is used.
    # We use `tee -a` to append to the file, which works correctly with `sudo`.
    echo "Adding '$FISH_PATH' to /etc/shells to make it a valid login shell."
    echo "You will be prompted for your administrator password."
    echo "$FISH_PATH" | sudo tee -a /etc/shells
    if [ $? -ne 0 ]; then
        echo "Error: Failed to write to /etc/shells. Please run the script again."
        exit 1
    fi
    echo "Successfully added fish to /etc/shells."
fi

# 4. Change the user's default shell to fish.
# The `chsh` command (change shell) handles this.
echo ""
echo "Now changing your default shell to fish. You may be prompted for your password again."
chsh -s "$FISH_PATH"

# 5. Final confirmation and instructions.
if [ $? -eq 0 ]; then
    echo ""
    echo "✅ Success! Your default shell has been changed to fish."
    echo "Please close and reopen your terminal for the change to take effect."
else
    echo "❌ Error: The 'chsh' command failed. Please check the output above for details."
fi

# 6. Create alacritty.toml configuration
echo ""
echo "Creating alacritty.toml configuration file..."
mkdir -p "$HOME/.config/alacritty"
cat > "$HOME/.config/alacritty/alacritty.toml" <<EOF
[terminal]
[terminal.shell]
args = ["--login"]
program = "$FISH_PATH"
EOF
echo "Alacritty configuration created at $HOME/.config/alacritty/alacritty.toml"

exit 0
