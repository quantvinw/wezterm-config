local wezterm = require("wezterm")

local M = {}

local function is_fullscreen(window)
  local dims = window:get_dimensions()
  if not dims then
    return false
  end

  return dims.is_full_screen or dims.is_fullscreen or false
end

local function sync_decorations(window)
  local overrides = window:get_config_overrides() or {}
  local fullscreen = is_fullscreen(window)

  if fullscreen then
    if overrides.window_decorations ~= "NONE" then
      overrides.window_decorations = "NONE"
      window:set_config_overrides(overrides)
    end
    return
  end

  if overrides.window_decorations == "NONE" then
    overrides.window_decorations = nil
    window:set_config_overrides(overrides)
  end
end

M.setup = function()
  wezterm.on("window-resized", function(window, _pane)
    sync_decorations(window)
  end)

  wezterm.on("window-config-reloaded", function(window)
    sync_decorations(window)
  end)

  wezterm.on("update-right-status", function(window, _pane)
    sync_decorations(window)
  end)
end

return M
