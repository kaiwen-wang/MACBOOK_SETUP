## Dock

```bash
bash <(curl -s https://raw.githubusercontent.com/kaiwen-wang/MACBOOK_SETUP/refs/heads/main/macos_setup.sh)
```

todo: dock should be on elft

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

Two Brewfiles are provided - utilities (small/fast) and main applications (large).

### Install Utilities (small)

```bash
cd ~/Downloads
curl -s "https://raw.githubusercontent.com/kaiwen-wang/MACBOOK_SETUP/main/Brewfile.utils?v=$(date +%s)" -o Brewfile.utils
brew bundle install --file=Brewfile.utils --verbose
```

### Install Main Applications (large)

```bash
cd ~/Downloads
curl -s "https://raw.githubusercontent.com/kaiwen-wang/MACBOOK_SETUP/main/Brewfile?v=$(date +%s)" -o Brewfile
brew bundle install --verbose
```

## Restore Launchpad from Configuration

```bash
curl -s "https://raw.githubusercontent.com/kaiwen-wang/MACBOOK_SETUP/main/tests-MacBook-Air.yml?v=$(date +%s)" -o /tmp/launchpad-config.yml && lporg load --config /tmp/launchpad-config.yml
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
    - Sync extensions, bookmarks, settings, New Tab Redirect.
    - Don't enable telemetry stuff.
- Log into VS Code
    - Sync extensions
    - Set fish as default terminal (select default terminal)

Use your 

```bash
git config --global user.name "USER_NAME"
git config --global user.email "USER_EMAIL"
```


<!-- Do mise, npm other version setups -->
TODO put dock on side again


<!-- show path  bar for finder -->

terminal command for OPTION as META key (in terminal settings) on ALACRITTY

`mkdir -p ~/.config/alacritty && printf '[window]\noption_as_alt = "Both"\n' > ~/.config/alacritty/alacritty.toml`


MeetingBar Settings


Language settings add chinese, then all keyboard to switch between them




wINDOWS SETTINGS -> DEKSTOP & DOCK PREfER TABS WHEN OPENING NEW DOCUMETNS ALWAYS