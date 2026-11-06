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
| `lua/config/lazy.lua` | `{ import = "extras.langs" }` antes de `{ import = "plugins" }` | Carga los extras de LazyVim y después los plugins propios |
| `lua/extras/langs.lua` | Extras `lang.python`, `lang.docker`, `lang.markdown` y el servidor `bashls` | Soporte de Python, Docker, Markdown y Bash |
| `lua/plugins/markdown.lua` | render-markdown.nvim con `preset = "obsidian"`, casillas visibles y LaTeX desactivado; markdownlint-cli2 con `--config ~/.markdownlint-cli2.yaml` | Markdown renderizado dentro del búfer, con aspecto de Obsidian, y linter sin falsos avisos |

`keymaps.lua` y `lua/plugins/example.lua` son los de la plantilla de LazyVim; `example.lua` empieza con
`if true then return {} end` y no carga nada.

La primera vez que se abre un archivo con el corrector activo, Neovim pregunta si descarga el diccionario español
(`No spell file found for es`): hay que responder `y`.

## Markdown

El extra `lang.markdown` trae [render-markdown.nvim](https://github.com/MeanderingProgrammer/render-markdown.nvim)
(render en el búfer: la línea del cursor vuelve al texto en crudo), markdown-preview.nvim (vista en el navegador) y
markdownlint.

| Atajo o comando | Para qué |
|---|---|
| `<leader>um` | Activa o desactiva el render en el búfer |
| `<leader>cp` | Abre o cierra la vista en el navegador |
| `:checkhealth render-markdown` | Comprueba parsers e iconos |

### markdownlint

Elemento de akmon: `neovim` (archivo `common/.markdownlint-cli2.yaml`, destino `~/.markdownlint-cli2.yaml`). Neovim lo
pasa a markdownlint-cli2 como configuración base; si el archivo no existe, el linter usa sus reglas por defecto. El
`.markdownlint*` de un repositorio se aplica encima.

| Regla | Ajuste | Por qué |
|---|---|---|
| MD013 (largo de línea) | Desactivada | Un párrafo por línea: Obsidian y GitHub ajustan el texto al ancho de la ventana |
| MD060 (estilo de tabla) | Desactivada | Tablas con `\|---\|` sin alinear las columnas |
| MD028 (blockquote con línea en blanco) | Desactivada | Alerts de GitHub y callouts de Obsidian seguidos |
| MD025 (un solo H1) | `front_matter_title: ""` | El `title` del frontmatter no cuenta como segundo H1 |
| MD024 (encabezados repetidos) | `siblings_only: true` | Se permite repetir un encabezado bajo secciones distintas |

El resto de reglas sigue activo: listas sin línea en blanco alrededor, bloques de código sin lenguaje, espacios al final.
Sin esta base, una nota normal de un vault de Obsidian da decenas de avisos por pantalla. Desde la terminal, con la misma
base: `markdownlint-cli2 --config ~/.markdownlint-cli2.yaml "**/*.md"`.

Los avisos de enlaces (`Link to non-existent document`, `Ambiguous link`) vienen de marksman, el servidor de lenguaje,
no de markdownlint. Salen con enlaces codificados (`%C3%A9`) a archivos cuyo nombre con acentos está guardado
descompuesto (NFD), algo habitual en macOS: marksman no los iguala, aunque Obsidian y GitHub sí abren esos enlaces.

## Diferencias por sistema operativo

El bloque del portapapeles solo se activa en WSL (`vim.fn.has("wsl")`). En macOS y Linux, Neovim usa el portapapeles del
sistema sin configuración extra.

## Cómo seguir configurándolo

- **Plugins nuevos**: crea un archivo en `lua/plugins/` (uno por plugin o por tema) que devuelva su especificación.
  Usa `example.lua` como referencia, pero no lo edites.
- **Extras de LazyVim** (lenguajes, formateadores...): se declaran en `lua/extras/langs.lua` con
  `{ import = "lazyvim.plugins.extras.<grupo>.<nombre>" }`, para que queden versionados junto al resto.
- **Actualizar plugins**: `:Lazy sync`. Reescribe `lazy-lock.json`, que **no se edita a mano**. Si añade archivos nuevos
  a la carpeta, decláralos también en `akmon.json`.
- **Formato**: los `.lua` siguen `stylua.toml`; formatea con `stylua common/.config/nvim`.

## Documentación oficial

- [LazyVim](https://www.lazyvim.org/): instalación, [configuración](https://www.lazyvim.org/configuration) y
  [atajos por defecto](https://www.lazyvim.org/keymaps).
- [lazy.nvim](https://lazy.folke.io/): el gestor de plugins.
- [Extra de Markdown de LazyVim](https://www.lazyvim.org/extras/lang/markdown),
  [render-markdown.nvim](https://github.com/MeanderingProgrammer/render-markdown.nvim) y
  [reglas de markdownlint](https://github.com/DavidAnson/markdownlint/blob/main/doc/Rules.md).
- [Documentación de Neovim](https://neovim.io/doc/).
