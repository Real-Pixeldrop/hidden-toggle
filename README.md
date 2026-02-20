# HiddenToggle 👁️

Toggle hidden files in Finder with one click. No more terminal commands.

![macOS](https://img.shields.io/badge/macOS-13%2B-blue) ![Swift](https://img.shields.io/badge/Swift-5.9-orange) ![License](https://img.shields.io/badge/license-MIT-green)

## Features

- 👁️ One-click toggle from the menu bar
- 🔄 Automatically restarts Finder to apply changes
- 👁️‍🗨️ Eye icon shows current state (open = visible, slashed = hidden)
- 🪶 Native Swift — ultra lightweight
- 🚫 No dock icon — lives in your menu bar

## Install

### Download (recommended)

1. Download [HiddenToggle-macOS.zip](https://github.com/Real-Pixeldrop/hidden-toggle/releases/latest/download/HiddenToggle-macOS.zip)
2. Unzip
3. Double-click `HiddenToggle`
4. Done — the eye icon appears in your menu bar

### Terminal one-liner

```bash
curl -sL https://github.com/Real-Pixeldrop/hidden-toggle/releases/latest/download/HiddenToggle-macOS.zip -o /tmp/ht.zip && sudo unzip -o /tmp/ht.zip -d /usr/local/bin && hidden-toggle &
```

### From source

```bash
git clone https://github.com/Real-Pixeldrop/hidden-toggle.git
cd hidden-toggle
swift build -c release
.build/release/HiddenToggle
```

## Usage

1. Click the 👁️ icon in your menu bar
2. Hidden files appear in Finder (.git, .env, .DS_Store, etc.)
3. Click again to hide them
4. That's it

## How it works

- Toggles `defaults write com.apple.finder AppleShowAllFiles`
- Restarts Finder automatically to apply changes
- Reads current state on launch

## License

MIT
