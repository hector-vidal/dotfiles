# Configuración de zsh versionada en el repositorio dotfiles.
#
# No se instala como ~/.zshrc: los instaladores (pnpm, fnm, Atuin, pyenv) escriben
# en ~/.zshrc rutas propias del equipo, y ese archivo no debe acabar en un
# repositorio público. ~/.zshrc es un cargador local (plantilla en common/.zshrc)
# que carga este archivo y debajo guarda lo propio de cada equipo.

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-syntax-highlighting zsh-autosuggestions command-not-found)

# fzf-tab sustituye el menú de autocompletado por fzf. Tiene que cargarse antes
# que los plugins que envuelven widgets (zsh-syntax-highlighting y
# zsh-autosuggestions), así que va justo detrás de git. Solo se activa si fzf
# está instalado y el plugin está clonado en $ZSH/custom/plugins/fzf-tab.
if (( $+commands[fzf] )) && [[ -d "${ZSH_CUSTOM:-$ZSH/custom}/plugins/fzf-tab" ]]; then
  plugins=(git fzf-tab zsh-syntax-highlighting zsh-autosuggestions command-not-found)
fi

source $ZSH/oh-my-zsh.sh

# fzf-tab: grupos, colores y vista previa de directorios con lsd al completar `cd`.
# La vista previa va entre comillas simples para que $realpath no se expanda aquí.
zstyle ':completion:*:git-checkout:*' sort false
zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'lsd -1 --color=always $realpath'
zstyle ':fzf-tab:*' switch-group '<' '>'

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


# Starship
(( $+commands[starship] )) && eval "$(starship init zsh)"

# Reemplazos de comandos clásicos, solo si la herramienta está instalada
(( $+commands[lsd] )) && alias ls="lsd"
(( $+commands[tldr] )) && alias man="tldr"
(( $+commands[broot] )) && alias tree="broot"
(( $+commands[nvim] )) && alias vim="nvim"

# npm y npx bloqueados: el gestor de paquetes es pnpm, para personas y agentes de IA.
# No se traducen en silencio porque pnpm no acepta todos los subcomandos y opciones de npm.
# Para un caso excepcional queda `command npm` / `command npx`.
npm() {
  print -u2 "npm está bloqueado: usa pnpm. npm install → pnpm install o pnpm add <paquete>; npm ci → pnpm install --frozen-lockfile; npm install -g → pnpm add -g <paquete>; npm run → pnpm run."
  return 1
}
npx() {
  print -u2 "npx está bloqueado: usa pnpm dlx <paquete>, o pnpm exec <binario> si ya está instalado en el proyecto."
  return 1
}

# `bat` se instala como `batcat` en Debian/Ubuntu y como `bat` en el resto
if (( $+commands[batcat] )); then
  alias cat="batcat"
elif (( $+commands[bat] )); then
  alias cat="bat"
fi

# Acceso al directorio de trabajo en Windows (solo WSL).
# Si tu usuario de Windows difiere del de Linux, define WIN_USER en ~/.zshrc.local
if [ -d /mnt/c/Users ]; then
  alias windows11='cd "/mnt/c/Users/${WIN_USER:-$USER}/Gitkraken"'
fi

# fzf: buscador difuso. Lista los archivos con fd, previsualiza con bat y usa los
# colores Dracula. Ctrl-R se queda en Atuin: la variable vacía en la misma línea
# del `source` desactiva el atajo de historial de fzf (puesta después no surte efecto).
# Alt-C no llega con el WezTerm de este repositorio (Option compone caracteres):
# se lanza con Esc seguido de c.
if (( $+commands[fzf] )); then
  if (( $+commands[fd] )); then
    export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git --strip-cwd-prefix'
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
    export FZF_ALT_C_COMMAND='fd --type d --hidden --follow --exclude .git --strip-cwd-prefix'
    _fzf_compgen_path() { fd --hidden --follow --exclude .git . "$1"; }
    _fzf_compgen_dir() { fd --type d --hidden --follow --exclude .git . "$1"; }
  fi
  export FZF_CTRL_T_OPTS="
    --preview 'bat -n --color=always {}'
    --bind 'ctrl-/:change-preview-window(down|hidden|)'"
  export FZF_ALT_C_OPTS="--preview 'lsd --tree --depth 2 --color=always {}'"
  export FZF_DEFAULT_OPTS='
    --color=dark
    --color=fg:-1,bg:-1,hl:#5fff87,fg+:-1,bg+:-1,hl+:#ffaf5f
    --color=info:#af87ff,prompt:#5fff87,pointer:#ff87d7,marker:#ff87d7,spinner:#ff87d7'
  FZF_CTRL_R_COMMAND= source <(fzf --zsh)
fi

# ripgrep: lee sus opciones de ~/.ripgreprc (ripgrep no busca ese archivo solo)
(( $+commands[rg] )) && export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"

# Configuración local y secretos (NO versionado).
# Aquí van las API keys, tokens y cualquier `export` con datos sensibles.
# Mantenerlos fuera de este archivo evita publicarlos al hacer push.
[ -f "$HOME/.zshrc.local" ] && source "$HOME/.zshrc.local"
