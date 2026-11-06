# Zsh y Oh My Zsh

[Zsh](https://www.zsh.org/) es el shell interactivo; [Oh My Zsh](https://ohmyz.sh/) es el framework que gestiona sus
plugins y temas. El prompt lo dibuja [Starship](starship.md).

## Instalación

Elemento de akmon: `zsh`.

| Archivo del repositorio | Destino | Cómo |
|---|---|---|
| `common/.config/zsh/config.zsh` | `~/.config/zsh/config.zsh` | Enlace: es la configuración versionada |
| `common/.zshrc` | `~/.zshrc` | **Copia, nunca enlace**: es el cargador local de cada equipo |
| `common/.zshrc.local.example` | Plantilla: se copia a `~/.zshrc.local` (no se enlaza) | Copia |

Antes hay que tener instalados Oh My Zsh y los plugins que **no** vienen con él:

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"
git clone https://github.com/zsh-users/zsh-autosuggestions "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"
git clone https://github.com/Aloxaf/fzf-tab "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fzf-tab"   # opcional, ver fzf.md
```

El instalador de Oh My Zsh reemplaza `~/.zshrc`: copia el cargador **después** de instalarlo.

### Por qué `~/.zshrc` no se enlaza

Los instaladores (pnpm, fnm, Atuin, pyenv, Docker Desktop...) añaden líneas a `~/.zshrc`, con rutas absolutas del
equipo. Si `~/.zshrc` fuera un enlace a este repositorio, esas rutas acabarían publicadas. Por eso se reparte en dos:

- `~/.config/zsh/config.zsh` (enlazado): todo lo portable. Cada herramienta se activa solo si está instalada.
- `~/.zshrc` (local): una línea que carga `config.zsh` y, debajo, lo que añadan los instaladores y los alias propios del
  equipo.

## Qué configura este repositorio

| Elemento | Valor | Para qué |
|---|---|---|
| Plugins | `git`, `fzf-tab` (si está clonado y hay fzf), `zsh-syntax-highlighting`, `zsh-autosuggestions`, `command-not-found` | Alias de Git, autocompletado con fzf, colores al escribir, sugerencias del historial y aviso del paquete que falta |
| Prompt | `eval "$(starship init zsh)"` | Starship sustituye al tema `robbyrussell` de Oh My Zsh |
| `ls` | `lsd` | Listados con iconos y colores |
| `man` | `tldr` | Páginas de ayuda resumidas con ejemplos |
| `tree` | `broot` | Árbol de directorios navegable |
| `vim` | `nvim` | Abre Neovim |
| `cat` | `bat` o `batcat` | Resaltado de sintaxis; elige el binario que exista |
| fzf | fd como fuente, vista previa con bat, colores Dracula, `Ctrl-R` libre para Atuin | Ver [fzf.md](fzf.md) |
| `RIPGREP_CONFIG_PATH` | `~/.ripgreprc` | Ver [ripgrep.md](ripgrep.md) |
| `npm` / `npx` | Funciones que no ejecutan nada | Recuerdan usar `pnpm`. Para un caso puntual: `command npm` |
| `windows11` | `cd` a la carpeta de usuario de Windows | Solo en WSL |
| `~/.zshrc.local` | Se carga al final si existe | Secretos y ajustes de cada máquina |

Cada alias y cada herramienta se activan solo si el programa está instalado, así que `config.zsh` funciona en un equipo
al que le falten algunas.

## Diferencias por sistema operativo

- **Debian/Ubuntu**: `bat` se instala como `batcat`; el alias `cat` lo detecta solo.
- **WSL**: el alias `windows11` solo se define si existe `/mnt/c/Users`. Si tu usuario de Windows no se llama igual que el
  de Linux, define `WIN_USER` en `~/.zshrc.local`.

## Secretos: `~/.zshrc.local`

```bash
cp common/.zshrc.local.example ~/.zshrc.local
chmod 600 ~/.zshrc.local
```

Las API keys, tokens y cualquier `export` con datos sensibles van **solo** en `~/.zshrc.local`, que no está en el
repositorio. `config.zsh` es público: nunca se le añade un secreto.

## Cómo seguir configurándolo

- Los bloques comentados en inglés son la plantilla de Oh My Zsh: se activan descomentándolos.
- Lo portable se añade a `config.zsh`; lo propio de un equipo, debajo de la línea de carga de `~/.zshrc`.
- Un plugin nuevo se añade a la lista `plugins=(...)` de `config.zsh`; si no es de los incluidos, hay que clonarlo en
  `$ZSH_CUSTOM/plugins/` como los dos de arriba.
- Recarga con `exec zsh`.

## Documentación oficial

- [Manual de Zsh](https://zsh.sourceforge.io/Doc/).
- [Wiki de Oh My Zsh](https://github.com/ohmyzsh/ohmyzsh/wiki) y [lista de plugins](https://github.com/ohmyzsh/ohmyzsh/wiki/Plugins).
- [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting) y [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions).
- [lsd](https://github.com/lsd-rs/lsd) y [tldr](https://tldr.sh/).
