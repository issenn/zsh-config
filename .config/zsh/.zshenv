# Skip the not really helping Ubuntu global compinit
skip_global_compinit=1


# Default Java Home.
[[ -z "$JAVA_VERSION" ]] && JAVA_VERSION=1.8
[[ -s /usr/libexec/java_home ]] && export JAVA_HOME=$(/usr/libexec/java_home -v $JAVA_VERSION)

export CURL_HOME="${XDG_CONFIG_HOME:-${HOME}/.config}/curl"

# 10ms for key sequences
export KEYTIMEOUT=1

# Set vimrc's location and source it on vim startup
export VIMINIT=":source ${XDG_CONFIG_HOME:-${HOME}/.config}/vim/vimrc"

export LESSKEY="${XDG_CACHE_HOME:-${HOME}/.cache}/less/lesskey"
export LESSHISTFILE="${XDG_CACHE_HOME:-${HOME}/.cache}/less/history"

# subversion
export SUBVERSION_HOME="${XDG_CONFIG_HOME:-${HOME}/.config}/subversion"

export GIT_TERMINAL_PROMPT=1

# export HOMEBREW_GITHUB_API_TOKEN=""
source "${ZDOTDIR:-${XDG_CONFIG_HOME:-${HOME}/.config}/zsh}/.zsh.secret"
export HOMEBREW_FORCE_BREWED_GIT="1"
export HOMEBREW_FORCE_BREWED_CURL=1
export HOMEBREW_CURLRC=1

export GNUPGHOME="${XDG_CONFIG_HOME:-${HOME}/.config}/gnupg"

export DOCKER_CONFIG="${XDG_CONFIG_HOME:-${HOME}/.config}/docker"

export MACHINE_STORAGE_PATH="${XDG_DATA_HOME:-${HOME}/.local/share}/docker/machine"

# export PYENV_VIRTUALENVWRAPPER_PREFER_PYVENV="true"

export PYTHON_BUILD_ARIA2_OPTS="-x 10 -k 1M"
export PYENV_ROOT="${XDG_CONFIG_HOME:-${HOME}/.config}/pyenv"
# PYLINTHOME
# PYLINTRC

export RBENV_ROOT="${XDG_CONFIG_HOME:-${HOME}/.config}/rbenv"

# export IPYTHONDIR=$XDG_CONFIG_HOME/ipython
# export JUPYTER_CONFIG_DIR=$XDG_CONFIG_HOME/jupyter
# export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/config

export MYSQL_HISTFILE="${XDG_CONFIG_HOME:-${HOME}/.config}/mysql/mysql_history"
