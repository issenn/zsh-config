# Language
# export LANGUAGE=C.UTF-8
export LANGUAGE=en_US.UTF-8
# export LANG=C.UTF-8
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
# export LC_ALL=C
# export LC_ALL=C.UTF-8
export LC_ALL=en_US.UTF-8

# XDG Base Directory specification
# https://wiki.archlinux.org/index.php/XDG_Base_Directory
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_CACHE_HOME="${HOME}/.cache"
export XDG_DATA_HOME="${HOME}/.local/share"
export XDG_RUNTIME_DIR="${HOME}/.run"
[[ "${UID}" -ge 500 && -n "${XDG_CONFIG_HOME}" && ! -d "${XDG_CONFIG_HOME}" ]] && mkdir -p "${XDG_CONFIG_HOME}"
[[ "${UID}" -ge 500 && -n "${XDG_CACHE_HOME}" && ! -d "${XDG_CACHE_HOME}" ]] && mkdir -p "${XDG_CACHE_HOME}"
[[ "${UID}" -ge 500 && -n "${XDG_DATA_HOME}" && ! -d "${XDG_DATA_HOME}" ]] && mkdir -p "${XDG_DATA_HOME}"
[[ "${UID}" -ge 500 && -n "${XDG_RUNTIME_DIR}" && ! -d "${XDG_RUNTIME_DIR}" ]] && mkdir -p "${XDG_RUNTIME_DIR}"

# Zsh
export ZDOTDIR="${XDG_CONFIG_HOME}/zsh"
[[ "${UID}" -ge 500 && -n "${ZDOTDIR}" && ! -d "${ZDOTDIR}" ]] && mkdir -p "${ZDOTDIR}"

[[ "${UID}" -ge 500 && -f "${ZDOTDIR:-${XDG_CONFIG_HOME:-${HOME}/.config}/zsh}/.zshenv" ]] && source "${ZDOTDIR:-${XDG_CONFIG_HOME:-${HOME}/.config}/zsh}/.zshenv"

export DOTFILES_DIR=${0:a:h}/dotfiles
