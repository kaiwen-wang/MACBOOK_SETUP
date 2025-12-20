## Dock

```bash
bash <(curl -s https://raw.githubusercontent.com/kaiwen-wang/MACBOOK_SETUP/refs/heads/main/macos_setup.sh)
```

## Launchpad MacOS 26 (requires restart)

for some reason disappears spotlight

```bash
bash <(curl -s https://raw.githubusercontent.com/kaiwen-wang/MACBOOK_SETUP/refs/heads/main/re_enable_launchpad.sh)
```

## Brew

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

## Install Software with Brewfile

First, download the Brewfile and install the bundle extension:

```bash
curl -s https://raw.githubusercontent.com/kaiwen-wang/MACBOOK_SETUP/refs/heads/main/Brewfile -o ~/Downloads/Brewfile
cd ~/Downloads && brew bundle install
```

## Restore Launchpad from Configuration

```bash
curl -s https://raw.githubusercontent.com/kaiwen-wang/MACBOOK_SETUP/refs/heads/main/tests-MacBook-Air.yml -o /tmp/launchpad-config.yml && lporg load --config /tmp/launchpad-config.yml
```

## Grey Wallpaper (NOT WORKING TODO)

```bash
bash <(curl -s https://raw.githubusercontent.com/kaiwen-wang/MACBOOK_SETUP/refs/heads/main/set_grey_wallpaper.sh)
```

curl -sL https://raw.githubusercontent.com/kaiwen-wang/MACBOOK_SETUP/main/set_grey_wallpaper.sh | bash

## Change default shell to fish

```bash
bash <(curl -s https://raw.githubusercontent.com/kaiwen-wang/MACBOOK_SETUP/refs/heads/main/fish_default_shell.sh)
```

## Desktop Cleanup (Hot Corners & Widgets)

```bash
bash <(curl -s https://raw.githubusercontent.com/kaiwen-wang/MACBOOK_SETUP/refs/heads/main/desktop_cleanup.sh)
```

## Night Shift
- Some way to set it permanently instead of scheduled? would be nice.

## Next steps

- Log into Chrome
    - Sync extensions, bookmarks, settings, New Tab Redirect
- Log into VS Code
    - Sync extensions
    - Set fish as default terminal (select default terminal)

```bash
git config --global user.name "USER_NAME"
git config --global user.email "USER_EMAIL"
```