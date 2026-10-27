# Rio

[Rio](https://rioterm.com/) es un emulador de terminal acelerado por GPU, escrito en Rust. En este repositorio es la
alternativa a [WezTerm](wezterm.md), con el mismo tema y la misma fuente.

## Instalación

Elemento de akmon: `rio`.

| Archivo del repositorio | Destino |
|---|---|
| `common/.config/rio/config.toml` | `~/.config/rio/config.toml` |
| `common/.config/rio/themes/dracula.toml` | `~/.config/rio/themes/dracula.toml` |

## Qué configura este repositorio

| Opción | Valor | Para qué |
|---|---|---|
| `theme` | `dracula` | Tema común; lo lee de `themes/dracula.toml` |
| `[fonts]` | `JetBrainsMono Nerd Font Mono`, 13 | Fuente común a todas las herramientas |
| `[window] opacity` | `0.55` | Transparencia de la ventana |
| `[cursor]` | Bloque que parpadea cada 700 ms | |
| `[navigation]` | Pestañas, ocultas si solo hay una | |
| `[renderer]` | `performance = "high"`, 120 fps | |
| `[bell]` | Visual y sonora | |
| `confirm-before-quit` | `true` | Pide confirmación al cerrar |
| `[hints]` | URLs detectadas en pantalla | Se abren con `Ctrl` + clic o con `Ctrl+Shift+O` |

No hay bloque `[shell]` en la raíz: Rio usa el shell de inicio de sesión del usuario.

## Diferencias por sistema operativo

Se declaran en el bloque `[platform]`, que solo aplica en el sistema indicado:

- **Windows**: abre `zsh` dentro de la distribución `Debian` de WSL.
- **macOS**: pestañas nativas del sistema y renderizado con Metal.

`working-dir` está comentado porque TOML no expande `$HOME` y escribir la ruta a mano la ataría a un usuario.

## Cómo seguir configurándolo

- `config.toml` conserva la plantilla oficial de Rio como comentarios: cada opción viene documentada en el propio
  archivo. Para activarla, descoméntala; no borres esos bloques.
- Rio recarga la configuración al guardar.
- Un cambio de tema o de fuente debe repetirse en [WezTerm](wezterm.md) y en [bat](bat.md).

## Documentación oficial

- [Configuración](https://rioterm.com/docs/config): todas las secciones del `config.toml`.
- [Colores](https://rioterm.com/docs/default-colors): las claves que define un archivo de tema.
- [Hints](https://rioterm.com/docs/features/hints) y [atajos de teclado](https://rioterm.com/docs/key-bindings).
