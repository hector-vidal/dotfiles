# iTerm2

[iTerm2](https://iterm2.com/) es un emulador de terminal solo para macOS. En este repositorio se configura con un
[perfil dinámico](https://iterm2.com/documentation-dynamic-profiles.html): un JSON que iTerm2 carga y recarga solo, sin
tocar sus preferencias. Tiene el mismo tema, la misma fuente y los mismos atajos de división que [WezTerm](wezterm.md).

## Instalación

Elemento de akmon: `iterm2`. Es el único archivo de `darwin/`: solo se instala en macOS.

| Archivo del repositorio | Destino |
|---|---|
| `darwin/Library/Application Support/iTerm2/DynamicProfiles/dotfiles.json` | `~/Library/Application Support/iTerm2/DynamicProfiles/dotfiles.json` |

A mano, con un symlink (la ruta lleva un espacio, de ahí las comillas):

```bash
mkdir -p ~/Library/Application\ Support/iTerm2/DynamicProfiles
ln -s "$(pwd)/darwin/Library/Application Support/iTerm2/DynamicProfiles/dotfiles.json" \
  ~/Library/Application\ Support/iTerm2/DynamicProfiles/dotfiles.json
```

Después, **una vez por equipo**, márcalo como perfil por defecto: Settings → Profiles → selecciona `Dotfiles` → Other
Actions… → Set as Default. Un perfil dinámico no se vuelve el predeterminado solo, y sin ese paso las ventanas nuevas
siguen abriéndose con el perfil anterior.

## Qué configura este repositorio

| Opción | Valor | Para qué |
|---|---|---|
| `Name` / `Guid` | `Dotfiles`, GUID fijo | Identifica el perfil; los atajos de división apuntan a ese GUID |
| `Normal Font` | `JetBrainsMonoNFM-Regular 13` | JetBrainsMono Nerd Font Mono a 13, la fuente común a todas las herramientas |
| `Custom Directory` | `Recycle` | Ventanas, pestañas y paneles nuevos abren en el directorio de la sesión activa |
| `Ansi 0 Color` … `Selection Color` | Dracula | Colores de [dracula/iterm](https://github.com/dracula/iterm), copiados tal cual |

Lo que no está en el JSON lo hereda el perfil de los valores por defecto de iTerm2.

## Atajos

| Atajo | Acción |
|---|---|
| `Ctrl+Shift+E` | Divide el panel lado a lado (el nuevo, a la derecha) |
| `Ctrl+Shift+O` | Divide el panel arriba/abajo (el nuevo, debajo). Es la letra O, no el cero |

Son los mismos que en WezTerm y se definen por tecla física, así que funcionan igual con cualquier distribución de
teclado. Los atajos nativos de iTerm2 siguen disponibles: `Cmd+D` (lado a lado) y `Cmd+Shift+D` (arriba/abajo).

iTerm2 llama "vertical" a la división con una línea vertical (paneles lado a lado); WezTerm lo llama `SplitHorizontal`.
Por eso `Ctrl+Shift+E` usa la acción 29 ("Split Vertically") y `Ctrl+Shift+O` la 28 ("Split Horizontally").

## Directorio heredado

iTerm2 lee el directorio actual del proceso del shell, sin necesidad de *shell integration*. Basta para sesiones
locales. Dentro de SSH o tmux, iTerm2 no ve el directorio remoto y abre en `~`; para eso haría falta que el shell lo
anuncie con OSC 7, que este repositorio no configura.

## Cómo seguir configurándolo

- Edita `dotfiles.json`; iTerm2 recarga los perfiles dinámicos al guardar. Los cambios hechos desde Settings a un perfil
  dinámico **no** se guardan en el archivo: se pierden al recargarlo.
- Para ver la clave JSON de un ajuste, cámbialo en un perfil normal y usa Other Actions… → Save Profile as JSON.
- Un atajo nuevo es otra entrada de `Keyboard Map`. La clave es `0x<carácter>-0x<modificadores>-0x<código de tecla>`
  (Ctrl es `0x40000`, Shift `0x20000`, Option `0x80000`, Cmd `0x100000`) y el valor lleva `Action` y `Text`.
- Un cambio de tema o de fuente debe repetirse en [WezTerm](wezterm.md), [Rio](rio.md) y [bat](bat.md).

## Documentación oficial

- [Perfiles dinámicos](https://iterm2.com/documentation-dynamic-profiles.html): formato, campos obligatorios y herencia.
- [Preferencias de perfil](https://iterm2.com/documentation-preferences-profiles.html): qué hace cada ajuste.
- [Tema Dracula para iTerm2](https://draculatheme.com/iterm).
