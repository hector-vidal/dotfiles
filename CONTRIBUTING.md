# Cómo contribuir

Gracias por querer mejorar estos dotfiles. Es un repositorio personal, pero los issues y los pull requests son
bienvenidos: errores en algún sistema operativo, configuraciones que no funcionan, documentación confusa o mejoras que
mantengan el estilo del repositorio.

Antes de empezar, lee el [README](README.md) y la guía de la herramienta que quieras tocar en [`docs/`](docs/).

## Issues

Busca primero en los [issues abiertos y cerrados](https://github.com/hector-vidal/dotfiles/issues?q=is%3Aissue) por si
ya está reportado.

Al crear un issue, GitHub ofrece dos formularios: **Reportar un error** y **Proponer una mejora**. Piden los datos de
las secciones siguientes.

### Reportar un error

Un buen reporte permite reproducir el fallo sin preguntas de ida y vuelta. Incluye:

| Dato | Ejemplo |
|---|---|
| Herramienta y archivo | WezTerm, `common/.wezterm.lua` |
| Sistema operativo y versión | macOS 15.4, Ubuntu 24.04, Windows 11 + WSL (Debian) |
| Versión de la herramienta | `wezterm --version`, `nvim --version`, `starship --version`... |
| Distribución de teclado, si el fallo es de atajos | Spanish-ISO, US |
| Cómo instalaste | akmon o symlinks a mano |
| Pasos para reproducirlo | 1. Abrir WezTerm. 2. Pulsar `Ctrl+Shift+O`... |
| Qué esperabas y qué pasó | Esperaba dividir el panel; en su lugar, la fuente se agrandó |
| Mensajes de error | El texto exacto, en un bloque de código |

Comprueba antes que el error viene de este repositorio y no de tu instalación. Las causas más comunes están en
[Trampas conocidas](README.md#trampas-conocidas). Por ejemplo, un `~/.config/wezterm/wezterm.lua` viejo que tiene
prioridad o un `bat cache --build` pendiente.

### Proponer una mejora

Explica qué problema resuelve y en qué sistemas lo probaste. Si es algo grande (una herramienta nueva o un cambio de
tema o de fuente), abre primero un issue para hablarlo antes de escribir el PR.

### Seguridad

Si encuentras un secreto expuesto en el historial o un problema de seguridad, **no abras un issue público**. Escríbeme
por [LinkedIn](https://www.linkedin.com/in/hz-eduardo-vidal/).

## Pull requests

### Flujo

1. Haz un fork y crea una rama desde `main` con un nombre descriptivo (`fix/wezterm-atajos-linux`,
   `docs/neovim-plugins`).
2. Activa el hook que bloquea secretos: `git config core.hooksPath .githooks`. Si tienes
   [gitleaks](https://github.com/gitleaks/gitleaks) instalado, el hook lo usa.
3. Haz el cambio y pruébalo en tu sistema (ver [Cómo probar](#cómo-probar)).
4. Abre el PR contra `main`, enlazando el issue si existe (`Closes #12`).

Un PR por tema: no mezcles, por ejemplo, un arreglo de WezTerm con un cambio de tema en Neovim.

### Reglas del repositorio

Estas reglas hacen que la misma configuración funcione para cualquier persona, en cualquier sistema:

- **Nada específico de un sistema operativo se aplica sin condición.** Lo que solo vale para macOS, Linux o Windows va
  dentro de un bloque condicional, siguiendo el patrón que ya usa cada archivo: `wezterm.target_triple` en WezTerm,
  `[platform]` en Rio, `vim.fn.has("wsl")` en Neovim y comprobaciones de binarios o rutas en `.zshrc`.
- **Sin rutas ni nombres de usuario escritos a mano.** Usa `$HOME`, `$USER` o la variable equivalente de la herramienta.
- **Sin secretos.** Ninguna API key, token ni credencial en archivos versionados. Su sitio es `~/.zshrc.local` (plantilla
  en `common/.zshrc.local.example`).
- **Layout de akmon.** Todo archivo instalable vive bajo `common/`, `darwin/`, `linux/` o `windows/` y se declara en
  `akmon.json`. Un archivo que no esté en el índice no se instala, y una ruta del índice que no exista hace fallar a akmon.
- **Aspecto unificado.** Tema Dracula y fuente `JetBrainsMono Nerd Font Mono`. Un cambio de tema o de fuente se aplica a
  WezTerm, Rio y bat a la vez.
- **Plantillas oficiales.** `rio/config.toml`, `bat/config`, `.zshrc` y los archivos de LazyVim conservan como comentarios
  los bloques de la plantilla original: no los borres; para activar una opción, descoméntala. Tampoco traduzcas sus
  comentarios en inglés.
- **Comentarios propios en español.**
- **Archivos generados.** `common/.config/nvim/lazy-lock.json` no se edita a mano: se actualiza con `:Lazy sync`.

### Documentación

Cada herramienta tiene su guía en `docs/<herramienta>.md`. Si tu cambio se nota al usarla (un atajo, una opción, un
color, un segmento del statusline), actualiza su guía en el mismo PR. Si cambia la salida del statusline de Claude Code,
regenera también `docs/img/statusline.svg`.

### Mensajes de commit

Formato `tipo(ámbito): descripción`, con la descripción en español y en minúscula:

```text
feat(claude): agrega archivo claude a nivel global
fix(wezterm): atajos de división independientes del teclado
docs(repo): README y guías por herramienta en docs/
```

| Parte | Valores |
|---|---|
| Tipo | `feat` (algo nuevo), `fix` (corrección), `docs` (solo documentación), `refactor` (mismo comportamiento, otro código), `chore` (mantenimiento) |
| Ámbito | El `id` de la herramienta en `akmon.json`: `zsh`, `starship`, `wezterm`, `rio`, `bat`, `git`, `neovim`, `claude`, `sincronizar-docs`. Para lo que está fuera del índice (README, CONTRIBUTING, `.github/`, `.githooks/`): `repo` |

El título del PR sigue el mismo formato.

### Cómo probar

No hay tests automáticos: la prueba es instalar la configuración y usarla. Según lo que toques:

```bash
# Índice de akmon: todas las rutas existen (debe imprimir OK)
python3 -c "import json,os;d=json.load(open('akmon.json'));print([p for i in d for p in i['files'] if not os.path.isfile(p)] or 'OK')"

# WezTerm: la configuración carga y los atajos son los esperados
wezterm --config-file common/.wezterm.lua show-keys --lua

# bat: reconstruir la caché tras tocar un tema
bat cache --build && bat --list-themes | grep Dracula

# Neovim: formato de los .lua
stylua --check common/.config/nvim

# Zsh: el archivo no tiene errores de sintaxis
zsh -n common/.zshrc
```

En la descripción del PR indica en qué sistemas lo probaste.

### Checklist del PR

Al abrir un PR, GitHub rellena la descripción con la plantilla
[`.github/pull_request_template.md`](.github/pull_request_template.md), que incluye esta lista:

- Probado en macOS, Linux o Windows + WSL.
- Lo específico de un sistema operativo va dentro de un bloque condicional.
- Sin rutas, usuarios ni secretos escritos a mano.
- Los archivos nuevos están declarados en `akmon.json` y el índice valida (`OK`).
- La guía de `docs/` de la herramienta está actualizada.
- Título y commits con el formato `tipo(ámbito): descripción`.

## Licencia

Al contribuir aceptas que tu aporte se publique bajo la [licencia MIT](LICENSE) del repositorio.
