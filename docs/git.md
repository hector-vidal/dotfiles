# Git

[Git](https://git-scm.com/) es el sistema de control de versiones. Este repositorio aporta dos alias para leer el
historial como un grafo.

## Instalación

Elemento de akmon: `git`.

| Archivo del repositorio | Destino |
|---|---|
| `common/.gitconfig` | `~/.gitconfig` |

Si ya tienes un `~/.gitconfig` con tu nombre y correo, no lo sustituyas: copia solo el bloque `[alias]`, o deja el tuyo e
incluye este con `git config --global include.path /ruta/al/repo/common/.gitconfig`.

## Atajos

### `git gls`: historial compacto

Una línea por commit: fecha relativa, autor, hash, ramas y mensaje.

```text
* 52 minutes ago - Héctor Eduardo Vidal  0f9c912 - (HEAD -> main, origin/main) feat(claude): agrega archivo claude a nivel global
* 2 weeks ago - Héctor Eduardo Vidal  70f616c - chore(zshrc) quita la configuración de instalación para node con fnm
* 7 weeks ago - Héctor Eduardo Vidal  015e0cf - Add: Claude Code - statusline con datos de sesión
```

### `git gll`: historial detallado

Todas las ramas (`--all`), con fecha absoluta, correo del autor y cuerpo del mensaje.

```text
* 2026-10-27 11:14:52 Héctor Eduardo Vidal 0f9c912 (HEAD -> main, origin/main)
| 52 minutes ago      correo@ejemplo.com   Commit: feat(claude): agrega archivo claude a nivel global
|
* 2026-10-10 14:59:23 Héctor Eduardo Vidal 70f616c
| 2 weeks ago         correo@ejemplo.com   Commit: chore(zshrc) quita la configuración de instalación para node con fnm
| las variables las agrega de todas maneras node aun cuando ya existen en el archivo
```

En la terminal ambos salen con colores. Aceptan las opciones de `git log`: `git gls -10`, `git gll -- archivo`.

## Cómo seguir configurándolo

- Dentro de `[alias]`, Git ya antepone `git`: el valor empieza por `log ...`, **no** por `git log ...` (eso ejecutaría
  `git git log`).
- Para cambiar qué muestra cada línea, edita los marcadores de `--pretty=format:` (`%h` hash, `%an` autor, `%ar` fecha
  relativa, `%d` ramas, `%s` asunto, `%b` cuerpo).

## Documentación oficial

- [Alias en `git config`](https://git-scm.com/docs/git-config#Documentation/git-config.txt-alias).
- [Formatos de `--pretty`](https://git-scm.com/docs/pretty-formats).
- [`git log`](https://git-scm.com/docs/git-log).
