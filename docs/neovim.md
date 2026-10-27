# Neovim

[Neovim](https://neovim.io/) es el editor. La configuración parte de [LazyVim](https://www.lazyvim.org/), una
distribución que trae plugins, atajos y LSP ya configurados, y añade solo unos pocos ajustes propios.

## Instalación

Elemento de akmon: `neovim`.

| Archivo del repositorio | Destino |
|---|---|
| `common/.config/nvim/` | `~/.config/nvim/` |

La primera vez que abras `nvim`, LazyVim descarga sus plugins (necesita conexión a internet y `git`). Requisitos de
LazyVim: Neovim 0.9 o superior, una Nerd Font y, para algunas funciones, `ripgrep` y `fd`.

## Qué configura este repositorio

Sobre la base de LazyVim, solo esto:

| Archivo | Ajuste | Para qué |
|---|---|---|
| `lua/config/options.lua` | `spell = true`, `spelllang = { "es" }` | Corrector ortográfico en español |
| `lua/config/options.lua` | Portapapeles con `clip.exe` y `powershell.exe` | Copiar y pegar con Windows desde WSL |
| `lua/config/autocmds.lua` | `wrap` y `spell` en `text`, `markdown`, `gitcommit`, `typst` y `plaintex` | Ajuste de línea y corrector en archivos de texto |

`keymaps.lua` y `lua/plugins/example.lua` son los de la plantilla de LazyVim; `example.lua` empieza con
`if true then return {} end` y no carga nada.

## Diferencias por sistema operativo

El bloque del portapapeles solo se activa en WSL (`vim.fn.has("wsl")`). En macOS y Linux, Neovim usa el portapapeles del
sistema sin configuración extra.

## Cómo seguir configurándolo

- **Plugins nuevos**: crea un archivo en `lua/plugins/` (uno por plugin o por tema) que devuelva su especificación.
  Usa `example.lua` como referencia, pero no lo edites.
- **Extras de LazyVim** (lenguajes, formateadores...): `:LazyExtras` dentro de Neovim; quedan anotados en `lazyvim.json`.
- **Actualizar plugins**: `:Lazy sync`. Reescribe `lazy-lock.json`, que **no se edita a mano**. Si añade archivos nuevos
  a la carpeta, decláralos también en `akmon.json`.
- **Formato**: los `.lua` siguen `stylua.toml`; formatea con `stylua common/.config/nvim`.

## Documentación oficial

- [LazyVim](https://www.lazyvim.org/): instalación, [configuración](https://www.lazyvim.org/configuration) y
  [atajos por defecto](https://www.lazyvim.org/keymaps).
- [lazy.nvim](https://lazy.folke.io/): el gestor de plugins.
- [Documentación de Neovim](https://neovim.io/doc/).
