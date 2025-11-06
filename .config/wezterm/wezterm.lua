local wezterm = require 'wezterm'

local config = wezterm.config_builder()

-- window settings
config.window_decorations = "RESIZE"
config.window_background_opacity = 0.7
config.text_background_opacity = 0.9
-- config.macos_window_background_blur = 20

-- tab bar settings
config.show_close_tab_button_in_tabs = false

-- Font and color scheme
config.font = wezterm.font_with_fallback {
  { family = 'Moralerspace Neon', weight = 'Bold' },
  'CaskaydiaCove Nerd Font Mono',
}
config.font_size = 14
config.color_scheme = 'Argonaut (Gogh)'

-- Key bindings
local act = wezterm.action
config.keys = {
  -- Disable CTRL + - and CTRL + = and pass them through to the terminal
  { key = '-', mods = 'CTRL', action = act.SendKey { key = '-', mods = 'CTRL' } },
  { key = '=', mods = 'CTRL', action = act.SendKey { key = '=', mods = 'CTRL' } },
  -- Cmd + d: Split pane horizontally
  { key = 'd', mods = 'CMD', action = act.SplitHorizontal { domain = 'CurrentPaneDomain' } },
  -- Shift + Cmd + d: Split pane vertically
  { key = 'D', mods = 'CMD|SHIFT', action = act.SplitVertical { domain = 'CurrentPaneDomain' } },
  -- Cmd + [: Move to the previous pane
  { key = '[', mods = 'CMD', action = act.ActivatePaneDirection 'Prev' },
  -- Cmd + ]: Move to the next pane
  { key = ']', mods = 'CMD', action = act.ActivatePaneDirection 'Next' },
}


return config
