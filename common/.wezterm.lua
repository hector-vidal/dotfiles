-- Pull in the wezterm API
local wezterm = require("wezterm")

local mux = wezterm.mux

-- This will hold the configuration.
local config = wezterm.config_builder()

-- Tipografía
config.font = wezterm.font("JetBrainsMono Nerd Font Mono")
config.font_size = 13

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

-- Atajos para dividir la terminal. Se usan letras con Ctrl+Shift porque
-- funcionan igual en cualquier SO y distribución de teclado (en Spanish-ISO
-- "=" exige Shift y en macOS Option compone caracteres)
config.keys = {
	{
		-- Divide la terminal lado a lado (panel nuevo a la derecha)
		key = "E",
		mods = "CTRL|SHIFT",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		-- Divide la terminal arriba/abajo (panel nuevo debajo). Es la letra O,
		-- no el cero: Ctrl+Shift+0 es "=" en Spanish-ISO y agranda la fuente
		key = "O",
		mods = "CTRL|SHIFT",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
}

-- Tema de la terminal
config.color_scheme = "Dracula"

-- Terminal de WSL: solo se aplica en Windows, para que la misma configuración
-- siga funcionando en macOS y Linux (allí se usa el shell de login del usuario)
if wezterm.target_triple:find("windows") then
	config.default_domain = "WSL:Ubuntu"

	-- Copiar, pegar y cerrar con Ctrl, como en Windows. En macOS y Linux no se
	-- definen: Ctrl+C debe enviar SIGINT y Ctrl+W borrar la palabra anterior
	table.insert(config.keys, {
		key = "c",
		mods = "CTRL",
		action = wezterm.action.CopyTo("ClipboardAndPrimarySelection"),
	})
	table.insert(config.keys, {
		key = "v",
		mods = "CTRL",
		action = wezterm.action.PasteFrom("Clipboard"),
	})
	table.insert(config.keys, {
		key = "w",
		mods = "CTRL",
		action = wezterm.action.CloseCurrentPane({ confirm = true }),
	})
end

-- macOS: la tecla Option actúa como Alt. Se habilita la composición para que
-- "Option + n" funcione como tecla muerta: muestra "˜" en espera, y se concreta
-- con la siguiente pulsación — "Option + n" + "n" escribe "ñ", "Option + n" +
-- "Shift + n" escribe "Ñ" y "Option + n" + "Espacio" escribe "~" (ASCII)
if wezterm.target_triple:find("darwin") then
	config.send_composed_key_when_left_alt_is_pressed = true
	config.send_composed_key_when_right_alt_is_pressed = true
end

-- Muestra la barra de desplazamiento
config.enable_scroll_bar = true

-- Animaciones más suaves
config.animation_fps = 60

-- and finally, return the configuration to wezterm
return config
