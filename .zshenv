# Language
# export LANGUAGE=C.UTF-8
export LANGUAGE=en_US.UTF-8
# export LANG=C.UTF-8
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
# export LC_ALL=C
# export LC_ALL=C.UTF-8
export LC_ALL=en_US.UTF-8

# XDG
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_CACHE_HOME="${HOME}/.cache"
export XDG_DATA_HOME="${HOME}/.local/share"
# export XDG_RUNTIME_DIR=

# Zsh
export ZDOTDIR="${XDG_CONFIG_HOME}/zsh"

source "${ZDOTDIR:-${XDG_CONFIG_HOME:-${HOME}/.config}/zsh}/.zshenv"
