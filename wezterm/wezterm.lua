-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = 'Gruvbox dark, hard (base16)'

config.font_size = 16.0
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}
config.font =
  wezterm.font('JetBrains Mono', { weight = 400, italic = false })

config.default_prog = { "/opt/homebrew/bin/fish", "-l" }

local act = wezterm.action

config.keys= {
	{
		key = "w",
		mods = "CMD",
		action = act.CloseCurrentTab({ confirm = false }),
	},
	{
		key = "h",
		mods = "SHIFT|CMD",
		action = act.SplitHorizontal({}),
	},
	{
		key = "k",
		mods = "SHIFT|CMD",
		action = act.CloseCurrentPane({
			confirm = false,
		}),
	},
  }

-- and finally, return the configuration to wezterm
return config
