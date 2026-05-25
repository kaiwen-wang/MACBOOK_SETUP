## Dock

Note: `?v=$(date +%s)` is for cache invalidation so curl gets latest version


```bash
bash <(curl -s "https://raw.githubusercontent.com/kaiwen-wang/MACBOOK_SETUP/refs/heads/main/macos_setup.sh?v=$(date +%s)")
```

Sometimes this script needs to run twice

## Launchpad MacOS 26 (requires restart)

For some reason disappears spotlight

```bash
bash <(curl -s "https://raw.githubusercontent.com/kaiwen-wang/MACBOOK_SETUP/refs/heads/main/re_enable_launchpad.sh?v=$(date +%s)")
```

Not often used, am staying on MacOS 15 for now because glass makes finder bulky

## Brew

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```


## Applications

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


## Brewfile Dependent Things

## Restore Launchpad from Configuration

Depends upon brew installing lporg first.

```bash
curl -s "https://raw.githubusercontent.com/kaiwen-wang/MACBOOK_SETUP/main/lporg-setup.yml?v=$(date +%s)" -o /tmp/launchpad-config.yml && lporg load --config /tmp/launchpad-config.yml
```

## Grey Wallpaper

Requires imagemagick on brew

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


## Next steps

- Log into Chrome
    - Sync extensions, bookmarks, settings, New Tab Redirect.
    - Don't enable telemetry stuff.
- Log into VS Code
    - Sync extensions

### Git. Use github noreply email.

Necessary for git pushing, not necessarily git clone.

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

### LaTeX

Packages in last line are things I use for resume. Tectonic might be more modern though vs LaTeX Workshop/a distribution.

```bash
# LaTeX (BasicTeX) setup
brew install --cask basictex
fish_add_path (ls -d /usr/local/texlive/*/bin/universal-darwin | tail -1)
sudo tlmgr update --self
sudo tlmgr install latexmk soul enumitem adforn svn-prov fixtounicode
```

## Lower priority

### Night Shift

### Disable startup sound

Run it when the startup sound is loud/distracting enough during daily use.

```bash
sudo nvram SystemAudioVolume=%80
```

### How to keep using Pixelmator Trial

```
rm '/Users/USERNAME/Library/Group Containers/4R6749AYRE.com.pixelmator/Library/Preferences/4R6749AYRE.com.pixelmator.plist'
```

### MacOS Screen Dim Timing

Brightness varying a lot is random and annoying. (Displays)

`sudo pmset -a lessbright`

### Firewall

Firewall is off by default. Search in spotlight.

`sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setglobalstate on`

`/usr/libexec/ApplicationFirewall/socketfilterfw --getglobalstate`

### Keyboard

Language settings add chinese, then pinyin keyboard to switch between them

- Show in Menu BAR on
- Correct spelling auto OFF
- Capitalize words auto OFF
- Inline predictive text OFF
- Period double space OFF
- Use Smart Quotes and dashes off
- Select next source in language on

### Prevent early display dim/shutoff

```bash
sudo pmset -a displaysleep 0
sudo pmset -a sleep 0
sudo pmset -a lessbright 0
```

### KeepassXC Settings

` ~/Library/Application Support/KeePassXC/keepassxc.ini`

Add contents from `keepassxc.ini`


### Chrome Extensions

`bash download-crx.sh`


## Todo

Chrome Extensions
Better apps list
VS Code Extensions