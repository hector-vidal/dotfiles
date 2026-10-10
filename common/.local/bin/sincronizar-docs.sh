#!/bin/sh
# Copia de solo lectura de docs/ de cada repositorio a su ficha en el vault de Obsidian.
# Sin argumento sincroniza todas las fichas; con argumento, solo ese repositorio.
# La invoca el gancho post-commit de cada repositorio. Ver «Arranque de Proyecto Nuevo» en el vault.
set -eu
github="${GITHUB_DIR:-$HOME/Github}"
fichas="$github/docs/Proyectos-docs"

sincronizar() {
  origen="$github/$1/docs"
  # Sin ficha no se crea nada: la ficha la escribe una persona, no este script.
  [ -d "$origen" ] && [ -d "$fichas/$1" ] || return 0
  rsync -a --delete-after --exclude=.DS_Store "$origen/" "$fichas/$1/docs/"
}

if [ $# -gt 0 ]; then
  sincronizar "$1"
else
  for ficha in "$fichas"/*/; do sincronizar "$(basename "$ficha")"; done
fi
