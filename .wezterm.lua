-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

config.font = wezterm.font("JetbrainsMono Nerd Font")
config.font_size = 19

config.enable_tab_bar = false

config.window_decorations = "RESIZE"

--wezterm.on("gui-startup", function(cmd)
--	local screen = wezterm.gui.screens().main
--	local ratio = 0.7
--	local width, height = screen.width * ratio, screen.height * ratio
--	local tab, pane, window = wezterm.mux.spawn_window(cmd or {
--		position = { x = (screen.width - width) / 2, y = (screen.height - height) / 2 },
--	})
	-- window:gui_window():maximize()
--	window:gui_window():set_inner_size(width, height)
--end)

-- Fix mouse selection disappearing
config.mouse_bindings = {
	{
		event = { Down = { streak = 1, button = "Left" } },
		mods = "SHIFT",
		action = wezterm.action.SelectTextAtMouseCursor("Cell"),
	},
	{
		event = { Drag = { streak = 1, button = "Left" } },
		mods = "SHIFT",
		action = wezterm.action.ExtendSelectionToMouseCursor("Cell"),
	},
	{
		event = { Up = { streak = 1, button = "Left" } },
		mods = "SHIFT",
		action = wezterm.action_callback(function(window, pane)
			window:perform_action(wezterm.action.CompleteSelection("ClipboardAndPrimarySelection"), pane)
		end),
	},
}

config.window_background_opacity = 0.8
config.macos_window_background_blur = 10

config.color_scheme = "Catppuccin Macchiato"

return config
