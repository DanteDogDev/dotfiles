local wezterm = require "wezterm"
local config = wezterm.config_builder()

config.initial_cols = 90
config.initial_rows = 36

-- Enable tab bar
config.enable_tab_bar = true
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = false

config.font_size = 12
config.window_background_opacity = 0.9

config.font = wezterm.font_with_fallback {
	"Monocraft",
	family = "JetBrainsMono Nerd Font"
}
config.color_scheme = "tokyonight_night"

config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

return config

-- Multiplexing shortcuts
-- config.leader = { key = "w", mods = "SUPER" }
-- config.keys = {
  -- 	-- Create tabs
  -- 	{ key = "t", mods = "LEADER", action = wezterm.action.SpawnTab "CurrentPaneDomain" },
  -- 	{ key = "n", mods = "LEADER", action = wezterm.action.ActivateTabRelative(1) },
  -- 	{ key = "p", mods = "LEADER", action = wezterm.action.ActivateTabRelative(-1) },
  --
  -- 	-- Split panes
  -- 	{ key = "b", mods = "LEADER", action = wezterm.action.SplitPane { direction = "Down", size = { Percent = 50 } } },
  -- 	{ key = "v", mods = "LEADER", action = wezterm.action.SplitPane { direction = "Right", size = { Percent = 50 } } },
  --
  -- 	-- Navigate panes
  -- 	{ key = "h", mods = "LEADER", action = wezterm.action.ActivatePaneDirection "Left" },
  -- 	{ key = "j", mods = "LEADER", action = wezterm.action.ActivatePaneDirection "Down" },
  -- 	{ key = "k", mods = "LEADER", action = wezterm.action.ActivatePaneDirection "Up" },
  -- 	{ key = "l", mods = "LEADER", action = wezterm.action.ActivatePaneDirection "Right" },
  --
  -- 	-- Close current tab
  -- 	{ key = "w", mods = "LEADER", action = wezterm.action.CloseCurrentTab { confirm = true } },
  --
  -- 	-- Zoom pane
  -- 	{ key = "z", mods = "LEADER", action = wezterm.action.TogglePaneZoomState },
  -- }


