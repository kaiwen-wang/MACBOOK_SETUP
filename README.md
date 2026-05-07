## Before setting things up

Username as real name:
- Pros: if you lose your computer, someone can track you down to return it.
- Cons: if you lose your computer, people know who it belongs to and can obtain more information about it.

## Spotlight Search Categories:



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

### Git. Use github noreply email.

```bash
git config --global user.name "USER_NAME"
git config --global user.email "USER_EMAIL"
```


### Terminal command for OPTION as META key (in terminal settings) on ALACRITTY

`mkdir -p ~/.config/alacritty && printf '[window]\noption_as_alt = "Both"\n' > ~/.config/alacritty/alacritty.toml`



### OpeninTerminal-Lite:

- To open as default.
    - `defaults write wang.jianing.app.OpenInTerminal-Lite LiteDefaultTerminal Alacritty`
    - https://github.com/Ji4n1ng/OpenInTerminal/blob/master/Resources/README-Lite.md
- CMD + drag into Finder window.

### Settings

- Desktop & Dock -> Windows -> PREFER TABS WHEN OPENING NEW DOCUMETNS ALWAYS
    - Reason: so Alacritty doesn't open 1000 new windows

### Applications not in Brewfile
- [Menu Bar Spacing](https://sindresorhus.com/menu-bar-spacing) - set to 8
- MS Outlook
- Goodlinks
- Vimac

In future, copy apps from a drive folder.

### Disable startup sound

Run it when the startup sound is loud/distracting enough during daily use.

```bash
sudo nvram SystemAudioVolume=%80
```