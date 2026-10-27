# Zsh y Oh My Zsh

[Zsh](https://www.zsh.org/) es el shell interactivo; [Oh My Zsh](https://ohmyz.sh/) es el framework que gestiona sus
plugins y temas. El prompt lo dibuja [Starship](starship.md).

## Instalación

Elemento de akmon: `zsh`.

| Archivo del repositorio | Destino |
|---|---|
| `common/.zshrc` | `~/.zshrc` |
| `common/.zshrc.local.example` | Plantilla: se copia a `~/.zshrc.local` (no se enlaza) |

Antes de usar este `.zshrc` hay que tener instalados Oh My Zsh y los dos plugins que **no** vienen con él:

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"
git clone https://github.com/zsh-users/zsh-autosuggestions "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"
```

El instalador de Oh My Zsh puede reemplazar `~/.zshrc`: crea el symlink de este repositorio **después** de instalarlo.

## Qué configura este repositorio

| Elemento | Valor | Para qué |
|---|---|---|
| Plugins | `git`, `zsh-syntax-highlighting`, `zsh-autosuggestions`, `command-not-found` | Alias de Git, colores al escribir, sugerencias del historial y aviso del paquete que falta |
| Prompt | `eval "$(starship init zsh)"` | Starship sustituye al tema `robbyrussell` de Oh My Zsh |
| `ls` | `lsd` | Listados con iconos y colores |
| `man` | `tldr` | Páginas de ayuda resumidas con ejemplos |
| `cat` | `bat` o `batcat` | Resaltado de sintaxis; elige el binario que exista |
| `npm` / `npx` | Funciones que no ejecutan nada | Recuerdan usar `pnpm`. Para un caso puntual: `command npm` |
| `windows11` | `cd` a la carpeta de usuario de Windows | Solo en WSL |
| `~/.zshrc.local` | Se carga al final si existe | Secretos y ajustes de cada máquina |

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
repositorio. `common/.zshrc` es público: nunca se le añade un secreto.

## Cómo seguir configurándolo

- Los bloques comentados en inglés son la plantilla de Oh My Zsh: se activan descomentándolos.
- Un plugin nuevo se añade a la lista `plugins=(...)`; si no es de los incluidos, hay que clonarlo en
  `$ZSH_CUSTOM/plugins/` como los dos de arriba.
- Recarga con `exec zsh`.

## Documentación oficial

- [Manual de Zsh](https://zsh.sourceforge.io/Doc/).
- [Wiki de Oh My Zsh](https://github.com/ohmyzsh/ohmyzsh/wiki) y [lista de plugins](https://github.com/ohmyzsh/ohmyzsh/wiki/Plugins).
- [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting) y [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions).
- [lsd](https://github.com/lsd-rs/lsd) y [tldr](https://tldr.sh/).
