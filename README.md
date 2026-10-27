<h1 align="center">dotfiles</h1>

<p align="center">
  <strong>Configuración de terminal portable para macOS, Linux y Windows con WSL.</strong><br>
  Tema Dracula y JetBrainsMono Nerd Font en todas las herramientas, sin rutas ni usuarios escritos a mano.
</p>

<p align="center">
  <img src="https://img.shields.io/badge/macOS%20%C2%B7%20Linux%20%C2%B7%20WSL-compatible-555?logo=apple&logoColor=white" alt="macOS, Linux y WSL">
  <img src="https://img.shields.io/badge/tema-Dracula-bd93f9" alt="Tema Dracula">
  <img src="https://img.shields.io/badge/Zsh-Oh%20My%20Zsh-F15A24?logo=zsh&logoColor=white" alt="Zsh con Oh My Zsh">
  <img src="https://img.shields.io/badge/Starship-prompt-DD0B78?logo=starship&logoColor=white" alt="Starship">
  <img src="https://img.shields.io/badge/Neovim-LazyVim-57A143?logo=neovim&logoColor=white" alt="Neovim con LazyVim">
  <img src="https://img.shields.io/badge/Claude%20Code-statusline-D97757?logo=claude&logoColor=white" alt="Claude Code">
  <img src="https://img.shields.io/badge/licencia-MIT-blue" alt="Licencia MIT">
</p>

<p align="center">
  <a href="#herramientas">Herramientas</a> ·
  <a href="#puesta-en-marcha">Puesta en marcha</a> ·
  <a href="#trampas-conocidas">Trampas conocidas</a> ·
  <a href="#estructura-del-repositorio">Estructura</a> ·
  <a href="#dónde-encontrar-más-información">Documentación</a>
</p>

---

## Qué es

Mi configuración personal de las herramientas de terminal que uso a diario: shell, prompt, emuladores de terminal,
editor, Git y Claude Code. Todas comparten el tema [Dracula](https://draculatheme.com/) y la fuente
[JetBrainsMono Nerd Font](https://www.nerdfonts.com/font-downloads), de modo que el entorno se ve igual se abra donde se
abra.

Las configuraciones funcionan para cualquier persona que clone el repositorio: se apoyan en `$HOME`, `$USER` y en la
detección del sistema operativo, nunca en rutas o nombres de usuario fijos. Se instalan con
[akmon](https://github.com/hector-vidal/akmon), que permite elegir solo las herramientas que quieras, o con symlinks a
mano.

## Herramientas

| Herramienta | Qué aporta | Archivos | Guía |
|---|---|---|---|
| [Zsh](https://www.zsh.org/) + [Oh My Zsh](https://ohmyz.sh/) | Plugins de resaltado y sugerencias, alias (`ls`→`lsd`, `cat`→`bat`, `man`→`tldr`), bloqueo de `npm`/`npx` y secretos fuera del repositorio | `.zshrc`, `.zshrc.local.example` | [zsh.md](docs/zsh.md) |
| [Starship](https://starship.rs/) | Prompt con usuario, host, directorio y rama de Git | `.config/starship.toml` | [starship.md](docs/starship.md) |
| [WezTerm](https://wezterm.org/) | Terminal con transparencia, pestañas abajo y atajos para dividir paneles | `.wezterm.lua` | [wezterm.md](docs/wezterm.md) |
| [Rio](https://rioterm.com/) | Terminal alternativa con el mismo aspecto | `.config/rio/` | [rio.md](docs/rio.md) |
| [bat](https://github.com/sharkdp/bat) | `cat` con resaltado, con el tema Dracula corregido para que los números de línea se lean | `.config/bat/` | [bat.md](docs/bat.md) |
| [Git](https://git-scm.com/) | Alias `gll` y `gls` para ver el historial como grafo | `.gitconfig` | [git.md](docs/git.md) |
| [Neovim](https://neovim.io/) | [LazyVim](https://www.lazyvim.org/) con corrector en español y portapapeles para WSL | `.config/nvim/` | [neovim.md](docs/neovim.md) |
| [Claude Code](https://code.claude.com/docs) | Reglas globales (`pnpm` en lugar de `npm`) y un statusline con modelo, contexto y límites de uso | `.claude/` | [claude-code.md](docs/claude-code.md) |
| Sincronizar docs | Script que copia `docs/` de cada repositorio a un vault de Obsidian | `.local/bin/sincronizar-docs.sh` | [sincronizar-docs.md](docs/sincronizar-docs.md) |

Las rutas de la columna Archivos son relativas a `common/` en el repositorio y a `~` una vez instaladas.

<p align="center">
  <img src="docs/img/statusline.svg" alt="Statusline de Claude Code con el contexto al 42, 68 y 87 por ciento" width="100%">
</p>
<p align="center">
  <sub>El statusline de Claude Code. Qué significa cada segmento en <a href="docs/claude-code.md#statusline">docs/claude-code.md</a>.</sub>
</p>

## Puesta en marcha

### Prerrequisitos

Instala solo los de las herramientas que vayas a usar.

| Herramienta | Para qué | macOS | Debian/Ubuntu |
|---|---|---|---|
| Git | Clonar el repositorio | `xcode-select --install` | `sudo apt install git` |
| JetBrainsMono Nerd Font | Fuente e iconos en todas las terminales | `brew install --cask font-jetbrains-mono-nerd-font` | [nerdfonts.com](https://www.nerdfonts.com/font-downloads) |
| Zsh + Oh My Zsh | Shell | [ohmyz.sh](https://ohmyz.sh/#install) | `sudo apt install zsh` + [ohmyz.sh](https://ohmyz.sh/#install) |
| Plugins de Zsh | `zsh-syntax-highlighting`, `zsh-autosuggestions` | Ver [zsh.md](docs/zsh.md#instalación) | Ver [zsh.md](docs/zsh.md#instalación) |
| starship, lsd, bat, tldr | Prompt y alias de `.zshrc` | `brew install starship lsd bat tlrc` | `sudo apt install lsd bat tldr` + [starship](https://starship.rs/#quick-install) |
| WezTerm o Rio | Emulador de terminal | `brew install --cask wezterm` / `brew install --cask rio` | [wezterm.org](https://wezterm.org/install/linux.html) / [rioterm.com](https://rioterm.com/docs/install) |
| Neovim | Editor | `brew install neovim` | [neovim.io](https://github.com/neovim/neovim/blob/master/INSTALL.md) |
| jq | Statusline de Claude Code | `brew install jq` | `sudo apt install jq` |

### Opción A: akmon

[akmon](https://github.com/hector-vidal/akmon) lee el índice `akmon.json` de este repositorio, muestra qué herramientas
ofrece y cuáles ya tienes, e instala solo las que elijas. Nunca sobrescribe un archivo existente sin preguntar.

> akmon todavía no es público. Mientras tanto, usa la opción B.

```bash
akmon   # en la bienvenida, apunta los dotfiles a hector-vidal/dotfiles
```

### Opción B: symlinks a mano

```bash
git clone https://github.com/hector-vidal/dotfiles.git
cd dotfiles

mkdir -p ~/.config ~/.config/rio ~/.config/bat ~/.claude ~/.local/bin

ln -s "$(pwd)/common/.wezterm.lua"                   ~/.wezterm.lua
ln -s "$(pwd)/common/.zshrc"                         ~/.zshrc
ln -s "$(pwd)/common/.gitconfig"                     ~/.gitconfig
ln -s "$(pwd)/common/.config/starship.toml"          ~/.config/starship.toml
ln -s "$(pwd)/common/.config/nvim"                   ~/.config/nvim
ln -s "$(pwd)/common/.config/rio/config.toml"        ~/.config/rio/config.toml
ln -s "$(pwd)/common/.config/rio/themes"             ~/.config/rio/themes
ln -s "$(pwd)/common/.config/bat/config"             ~/.config/bat/config
ln -s "$(pwd)/common/.config/bat/themes"             ~/.config/bat/themes
ln -s "$(pwd)/common/.claude/statusline-command.sh"  ~/.claude/statusline-command.sh
ln -s "$(pwd)/common/.claude/CLAUDE.md"              ~/.claude/CLAUDE.md
ln -s "$(pwd)/common/.local/bin/sincronizar-docs.sh" ~/.local/bin/sincronizar-docs.sh
```

`ln -s` falla si el destino ya existe: revisa ese archivo, guarda lo que quieras conservar y bórralo o renómbralo antes.

### Después de instalar

```bash
# 1. Secretos y ajustes de esta máquina (nunca en el repositorio)
cp common/.zshrc.local.example ~/.zshrc.local
chmod 600 ~/.zshrc.local

# 2. El tema de bat solo se aplica tras reconstruir su caché
bat cache --build

# 3. Solo si vas a hacer commits en este repositorio: hook que bloquea secretos
git config core.hooksPath .githooks
```

Para Claude Code, además, **fusiona** a mano los bloques `statusLine` y `permissions` de
`common/.claude/settings.json.example` en tu `~/.claude/settings.json`. Los detalles están en
[claude-code.md](docs/claude-code.md#ajustes-settingsjsonexample).

## Trampas conocidas

- **WezTerm ignora `~/.wezterm.lua` si existe `~/.config/wezterm/wezterm.lua`.** Ese archivo tiene prioridad. Renómbralo
  o bórralo; `wezterm show-keys --lua` muestra qué configuración está activa.
- **El tema de bat no cambia hasta ejecutar `bat cache --build`.** Hay que repetirlo cada vez que se toca un tema.
- **`~/.claude/settings.json` no se enlaza ni se sobrescribe.** También guarda tus plugins y ajustes locales: solo se le
  añaden los bloques de la plantilla.
- **Los plugins `zsh-syntax-highlighting` y `zsh-autosuggestions` no vienen con Oh My Zsh.** Sin clonarlos, Zsh avisa al
  arrancar de que no los encuentra.
- **El instalador de Oh My Zsh reemplaza `~/.zshrc`.** Instálalo antes de crear el symlink.
- **En Debian/Ubuntu, bat se llama `batcat`.** El alias `cat` de `.zshrc` lo detecta solo.
- **Con teclado Spanish-ISO, `Ctrl+Shift+O` es la letra O, no el cero.** `Ctrl+Shift+0` en WezTerm agranda la fuente.

## Estructura del repositorio

```text
common/            Archivos que se instalan, con la misma ruta que tendrán bajo ~
  .zshrc  .zshrc.local.example  .gitconfig  .wezterm.lua
  .config/         starship.toml, nvim/, rio/, bat/
  .claude/         CLAUDE.md, statusline-command.sh, settings.json.example
  .local/bin/      sincronizar-docs.sh
docs/              Guía de cada herramienta e imágenes
akmon.json         Índice de lo que se puede instalar con akmon
.githooks/         Hook pre-commit que bloquea secretos
```

El primer segmento de cada ruta es el sistema operativo (`common`, `darwin`, `linux` o `windows`) y el resto es la ruta
bajo `~`: `common/.config/nvim/init.lua` se instala en `~/.config/nvim/init.lua`. Todo está en `common/` porque las
diferencias entre sistemas se resuelven dentro de cada archivo (detección de WSL en Neovim, `target_triple` en WezTerm,
`[platform]` en Rio) en lugar de duplicarlos.

`akmon.json` declara cada herramienta como un elemento independiente con su lista de archivos. **Un archivo que no esté
en esa lista no se instala con akmon.**

## Secretos

Ningún archivo versionado contiene credenciales. Las API keys y los tokens van en `~/.zshrc.local`, que `.zshrc` carga
al final y que está en `.gitignore`. El hook `.githooks/pre-commit` revisa cada commit con
[gitleaks](https://github.com/gitleaks/gitleaks) si está instalado (`brew install gitleaks`) y, si no, con un escaneo de
respaldo por patrones.

## Dónde encontrar más información

Cada guía explica qué configura el repositorio, cómo seguir configurándolo y enlaza a la documentación oficial.

| Necesito... | Ver |
|---|---|
| Plugins, alias y secretos de Zsh | [docs/zsh.md](docs/zsh.md) |
| Módulos y colores del prompt | [docs/starship.md](docs/starship.md) |
| Atajos y opciones de WezTerm | [docs/wezterm.md](docs/wezterm.md) |
| Opciones de Rio y su bloque por sistema | [docs/rio.md](docs/rio.md) |
| Tema y estilo de bat | [docs/bat.md](docs/bat.md) |
| Por qué el tema Dracula de bat difiere del original | [docs/bat-dracula-line-numbers.md](docs/bat-dracula-line-numbers.md) |
| Alias de Git y ejemplos de salida | [docs/git.md](docs/git.md) |
| Ajustes sobre LazyVim y cómo añadir plugins | [docs/neovim.md](docs/neovim.md) |
| Reglas globales, ajustes y statusline de Claude Code | [docs/claude-code.md](docs/claude-code.md) |
| Copia de `docs/` al vault de Obsidian | [docs/sincronizar-docs.md](docs/sincronizar-docs.md) |
| Qué archivos instala cada elemento de akmon | [akmon.json](akmon.json) |
| Reportar un error, proponer una mejora o abrir un PR | [CONTRIBUTING.md](CONTRIBUTING.md) |

## Contacto

Si usas estas configuraciones o tienes una sugerencia, me encantará saberlo. Puedes escribirme por
[LinkedIn](https://www.linkedin.com/in/hz-eduardo-vidal/) o revisar mis otros repositorios.

## Licencia

MIT. Ver [LICENSE](LICENSE).
