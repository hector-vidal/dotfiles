# fzf y fzf-tab

[fzf](https://github.com/junegunn/fzf) es un buscador difuso: recibe una lista (archivos, directorios, ramas, procesos) y
deja elegir tecleando fragmentos. [fzf-tab](https://github.com/Aloxaf/fzf-tab) es un plugin de Zsh que abre en fzf el
menú de autocompletado de `Tab`. La lista de archivos la genera [fd](https://github.com/sharkdp/fd) y la vista previa,
[bat](bat.md).

## Instalación

Su configuración vive en el elemento de akmon `zsh` (`common/.config/zsh/config.zsh`). Ver [zsh.md](zsh.md).

```bash
brew install fzf fd   # macOS
git clone https://github.com/Aloxaf/fzf-tab "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fzf-tab"
```

`config.zsh` solo activa cada pieza si existe: fzf si está instalado, fd como fuente si está instalado y fzf-tab si está
clonado. En Debian/Ubuntu el paquete `fd-find` instala el binario como `fdfind`: sin un enlace `fd`, fzf usa su
recorrido interno.

## Qué configura este repositorio

| Ajuste | Valor | Para qué |
|---|---|---|
| `FZF_DEFAULT_COMMAND`, `FZF_CTRL_T_COMMAND` | `fd --type f --hidden --follow --exclude .git` | Archivos, incluidos ocultos, sin `.git` y respetando `.gitignore` |
| `FZF_ALT_C_COMMAND` | `fd --type d …` | Directorios para `Alt-C` |
| `_fzf_compgen_path`, `_fzf_compgen_dir` | fd | Candidatos de `**<Tab>` |
| `FZF_CTRL_T_OPTS` | Vista previa con `bat` y `Ctrl-/` para moverla | Ver el archivo antes de elegirlo |
| `FZF_ALT_C_OPTS` | Vista previa con `lsd --tree` | Ver el directorio antes de entrar |
| `FZF_DEFAULT_OPTS` | Colores Dracula | El tema común del repositorio |
| `FZF_CTRL_R_COMMAND=` | Vacío, en la línea del `source` | `Ctrl-R` se queda en [Atuin](https://atuin.sh/) si está instalado |
| `plugins=(git fzf-tab …)` | fzf-tab antes de `zsh-syntax-highlighting` y `zsh-autosuggestions` | Orden de carga que exige fzf-tab |
| `zstyle ':fzf-tab:…'` | Vista previa con `lsd` al completar `cd`, grupos con `<` y `>` | Ver el contenido de cada directorio al elegir |

## Uso

| Tecla o comando | Para qué |
|---|---|
| `Ctrl-T` | Elige archivos y los pega en la línea de comandos |
| `Alt-C` (o `Esc` y `c`) | Elige un directorio y entra en él |
| `**` + `Tab` | Completa rutas con fzf: `nvim **<Tab>`, `cd ~/proyectos/**<Tab>` |
| `Tab` | Con fzf-tab, cualquier autocompletado de Zsh se abre en fzf |
| `<` / `>` | Cambia de grupo de resultados en fzf-tab |
| `'palabra`, `^inicio`, `final$`, `!excluir` | Búsqueda exacta, por inicio, por final o excluyendo |
| `Tab` / `Shift-Tab` dentro de fzf | Marcar varios (con `fzf -m`) |
| `nvim $(fzf)` | Abre el archivo elegido |
| `git branch \| fzf \| xargs git switch` | Cambia de rama eligiéndola |
| `rg -l patrón \| fzf --preview 'rg --color=always -n patrón {}'` | Archivos con coincidencias, con vista previa |

## Trampas

- **`Alt-C` no llega con la [configuración de WezTerm](wezterm.md) de este repositorio**: Option compone caracteres, así
  que Option-C escribe `ç`. Se lanza con `Esc` seguido de `c`, que Zsh trata como Meta.
- **`FZF_CTRL_R_COMMAND=` tiene que ir en la misma línea que `source <(fzf --zsh)`**: puesta después no surte efecto.
- Al arrancar Zsh sin terminal (`zsh -i -c …`), el script de fzf avisa `can't change option: zle`. En uso interactivo no
  aparece.

## Documentación oficial

- [README de fzf](https://github.com/junegunn/fzf#readme): integración con la shell, atajos y uso con fd.
- [Esquemas de color de fzf](https://github.com/junegunn/fzf/wiki/Color-schemes).
- [README de fzf-tab](https://github.com/Aloxaf/fzf-tab#readme) y su [wiki de configuración](https://github.com/Aloxaf/fzf-tab/wiki/Configuration).
- [README de fd](https://github.com/sharkdp/fd#readme).
