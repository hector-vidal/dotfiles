# delta

[delta](https://github.com/dandavison/delta) es el pager de Git: muestra `git diff`, `git log -p`, `git show`,
`git add -p` y `git blame` con resaltado de sintaxis, números de línea y las palabras que cambian dentro de cada línea. No
cambia ningún comando: Git lo usa solo.

## Instalación

Su configuración vive en el elemento de akmon `git` (`common/.gitconfig`). Ver [git.md](git.md#instalación).

```bash
brew install git-delta   # macOS; el binario se llama delta
```

**delta tiene que estar instalado antes de usar este `.gitconfig`**: si falta, Git falla al abrir el pager. En un equipo
sin delta, quita las líneas `pager` y `diffFilter`.

## Qué configura este repositorio

| Ajuste | Valor | Para qué |
|---|---|---|
| `core.pager` | `delta` | Pager de todos los comandos de Git |
| `interactive.diffFilter` | `delta --color-only` | Resaltado en `git add -p` sin romper el parche |
| `delta.navigate` | `true` | `n` y `N` saltan entre archivos y bloques |
| `delta.dark` | `true` | Colores para fondo oscuro |
| `delta.syntax-theme` | `Dracula` | El mismo tema que [bat](bat.md) |
| `delta.line-numbers` | `true` | Números de línea en dos columnas |
| `delta.hyperlinks` | `true` | Rutas, líneas y commits clicables (OSC 8) en WezTerm y en [tmux](tmux.md) |
| `merge.conflictStyle` | `zdiff3` | Los conflictos muestran también el bloque común |

La vista lado a lado no se fija: en un panel estrecho se vuelve ilegible. Se activa cuando hace falta.

## Uso

| Comando | Para qué |
|---|---|
| `git diff`, `git show`, `git log -p` | Igual que siempre, ya con delta |
| `git add -p` | Selección de bloques con resaltado |
| `n` / `N` | Siguiente o anterior archivo o bloque, dentro del pager |
| `git -c delta.side-by-side=true diff` | Lado a lado para un solo comando |
| `export DELTA_FEATURES=+side-by-side` | Lado a lado para la sesión; `export DELTA_FEATURES=+` lo quita |
| `delta a.txt b.txt` | Dos archivos fuera de Git |
| `rg --json -C 2 patrón \| delta` | Resultados de [ripgrep](ripgrep.md) con resaltado |
| `delta --show-syntax-themes` | Temas disponibles |
| `delta --show-config` | Valores activos |

Los alias `gll` y `gls` no cambian: delta deja pasar sin tocar la salida que no es un diff.

## Documentación oficial

- [Manual de delta](https://dandavison.github.io/delta/): [primeros pasos](https://dandavison.github.io/delta/get-started.html),
  [lado a lado](https://dandavison.github.io/delta/side-by-side-view.html) y
  [hipervínculos](https://dandavison.github.io/delta/hyperlinks.html).
