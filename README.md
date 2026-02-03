## Dock

```bash
bash <(curl -s "https://raw.githubusercontent.com/kaiwen-wang/MACBOOK_SETUP/refs/heads/main/macos_setup.sh?v=$(date +%s)")
```

## Launchpad MacOS 26 (requires restart)

For some reason disappears spotlight

```bash
bash <(curl -s "https://raw.githubusercontent.com/kaiwen-wang/MACBOOK_SETUP/refs/heads/main/re_enable_launchpad.sh?v=$(date +%s)")
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
curl -s "https://raw.githubusercontent.com/kaiwen-wang/MACBOOK_SETUP/main/Brewfile-utils?v=$(date +%s)" -o Brewfile-utils
brew bundle install --file=Brewfile-utils --verbose
```

### Install Main Applications (large)

```bash
cd ~/Downloads
curl -s "https://raw.githubusercontent.com/kaiwen-wang/MACBOOK_SETUP/main/Brewfile?v=$(date +%s)" -o Brewfile
brew bundle install --verbose
```

## Restore Launchpad from Configuration

Depends upon brew installing lporg first.

```bash
curl -s "https://raw.githubusercontent.com/kaiwen-wang/MACBOOK_SETUP/main/tests-MacBook-Air.yml?v=$(date +%s)" -o /tmp/launchpad-config.yml && lporg load --config /tmp/launchpad-config.yml
```

## Grey Wallpaper

```bash
bash <(curl -s "https://raw.githubusercontent.com/kaiwen-wang/MACBOOK_SETUP/refs/heads/main/set_grey_wallpaper.sh?v=$(date +%s)")
```

Spotlight -> Reduce Transparency

## Change default shell to fish

```bash
bash <(curl -s "https://raw.githubusercontent.com/kaiwen-wang/MACBOOK_SETUP/refs/heads/main/fish_default_shell.sh?v=$(date +%s)")
```

## Desktop Cleanup (Hot Corners & Widgets)

```bash
bash <(curl -s "https://raw.githubusercontent.com/kaiwen-wang/MACBOOK_SETUP/refs/heads/main/desktop_cleanup.sh?v=$(date +%s)")
```

## Finder Default Location (~/Downloads)

```bash
bash <(curl -s "https://raw.githubusercontent.com/kaiwen-wang/MACBOOK_SETUP/refs/heads/main/set_finder_default_downloads.sh?v=$(date +%s)")
```

Go to settings (CMD + ,) hide recents, Airdrop. Show all other folders. Show filename extensions.

## Night Shift
- Some way to set it permanently instead of scheduled? would be nice.

## Next steps

- Log into Chrome
    - Sync extensions, bookmarks, settings, New Tab Redirect.
    - Don't enable telemetry stuff.
- Log into VS Code
    - Sync extensions
    <!-- - Set fish as default terminal (select default terminal) -->


### Git. Use github noreply email.

```bash
git config --global user.name "USER_NAME"
git config --global user.email "USER_EMAIL"
```


### Terminal command for OPTION as META key (in terminal settings) on ALACRITTY

`mkdir -p ~/.config/alacritty && printf '[window]\noption_as_alt = "Both"\n' > ~/.config/alacritty/alacritty.toml`



### OpeninTerminal-Lite:

`defaults write wang.jianing.app.OpenInTerminal-Lite LiteDefaultTerminal Alacritty`

To open as default. https://github.com/Ji4n1ng/OpenInTerminal/blob/master/Resources/README-Lite.md

CMD + drag into Finder window.


### Settings

Desktop & Dock -> Windows -> PREfER TABS WHEN OPENING NEW DOCUMETNS ALWAYS


### Applications not in Brewfile

Menu Bar Spacing
MS Outook
Goodlinks
Vimac

### Disable startup sound

```bash
sudo nvram SystemAudioVolume=%80
```