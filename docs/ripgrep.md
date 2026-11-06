# ripgrep

[ripgrep](https://github.com/BurntSushi/ripgrep) (`rg`) busca texto con expresiones regulares en todos los archivos de
una carpeta, de forma recursiva y en paralelo, respetando `.gitignore`. No se crea alias `grep` → `rg`: las opciones no
coinciden y rompería scripts y comandos copiados.

## Instalación

Elemento de akmon: `ripgrep`.

| Archivo del repositorio | Destino |
|---|---|
| `common/.ripgreprc` | `~/.ripgreprc` |

```bash
brew install ripgrep         # macOS
sudo apt install ripgrep     # Debian/Ubuntu
```

ripgrep no busca su archivo de configuración por sí solo: `config.zsh` (elemento `zsh`) exporta
`RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"` si `rg` está instalado.

## Qué configura este repositorio

| Opción | Para qué |
|---|---|
| `--smart-case` | Sin distinguir mayúsculas, salvo que el patrón las lleve |
| `--hidden` y `--glob=!.git/*` | Busca en archivos ocultos, pero nunca dentro de `.git` |
| `--max-columns=150` y `--max-columns-preview` | Recorta las líneas muy largas (párrafos de Markdown en una línea) |

Cada línea del archivo es un argumento tal cual, sin comillas ni escapes. `rg --debug patrón` muestra qué opciones cargó
y por qué omitió cada archivo.

## Uso

| Comando | Para qué |
|---|---|
| `rg patrón [ruta]` | Busca de forma recursiva |
| `rg -t md patrón` | Solo un tipo de archivo; `rg --type-list` los lista |
| `rg -g '*.md' -g '!vendor/**' patrón` | Incluye o excluye por *glob* |
| `rg -F 'texto (literal)'` | Sin expresión regular |
| `rg -w palabra` | Palabra completa |
| `rg -C 2 patrón` | Con contexto; `-A` después, `-B` antes |
| `rg -l patrón`, `rg -c patrón` | Solo archivos, o número de coincidencias por archivo |
| `rg -U 'inicio[\s\S]*?fin'` | Coincidencias de varias líneas |
| `rg -uu patrón` | Sin exclusiones: incluye lo ignorado por `.gitignore` |
| `rg patrón -r reemplazo` | Muestra el reemplazo, sin tocar archivos |
| `rg --json -C 2 patrón \| delta` | Resultados con resaltado de [delta](delta.md) |

| grep | ripgrep |
|---|---|
| `grep -rn patrón .` | `rg patrón` |
| `grep -rl patrón .` | `rg -l patrón` |
| `grep -r --include='*.md' patrón .` | `rg -g '*.md' patrón` |

## Documentación oficial

- [Guía de usuario de ripgrep](https://github.com/BurntSushi/ripgrep/blob/master/GUIDE.md), con las secciones de
  opciones comunes y archivo de configuración.
