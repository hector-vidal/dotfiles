-- Pull in the wezterm API
local wezterm = require("wezterm")

local mux = wezterm.mux

-- This will hold the configuration.
local config = wezterm.config_builder()

-- Tipografía
config.font = wezterm.font("JetBrainsMono Nerd Font Mono")
config.font_size = 11

-- Transparencia de la terminal
config.window_background_opacity = 0.8

-- Hace que el cursor parpadee
config.default_cursor_style = "BlinkingBlock"

-- Espaciado del texto en la terminal
config.window_padding = {
	left = 5,
	right = 5,
	top = 0,
	bottom = 0.5,
}

-- Coloca las tabs en la parte inferior de la terminal
config.tab_bar_at_bottom = true

-- Hace que el diseño de las tab no sean redondeadas
config.use_fancy_tab_bar = false

-- Hace que la numeración de las tabs inicien en 0
--config.tab_and_split_indices_are_zero_based = true

-- Oculta las tabs si solo está abierta una
config.hide_tab_bar_if_only_one_tab = true

-- Se configuran las teclas para copiar y pegar
config.keys = {
	{
		-- Activa el shortcut de copiar
		key = "c",
		mods = "CTRL",
		action = wezterm.action.CopyTo("ClipboardAndPrimarySelection"),
	},
	{
		-- Activa el shortcut de pegar
		key = "v",
		mods = "CTRL",
		action = wezterm.action.PasteFrom("Clipboard"),
	},
	{
		-- Activa el shortcut de dividir verticalmente la terminal
		key = "-",
		mods = "CTRL",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		-- Activa el shortcut de dividir horizontalmente la terminal
		key = "=",
		mods = "CTRL",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		-- Cierra la terminal activa
		key = "w",
		mods = "CTRL",
		action = wezterm.action.CloseCurrentPane({ confirm = true }),
	},
}

-- Tema de la terminal
config.color_scheme = "Dracula"

-- Terminal de WSL
-- config.default_domain = "WSL:Ubuntu-24.04"
config.default_domain = "WSL:Ubuntu"

-- Muestra la barra de desplazamiento
config.enable_scroll_bar = true

-- Animaciones más suaves
config.animation_fps = 60

-- and finally, return the configuration to wezterm
return config
