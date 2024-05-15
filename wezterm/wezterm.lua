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
  wezterm.font('JetBrains Mono', { weight = 200, italic = false })

config.default_prog = { "/opt/homebrew/bin/fish", "-l" }

local act = wezterm.action

local w = require('wezterm')

local function is_vim(pane)
	local process_info = pane:get_foreground_process_info()
	local process_name = process_info and process_info.name
	return process_name == "nvim" or process_name == "vim"
end

local direction_keys = {
  h = 'Left',
  j = 'Down',
  k = 'Up',
  l = 'Right',
}

-- local function split_nav(resize_or_move, key)
--   return {
--     key = key,
--     mods = resize_or_move == 'resize' and 'META' or 'CTRL',
--     action = w.action_callback(function(win, pane)
--       if is_vim(pane)  then
--         -- pass the keys through to vim/nvim
--         win:perform_action({
--           SendKey = { key = key, mods = resize_or_move == 'resize' and 'META' or 'CTRL' },
--         }, pane)
--       else
--         if resize_or_move == 'resize' then
--           win:perform_action({ AdjustPaneSize = { direction_keys[key], 3 } }, pane)
--         else
--           win:perform_action({ ActivatePaneDirection = direction_keys[key] }, pane)
--         end
--       end
--     end),
--   }
-- end
--
config.keys= {
	{
		key = "w",
		mods = "CMD",
		action = act.CloseCurrentTab({ confirm = false }),
	},
    -- move between split panes
    -- split_nav('move', 'h'),
    -- split_nav('move', 'j'),
    -- split_nav('move', 'k'),
    -- split_nav('move', 'l'),
    -- -- resize panes
    -- split_nav('resize', 'h'),
    -- split_nav('resize', 'j'),
    -- split_nav('resize', 'k'),
    -- split_nav('resize', 'l'),
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
