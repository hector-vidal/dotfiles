# bat

[bat](https://github.com/sharkdp/bat) es un `cat` con resaltado de sintaxis, números de línea e integración con Git. En
este repositorio sustituye a `cat` mediante un alias de [Zsh](zsh.md).

## Instalación

Elemento de akmon: `bat`.

| Archivo del repositorio | Destino |
|---|---|
| `common/.config/bat/config` | `~/.config/bat/config` |
| `common/.config/bat/themes/Dracula.tmTheme` | `~/.config/bat/themes/Dracula.tmTheme` |

Después de instalar o cambiar un tema, **reconstruye la caché**; si no, bat sigue usando la versión anterior:

```bash
bat cache --build
bat --list-themes | grep Dracula   # comprobación
```

## Qué configura este repositorio

| Opción | Valor | Para qué |
|---|---|---|
| `--theme` | `Dracula` | Tema común a todas las herramientas |
| `--style` | `numbers,changes,header` | Números de línea, marcas de cambios de Git y cabecera con el nombre del archivo |
| `--italic-text` | `always` | Cursivas del tema (comentarios, por ejemplo) |

El `Dracula.tmTheme` del repositorio **no es idéntico al original**: lleva un `gutterForeground` añadido para que los
números de línea se lean bien. El porqué está en [bat-dracula-line-numbers.md](bat-dracula-line-numbers.md). No lo
sustituyas por la versión de upstream.

## Cómo seguir configurándolo

- `config` conserva la plantilla oficial de bat como comentarios: para activar una opción, descoméntala.
- Para probar una opción sin tocar el archivo, pásala en la línea de comandos: `bat --style=full archivo`.
- En Debian/Ubuntu el binario se llama `batcat`; la configuración es la misma.

## Documentación oficial

- [Personalización](https://github.com/sharkdp/bat#customization): temas, estilos y archivo de configuración.
- [Añadir temas nuevos](https://github.com/sharkdp/bat#adding-new-themes).
