# Dotfiles

Este repositorio contiene mi configuración personal de herramientas de terminal para mantener un entorno de desarrollo consistente y productivo.

## 🛠️ Herramientas Incluidas

### WezTerm
[WezTerm](https://wezfurlong.org/wezterm/) es un emulador de terminal multiplataforma, GPU-acelerado, desarrollado en Rust. Mi configuración incluye:
- Configuración personalizada de temas y colores
- Atajos de teclado optimizados
- Ajustes de fuente y diseño

### Zsh
[Zsh](https://www.zsh.org/) es un shell diseñado para uso interactivo que incorpora muchas características útiles de otros shells. En este repositorio encontrarás:
- Archivo `.zshrc` con mi configuración personal
- Aliases personalizados
- Funciones útiles para el día a día

### Oh-My-Zsh
[Oh-My-Zsh](https://ohmyz.sh/) es un framework para gestionar la configuración de Zsh. Mi setup incluye:
- Lista de plugins instalados y su configuración
- Tema seleccionado y personalizaciones
- Configuraciones específicas de plugins

### Starship
[Starship](https://starship.rs/) es un prompt minimalista, rápido y personalizable para cualquier shell. Aquí encontrarás:
- Archivo `starship.toml` con mi configuración
- Personalización de símbolos y estilos
- Módulos activados y su configuración

### Claude Code
[Claude Code](https://claude.com/claude-code) es el CLI de Claude para la terminal. Aquí encontrarás:
- Script `statusline-command.sh` que replica el prompt de Starship (usuario, host, directorio y rama)
- Modelo activo, barra de uso del contexto y porcentajes de límite de uso (5 h y 7 d)
- Plantilla `settings.json.example` con el bloque que activa el statusline y el que deniega `npm` y `npx`
- `CLAUDE.md` con las reglas globales de Claude Code: `pnpm` en lugar de `npm` y `npx`, reforzado por las funciones `npm` y `npx` de `.zshrc`

### Sincronizar docs
Script `sincronizar-docs.sh` que copia la carpeta `docs/` de cada repositorio de `~/Github` a su ficha en el vault de Obsidian (`~/Github/docs/Proyectos-docs/<repositorio>/docs/`). Lo invoca el gancho `post-commit` de cada repositorio; también se ejecuta a mano, sin argumento para todas las fichas o con el nombre de un repositorio.

## 📦 Instalación

1. Clona este repositorio:
```bash
git clone https://github.com/hector-vidal/dotfiles.git
cd dotfiles
```

2. Crea enlaces simbólicos a los archivos de configuración:
```bash
mkdir -p ~/.config ~/.config/rio ~/.config/bat ~/.claude ~/.local/bin

ln -s "$(pwd)/common/.wezterm.lua"              ~/.wezterm.lua
ln -s "$(pwd)/common/.zshrc"                    ~/.zshrc
ln -s "$(pwd)/common/.gitconfig"                ~/.gitconfig
ln -s "$(pwd)/common/.config/starship.toml"     ~/.config/starship.toml
ln -s "$(pwd)/common/.config/nvim"              ~/.config/nvim
ln -s "$(pwd)/common/.config/rio/config.toml"   ~/.config/rio/config.toml
ln -s "$(pwd)/common/.config/rio/themes"        ~/.config/rio/themes
ln -s "$(pwd)/common/.config/bat/config"        ~/.config/bat/config
ln -s "$(pwd)/common/.config/bat/themes"        ~/.config/bat/themes
ln -s "$(pwd)/common/.claude/statusline-command.sh" ~/.claude/statusline-command.sh
ln -s "$(pwd)/common/.claude/CLAUDE.md"             ~/.claude/CLAUDE.md
ln -s "$(pwd)/common/.local/bin/sincronizar-docs.sh" ~/.local/bin/sincronizar-docs.sh

# El tema de bat solo se aplica tras reconstruir su caché
bat cache --build
```

El statusline de Claude Code necesita [`jq`](https://jqlang.github.io/jq/) y que
los bloques `statusLine` y `permissions` de `common/.claude/settings.json.example` se **fusionen** a
mano en `~/.claude/settings.json`: ese archivo también guarda tus plugins y
ajustes locales, así que no debe sobrescribirse.

3. Crea tu archivo de configuración local para secretos y ajustes por máquina:
```bash
cp common/.zshrc.local.example ~/.zshrc.local
chmod 600 ~/.zshrc.local
```

`~/.zshrc.local` no forma parte del repositorio. Es el único sitio donde deben
vivir las API keys, tokens y variables con datos sensibles: `common/.zshrc` lo
carga automáticamente al final si existe.

4. Activa el hook que impide subir secretos por accidente:
```bash
git config core.hooksPath .githooks
```

Opcionalmente instala [gitleaks](https://github.com/gitleaks/gitleaks) para un
análisis más completo (`brew install gitleaks`); sin él, el hook aplica un
escaneo de respaldo por patrones.

## 📁 Estructura del repositorio

Los archivos se organizan según el layout que espera [akmon](https://github.com/), que
instala configuraciones descargando archivos sueltos desde GitHub. El primer segmento de
cada ruta indica el sistema operativo (`common`, `darwin`, `linux`, `windows`) y el resto
es la ruta relativa al directorio personal:

```text
common/.zshrc                    → ~/.zshrc
common/.config/starship.toml     → ~/.config/starship.toml
common/.config/nvim/init.lua     → ~/.config/nvim/init.lua
```

Todas las configuraciones están en `common/` porque funcionan igual en macOS y en Linux:
las diferencias por sistema se resuelven dentro de cada archivo (detección de `wsl`,
`target_triple` en WezTerm, `[platform]` en Rio) en lugar de duplicar archivos.

`akmon.json` en la raíz es el índice que declara qué se puede instalar. Cada elemento
(`zsh`, `starship`, `wezterm`, `rio`, `bat`, `git`, `neovim`, `claude`, `sincronizar-docs`) se instala por separado.

## ⚙️ Personalización

Siéntete libre de explorar y adaptar estas configuraciones a tus necesidades. Cada herramienta tiene su propia carpeta con documentación específica sobre las personalizaciones realizadas.

Las configuraciones no contienen rutas ni nombres de usuario codificados: se
apoyan en `$HOME`/`$USER` y en la detección del sistema operativo, de modo que
funcionan igual para cualquier persona que las clone, en macOS, Linux o
Windows con WSL.


## 📫 Contacto

¡Me encantaría conocer cómo utilizas estas configuraciones! Si estás interesado en otros proyectos en los que trabajo, te invito a revisar mis otros repositorios. También puedes contactarme a través de mi perfil de [LinkedIn](https://www.linkedin.com/in/hz-eduardo-vidal/).

## 📝 Licencia

Este proyecto está bajo la Licencia MIT - ver el archivo [LICENSE](LICENSE) para más detalles.
