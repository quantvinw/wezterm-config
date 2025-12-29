# WezTerm Configuration

A modular [WezTerm](https://wezfurlong.org/wezterm/) setup written in Lua. The goal is a clean, portable configuration that is easy to extend while keeping UX upgrades (statusline, tabs, visuals) isolated and maintainable.

## Project Overview (What & Why)

This project organizes WezTerm settings into small modules so you can tweak behavior without wading through a single giant `wezterm.lua`. It is intended for developers who want a practical, readable starting point for a customized terminal environment on Windows, Linux, macOS, or WSL.

## Features & Highlights

- **Modular design**: Options live in `config/`, event hooks in `events/`.
- **Custom status line**: Right status bar with useful context in `events/right-status.lua`.
- **Dynamic tab titles**: Tab naming/styling in `events/tab-title.lua`.
- **Cross‑platform logic**: Platform detection helpers in `utils/platform.lua`.
- **Custom assets**: Backgrounds and color schemes included.

## Installation & Usage

1. Install WezTerm: https://wezfurlong.org/wezterm/install/installation.html
2. Place this repo into your config directory:
   - Linux/macOS/WSL: `~/.config/wezterm/`
   - Windows: `C:\Users\YourName\.config\wezterm\`
3. Reload WezTerm:

```bash
wezterm cli reload
```

### Quick checks

List active keybindings:

```bash
wezterm show-keys
```

Open the built-in launcher (if you keep the default binding):

```text
F3
```

## Core Configuration / Customization

Start with these files:

- `wezterm.lua`: entry point, loads the modules.
- `config/bindings.lua`: keymaps, tabs, and pane actions.
- `config/appearance.lua`: colors, opacity, and UI visuals.
- `config/domains.lua`: WSL/SSH domains.
- `events/`: UI and window events (status line, tab titles, fullscreen behavior).

### Examples

Update a key binding:

```lua
-- config/bindings.lua
{ key = "t", mods = "CTRL|SHIFT", action = act.SpawnTab("DefaultDomain") }
```

Customize the right status line:

```lua
-- events/right-status.lua
window:set_right_status("my status")
```

## Requirements & Dependencies

- WezTerm (recent stable release recommended).
- Fonts referenced in `config/fonts.lua` must be installed on your system.
- WSL configuration requires WSL installed on Windows if you intend to use `config/domains.lua`.

## FAQ / Notes

- **Why don’t my key changes apply?**  
  Use `wezterm cli reload` or restart WezTerm.

- **Where do I find all keybindings?**  
  Run `wezterm show-keys` and/or inspect `config/bindings.lua`.

- **Do I need to keep all modules?**  
  No. Remove or comment out modules you don’t use, but keep the `require(...)` list in `wezterm.lua` in sync.

## Project Structure

```text
.
├── wezterm.lua           # Main entry point
├── config/               # Configuration modules
│   ├── appearance.lua    # UI, colors, and opacity
│   ├── bindings.lua      # Keybindings and leader keys
│   ├── domains.lua       # SSH and WSL domains
│   ├── fonts.lua         # Font families and sizes
│   ├── general.lua       # Miscellaneous settings
│   └── launch.lua        # Launch menu and default programs
├── events/               # WezTerm event hooks
│   ├── fullscreen.lua    # Fullscreen decorations logic
│   ├── right-status.lua  # Status line configuration
│   ├── tab-title.lua     # Tab bar customization
│   └── ...
├── utils/                # Shared helper functions
└── backdrops/            # Background images
```

## Credits

Inspired by the WezTerm community and official documentation.

### Attribution

This configuration is based on https://github.com/QianSong1/wezterm-config and extends it with additional customization and features. That project itself was derived from and improved upon an earlier WezTerm configuration, and this repository continues the same lineage of iteration and extension.
