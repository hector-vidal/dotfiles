# Cargador de zsh: este archivo es LOCAL de cada equipo y no se enlaza al repositorio.
#
# La configuración versionada vive en ~/.config/zsh/config.zsh (common/.config/zsh/config.zsh
# en el repositorio dotfiles). Aquí solo se carga, y debajo queda lo propio del equipo:
# lo que añaden los instaladores (pnpm, fnm, Atuin, pyenv...) con sus rutas, y los alias
# que solo tienen sentido en esta máquina. Por eso ~/.zshrc no debe ser un enlace: los
# instaladores escribirían en el repositorio público.
#
# Los secretos no van aquí sino en ~/.zshrc.local (plantilla: common/.zshrc.local.example),
# que config.zsh carga al final.

[ -f "$HOME/.config/zsh/config.zsh" ] && source "$HOME/.config/zsh/config.zsh"

# Lo propio de este equipo, debajo de esta línea.
