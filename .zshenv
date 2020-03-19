
# Skip the not really helping Ubuntu global compinit
skip_global_compinit=1

export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share

ZDOTDIR=$XDG_CONFIG_HOME/zsh

export GIT_TERMINAL_PROMPT=1

export HOMEBREW_GITHUB_API_TOKEN="2a77c75414e3948db1cf954eb06d7b856f9d7c86"

export HOMEBREW_FORCE_BREWED_GIT="1"

export HOMEBREW_FORCE_BREWED_CURL=1

export GNUPGHOME="${XDG_CONFIG_HOME:-${HOME}/.config}/.gnupg"
export GPG_TTY=$(tty)

# export IPYTHONDIR=$XDG_CONFIG_HOME/ipython
# export JUPYTER_CONFIG_DIR=$XDG_CONFIG_HOME/jupyter
# export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/config
