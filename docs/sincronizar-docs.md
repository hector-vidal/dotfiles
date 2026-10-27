# Sincronizar docs

`sincronizar-docs.sh` copia la carpeta `docs/` de cada repositorio a su ficha en un vault de
[Obsidian](https://obsidian.md/), para consultar la documentación de todos los proyectos desde un mismo sitio. Es un
script propio de este repositorio, no una herramienta externa.

## Instalación

Elemento de akmon: `sincronizar-docs`.

| Archivo del repositorio | Destino |
|---|---|
| `common/.local/bin/sincronizar-docs.sh` | `~/.local/bin/sincronizar-docs.sh` |

`~/.local/bin` debe estar en el `PATH`. Necesita `rsync`, que viene con macOS y la mayoría de distribuciones Linux.

## Cómo funciona

| Elemento | Valor |
|---|---|
| Carpeta de repositorios | `$GITHUB_DIR` o, si no está definida, `~/Github` |
| Origen | `<repositorios>/<repositorio>/docs/` |
| Destino | `<repositorios>/docs/Proyectos-docs/<repositorio>/docs/` |
| Modo | `rsync -a --delete-after`: el destino queda idéntico al origen (lo borrado en origen se borra en destino) y se excluye `.DS_Store` |

- **Solo sincroniza repositorios con ficha**: si no existe la carpeta `Proyectos-docs/<repositorio>`, no hace nada. La
  ficha la crea una persona, nunca el script.
- **La copia es de solo lectura**: lo que edites en el vault se pierde en la siguiente sincronización. Edita siempre en el
  repositorio.

## Uso

```bash
sincronizar-docs.sh             # todas las fichas
sincronizar-docs.sh tinyRAG     # solo un repositorio
```

Para que se ejecute sola en cada commit, añade al gancho `.git/hooks/post-commit` de cada repositorio:

```sh
#!/bin/sh
sincronizar-docs.sh "$(basename "$(git rev-parse --show-toplevel)")"
```

## Documentación oficial

- [`rsync`](https://download.samba.org/pub/rsync/rsync.1): opciones de copia y borrado.
- [Ganchos de Git](https://git-scm.com/docs/githooks#_post_commit).
