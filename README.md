# WezTerm Configuration

A modular and highly organized [WezTerm](https://wezfurlong.org/wezterm/) configuration written in Lua. This setup is designed for portability and ease of maintenance by splitting configuration into logical modules.

## Features

- **Modular Design**: Configuration is split into `config/` (options) and `events/` (hooks).
- **Custom Status Line**: Enhanced right-status area via `events/right-status.lua`.
- **Dynamic Tab Titles**: Intelligent tab naming and styling in `events/tab-title.lua`.
- **Platform Agnostic**: Uses utility functions in `utils/platform.lua` for cross-platform compatibility (Windows/Linux/macOS).
- **Custom Assets**: Includes backdrops and color schemes.

## Project Structure

```text
.
├── wezterm.lua           # Main entry point
├── config/               # Configuration modules
│   ├── appearance.lua    # UI, colors, and opacity
│   ├── bindings.lua      # Keybindings and leader keys
│   ├── domains.lua       # SSH, TLS, and multiplexer domains
│   ├── fonts.lua         # Font families and sizes
│   ├── general.lua       # Miscellaneous settings
│   └── launch.lua        # Launch menu and default programs
├── events/               # WezTerm event hooks
│   ├── right-status.lua  # Status line configuration
│   ├── tab-title.lua     # Tab bar customization
│   └── ...
├── utils/                # Shared helper functions
└── backdrops/            # Background images
```

## Installation

1. Install [WezTerm](https://wezfurlong.org/wezterm/install/installation.html).
2. Clone this repository into your WezTerm configuration directory:
   - **Linux/macOS/WSL**: `~/.config/wezterm/`
   - **Windows**: `C:\Users\YourName\.config\wezterm\`
3. Restart WezTerm or reload the config with `wezterm cli reload`.

## Usage

### Hot-Reloading
Changes to the Lua files will be automatically detected by WezTerm. You can also manually reload using the CLI:
```bash
wezterm cli reload
```

### Key Bindings
Check `config/bindings.lua` for defined shortcuts. You can view all active keybindings with:
```bash
wezterm show-keys --config-file wezterm.lua
```

## Credits

Inspired by various WezTerm configurations and the official documentation.
