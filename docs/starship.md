# Starship

[Starship](https://starship.rs/) es un prompt rápido y configurable que funciona con cualquier shell. Aquí lo inicia
`~/.zshrc`.

## Instalación

Elemento de akmon: `starship`.

| Archivo del repositorio | Destino |
|---|---|
| `common/.config/starship.toml` | `~/.config/starship.toml` |

Necesita el binario (`brew install starship` o el instalador de su web) y una Nerd Font en la terminal para el icono de
la rama.

## Qué configura este repositorio

Así se ve el prompt:

```text
usuario@macbook …/dotfiles/common/.config  main
➜
```

| Módulo | Configuración | Resultado |
|---|---|---|
| `add_newline` | `true` | Línea en blanco entre un prompt y el siguiente |
| `username` | `show_always = true`, lavanda `#a6aaf1` en negrita (blanco si es `root`) | El usuario se ve siempre, no solo por SSH |
| `hostname` | `ssh_only = false`, `@` blanco y nombre verde `#50fa7b` | El host se ve siempre |
| `directory` | Amarillo, `truncation_length = 3`, `truncate_to_repo = false`, `truncation_symbol = " …/"` | Muestra los tres últimos niveles de la ruta |
| `git_branch` | Símbolo `U+F418`, el icono de rama de Nerd Font (no se ve en el ejemplo de arriba sin esa fuente) | Rama actual |
| `character` | `➜` verde si el último comando terminó bien, rojo si falló | |
| `package` | `disabled = true` | Oculta la versión del paquete del proyecto |

El [statusline de Claude Code](claude-code.md#statusline) replica estos mismos colores. Si cambias uno aquí, cámbialo
también en `common/.claude/statusline-command.sh`.

## Cómo seguir configurándolo

- Edita `common/.config/starship.toml`. Los cambios se aplican en el siguiente prompt, sin reiniciar.
- La línea `"$schema"` permite que los editores autocompleten y validen las opciones.
- Para probar un módulo sin tocar el archivo: `starship explain` (explica cada segmento del prompt actual).

## Documentación oficial

- [Configuración](https://starship.rs/config/): todos los módulos y sus opciones.
- [Presets](https://starship.rs/presets/): configuraciones completas listas para usar.
