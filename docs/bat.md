# bat

[bat](https://github.com/sharkdp/bat) es un `cat` con resaltado de sintaxis, números de línea e integración con Git. En
este repositorio sustituye a `cat` mediante un alias de [Zsh](zsh.md).

## Instalación

Elemento de akmon: `bat`.

| Archivo del repositorio | Destino |
|---|---|
| `common/.config/bat/config` | `~/.config/bat/config` |
| `common/.config/bat/themes/Dracula.tmTheme` | `~/.config/bat/themes/Dracula.tmTheme` |
| `common/.config/bat/syntaxes/markdown-dotfiles.sublime-syntax` | `~/.config/bat/syntaxes/markdown-dotfiles.sublime-syntax` |

Después de instalar o cambiar un tema o una sintaxis, **reconstruye la caché**; si no, bat sigue usando la versión
anterior:

```bash
bat cache --build
bat --list-themes | grep Dracula   # comprobación del tema
```

La sintaxis Markdown propia no aparece en `bat --list-languages` (no declara extensiones; la asocia `--map-syntax`).
Para comprobarla, abre un `.md` con frontmatter: las claves del YAML salen en rosa.

## Qué configura este repositorio

| Opción | Valor | Para qué |
|---|---|---|
| `--theme` | `Dracula` | Tema común a todas las herramientas |
| `--style` | `numbers,changes,header` | Números de línea, marcas de cambios de Git y cabecera con el nombre del archivo |
| `--italic-text` | `always` | Cursivas del tema (comentarios, por ejemplo) |
| `--map-syntax` | `*.md:Markdown (dotfiles)` | Abre los `.md` con la sintaxis Markdown propia (ver más abajo) |

El `Dracula.tmTheme` del repositorio **no es idéntico al original**. Lleva dos añadidos, así que no lo sustituyas por la
versión de upstream:

- Un `gutterForeground` para que los números de línea se lean bien. El porqué está en
  [bat-dracula-line-numbers.md](bat-dracula-line-numbers.md).
- Los colores de Markdown de la especificación de Dracula, al final del archivo. El tema original no define ningún
  scope `markup.*` de Markdown y bat pintaba todo el `.md` del mismo color. Títulos en morado y negrita, negrita en
  naranja, cursiva y citas en amarillo con cursiva, código en verde, enlaces y marcadores de lista en cian, separadores
  en gris. Como delta usa el mismo tema (`syntax-theme = Dracula`), los diffs de `.md` también se colorean.

## Sintaxis Markdown propia

`markdown-dotfiles.sublime-syntax` envuelve el Markdown integrado de bat y le añade lo que deja sin color:

- El frontmatter YAML (`---` … `---`) de la primera línea del archivo.
- Los bloques de código `julia`, `yaml`, `toml`, `go`, `lua`, `swift`, `dockerfile` y `nginx`. Los demás lenguajes
  (python, bash, json…) ya los resuelve el Markdown integrado.

bat no admite `extends` en las sintaxis, así que el envoltorio añade sus reglas y delega todo lo demás con
`include: scope:text.html.markdown`. Límite conocido: un bloque de código dentro de una lista o una cita lo resuelve el
Markdown integrado, y esos lenguajes salen planos ahí. Para añadir un lenguaje, copia un contexto `fence-*` y cambia el
nombre y el `scope:source.*`; el scope de cada lenguaje sale de su `.sublime-syntax` en el repositorio de bat.

La sintaxis solo se aplica a lo que lee bat con su `config`: el alias `cat` y la vista previa de fzf. delta no lee ese
`config`, así que colorea los `.md` con el Markdown integrado (con los colores del tema, pero sin frontmatter ni los
lenguajes añadidos).

## Cómo seguir configurándolo

- `config` conserva la plantilla oficial de bat como comentarios: para activar una opción, descoméntala.
- Para probar una opción sin tocar el archivo, pásala en la línea de comandos: `bat --style=full archivo`.
- En Debian/Ubuntu el binario se llama `batcat`; la configuración es la misma.

## Documentación oficial

- [Personalización](https://github.com/sharkdp/bat#customization): temas, estilos y archivo de configuración.
- [Añadir temas nuevos](https://github.com/sharkdp/bat#adding-new-themes).
