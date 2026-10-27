# WezTerm

[WezTerm](https://wezterm.org/) es un emulador de terminal multiplataforma, acelerado por GPU y configurable en Lua.

## Instalación

Elemento de akmon: `wezterm`.

| Archivo del repositorio | Destino |
|---|---|
| `common/.wezterm.lua` | `~/.wezterm.lua` |

> **Si existe `~/.config/wezterm/wezterm.lua`, WezTerm lo carga en lugar de `~/.wezterm.lua`.** Renómbralo o bórralo;
> si no, los cambios de este repositorio no se aplican. Para ver qué archivo y qué atajos están activos:
> `wezterm show-keys --lua`.

## Qué configura este repositorio

| Opción | Valor | Para qué |
|---|---|---|
| `font` / `font_size` | `JetBrainsMono Nerd Font Mono`, 13 | Fuente común a todas las herramientas, con iconos |
| `color_scheme` | `Dracula` | Tema común a todas las herramientas |
| `window_background_opacity` | `0.8` | Transparencia de la ventana |
| `default_cursor_style` | `BlinkingBlock` | Cursor de bloque que parpadea |
| `window_padding` | 5 px a los lados | Margen del texto |
| `tab_bar_at_bottom`, `use_fancy_tab_bar = false` | | Pestañas abajo y con estilo plano |
| `hide_tab_bar_if_only_one_tab` | `true` | Oculta la barra si solo hay una pestaña |
| `enable_scroll_bar` | `true` | Muestra la barra de desplazamiento |
| `animation_fps` | `60` | Animaciones más suaves |

## Atajos

| Atajo | Acción | Sistema |
|---|---|---|
| `Ctrl+Shift+E` | Divide el panel lado a lado (el nuevo, a la derecha) | Todos |
| `Ctrl+Shift+O` | Divide el panel arriba/abajo (el nuevo, debajo). Es la letra O, no el cero | Todos |
| `Ctrl+C` / `Ctrl+V` | Copiar / pegar | Solo Windows |
| `Ctrl+W` | Cierra el panel activo (pide confirmación) | Solo Windows |

Los atajos usan letras a propósito: funcionan igual con cualquier distribución de teclado. Con símbolos fallan; por
ejemplo, en Spanish-ISO `=` se escribe con `Shift+0` y llega como `Ctrl+Shift+=`, que WezTerm usa para agrandar la fuente.

El resto son los atajos por defecto de WezTerm (en macOS, `Cmd+C`/`Cmd+V`/`Cmd+W`; en Linux, `Ctrl+Shift+C`/`Ctrl+Shift+V`).

## Diferencias por sistema operativo

- **Windows**: abre la distribución `WSL:Ubuntu` como dominio por defecto y define `Ctrl+C`/`Ctrl+V`/`Ctrl+W`. En macOS y
  Linux no se definen porque anularían `Ctrl+C` (interrumpir un proceso) y `Ctrl+W` (borrar la palabra anterior).
- **macOS**: la tecla Option compone caracteres. `Option+n` es una tecla muerta: seguida de `n` escribe `ñ`, de `Shift+n`
  escribe `Ñ` y de `Espacio` escribe `~`.

Todo se resuelve con `wezterm.target_triple` dentro del mismo archivo, sin duplicarlo por sistema.

## Cómo seguir configurándolo

- Edita `common/.wezterm.lua`; WezTerm recarga la configuración al guardar.
- Para un atajo nuevo añade una entrada a `config.keys`. Si solo aplica a un sistema, añádela con `table.insert` dentro
  del bloque `if wezterm.target_triple:find(...)` correspondiente, como se hace con los de Windows.
- Un cambio de tema o de fuente debe repetirse en [Rio](rio.md) y en [bat](bat.md) para mantener el aspecto unificado.

## Documentación oficial

- [Archivos de configuración](https://wezterm.org/config/files.html): dónde busca WezTerm su configuración y en qué orden.
- [Atajos de teclado](https://wezterm.org/config/keys.html) y [acciones disponibles](https://wezterm.org/config/lua/keyassignment/index.html).
- [Esquemas de color](https://wezterm.org/colorschemes/index.html).
