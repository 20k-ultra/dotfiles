local wezterm = require("wezterm")

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- Theme + Font
config.color_scheme = "Sonokai (Gogh)"
config.font_size = 20.0
config.colors = {
	background = "#1B1D1E",
}
-- Background
config.window_background_opacity = 0.9
config.text_background_opacity = 0.4
-- Hide tabs
config.hide_tab_bar_if_only_one_tab = true
-- Padding
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

return config
