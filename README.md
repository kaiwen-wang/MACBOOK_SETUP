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

Or if you've cloned this repository:

```bash
brew bundle install
```

This will install:
- Google Chrome
- Alacritty (terminal)
- Rectangle (window management)

## Restore Launchpad from Configuration

```bash
curl -s https://raw.githubusercontent.com/kaiwen-wang/MACBOOK_SETUP/refs/heads/main/tests-MacBook-Air.yml -o /tmp/launchpad-config.yml && lporg load --config /tmp/launchpad-config.yml
```

## Grey Wallpaper

```bash
bash <(curl -s https://raw.githubusercontent.com/kaiwen-wang/MACBOOK_SETUP/refs/heads/main/set_grey_wallpaper.sh)
```

curl -sL https://raw.githubusercontent.com/kaiwen-wang/MACBOOK_SETUP/main/set_grey_wallpaper.sh | bash
