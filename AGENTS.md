# Repository Guidelines

## Project Structure & Module Organization
- Root entrypoint `wezterm.lua` composes the runtime config from modular files in `config/`. Keep new options scoped by topic (appearance, bindings, domains, fonts, general, launch) and return Lua tables so `Config:append` can merge them.
- Event hooks live in `events/` (status line, tab titles, new-tab button, fullscreen). Extend them by adding a Lua module with a `setup` function and requiring it from `wezterm.lua`.
- Shared helpers sit in `utils/` (e.g., platform detection); add reusable logic here instead of duplicating.
- Visual assets belong in `backdrops/`, `colors/`, `img/`, and `screenshots/`. Reference them via `wezterm.config_dir` to keep paths portable.

## Build, Test, and Development Commands
- `wezterm start --config-file wezterm.lua` — launch a session with the local config to validate parsing and runtime behavior.
- `wezterm cli reload` — hot-reload a running WezTerm instance after edits.
- `wezterm show-keys --config-file wezterm.lua` — list effective key mappings; check for conflicts when adding bindings.

## Coding Style & Naming Conventions
- Lua with 2-space indentation and trailing commas in tables for clean diffs.
- Use `snake_case` for option keys and locals; keep module names descriptive (`config.general`, `events.right-status`).
- Preserve the pattern of returning plain tables from config modules; avoid duplicate keys because `Config:append` logs a warning and keeps the first value.
- For platform-specific logic, route through `utils/platform.lua` rather than inlining `wezterm.target_triple` checks.

## Testing Guidelines
- No automated test suite; rely on manual validation.
- After changes, run `wezterm start --config-file wezterm.lua` in a fresh terminal to confirm the file parses and UI elements (tabs, status) render.
- Use `wezterm show-keys --config-file wezterm.lua | less` to verify new bindings and ensure leader/key tables remain reachable on all platforms.

## Commit & Pull Request Guidelines
- Commit messages: use present-tense, imperative summaries (e.g., "Adjust tab bar opacity"). If touching multiple areas, prefer multiple commits over one large change.
- Pull requests should describe the behavior change, note platform focus (Windows/macOS/Linux/WSL), and include screenshots in `screenshots/` when altering visuals.
- Mention any SSH or launch menu edits from `config/domains.lua` or `config/launch.lua` so reviewers can sanity-check hostnames and programs.

## Security & Configuration Tips
- Avoid committing real credentials or private hostnames; parameterize identities and paths in `config/domains.lua` where possible.
- When adding assets or colors, ensure file paths are relative to the config directory and portable across platforms.***
