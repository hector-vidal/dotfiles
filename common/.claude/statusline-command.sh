#!/bin/bash
# Refleja ~/.config/starship.toml (usuario, host, directorio, rama de Git)
# más los datos de sesión que Starship no puede conocer (modelo, % de contexto,
# límites de uso).
input=$(cat)

cwd=$(echo "$input" | jq -r '.workspace.current_dir // .cwd // empty')
cwd=${cwd:-$PWD}
model=$(echo "$input" | jq -r '.model.display_name // empty')
effort=$(echo "$input" | jq -r '.effort.level // empty')
used_pct=$(echo "$input" | jq -r '.context_window.used_percentage // empty')
five=$(echo "$input" | jq -r '.rate_limits.five_hour.used_percentage // empty')
week=$(echo "$input" | jq -r '.rate_limits.seven_day.used_percentage // empty')

RESET=$'\033[0m'
DIM=$'\033[2m'

# [username] style_user = '#a6aaf1 bold', style_root = 'white bold'
user=$(whoami)
if [ "$(id -u)" = "0" ]; then
  user_color=$'\033[1;37m'
else
  user_color=$'\033[1m\033[38;2;166;170;241m'
fi

# [hostname] format = '[@](white bold)[$hostname](#50fa7b bold)'
host=$(hostname -s)
host_at_color=$'\033[1;37m'
host_color=$'\033[1m\033[38;2;80;250;123m'

# [directory] style = "yellow", truncate_to_repo = false, truncation_length = 3,
# truncation_symbol = " …/" (el home_symbol '~' por defecto sigue aplicando)
dir_color=$'\033[0;33m'
path="$cwd"
[ "$path" = "$HOME" ] && path="~"
case "$path" in
  "$HOME"/*) path="~${path#$HOME}" ;;
esac
IFS='/' read -ra parts <<< "$path"
clean=()
for p in "${parts[@]}"; do
  [ -n "$p" ] && clean+=("$p")
done
n=${#clean[@]}
if [ "$n" -gt 3 ]; then
  last3=("${clean[@]: -3}")
  dir_display=" …/$(IFS=/; echo "${last3[*]}")"
elif [[ "$path" == /* ]]; then
  dir_display="/$(IFS=/; echo "${clean[*]}")"
else
  dir_display="$path"
fi

# [git_branch] format = "[$symbol$branch]($style) " — en rosa, por preferencia.
branch_color=$'\033[1m\033[38;2;255;121;198m'
git_segment=""
if git -C "$cwd" --no-optional-locks rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  branch=$(git -C "$cwd" --no-optional-locks branch --show-current 2>/dev/null)
  [ -n "$branch" ] && git_segment="${branch_color}  ${branch} ${RESET}"
fi
# [character]: se omiten las flechas de éxito/error porque el payload de stdin
# no trae el código de salida del último comando.

line="${user_color}${user}${RESET}${host_at_color}@${RESET}${host_color}${host}${RESET} ${dir_color}${dir_display} ${RESET}${git_segment}"

# Datos de sesión (no derivables de Starship): modelo, uso de contexto y límites.
extras=""
[ -n "$model" ] && extras="${extras}${DIM}[${model}]${RESET} "
[ -n "$effort" ] && extras="${extras}${DIM}(${effort})${RESET} "
# La barra muestra usado frente a libre: celdas usadas fuertes, libres tenues,
# con el mismo tono. El tono cambia con el uso: verde <60%, amarillo 60-79%,
# rojo >=80%.
if [ -n "$used_pct" ]; then
  used_round=$(printf '%.0f' "$used_pct")
  filled=$(((used_round + 5) / 10))
  [ "$filled" -gt 10 ] && filled=10
  [ "$filled" -lt 0 ] && filled=0
  if [ "$used_round" -ge 80 ]; then
    bar_used_color=$'\033[0;31m'; bar_free_color=$'\033[2;31m'
  elif [ "$used_round" -ge 60 ]; then
    bar_used_color=$'\033[0;33m'; bar_free_color=$'\033[2;33m'
  else
    bar_used_color=$'\033[0;32m'; bar_free_color=$'\033[2;32m'
  fi
  bar=""
  for ((i = 0; i < 10; i++)); do
    if [ "$i" -lt "$filled" ]; then
      bar="${bar}${bar_used_color}█"
    else
      bar="${bar}${bar_free_color}░"
    fi
  done
  extras="${extras}${DIM}ctx:${used_round}%${RESET} ${bar}${RESET} "
fi
rl=""
[ -n "$five" ] && rl="5h:$(printf '%.0f' "$five")%"
if [ -n "$week" ]; then
  [ -n "$rl" ] && rl="$rl "
  rl="${rl}7d:$(printf '%.0f' "$week")%"
fi
[ -n "$rl" ] && extras="${extras}${DIM}${rl}${RESET} "

# Distintivos de los plugins: cada plugin trae su propio script de statusline,
# que lee su archivo de estado (~/.claude/.ponytail-active,
# ~/.claude/.caveman-active) y dibuja "[NOMBRE]" o "[NOMBRE:MODO]" (vacío si el
# plugin está apagado o no instalado). Se reutilizan tal cual en lugar de
# reimplementar aquí la lectura de esos archivos.
badges=""
ponytail_badge="$HOME/.claude/plugins/marketplaces/ponytail/hooks/ponytail-statusline.sh"
caveman_badge="$HOME/.claude/plugins/marketplaces/caveman/src/hooks/caveman-statusline.sh"
[ -f "$ponytail_badge" ] && out=$(bash "$ponytail_badge") && [ -n "$out" ] && badges="${badges}${out} "
[ -f "$caveman_badge" ] && out=$(bash "$caveman_badge") && [ -n "$out" ] && badges="${badges}${out} "

printf '%s%s%s\n' "$line" "$extras" "$badges"
