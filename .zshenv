
# export LANG=C.UTF-8
export LANG=en_US.UTF-8
# export LC_ALL=C
# export LC_ALL=C.UTF-8
export LC_ALL=en_US.UTF-8
# export LANGUAGE=C.UTF-8
export LANGUAGE=en_US.UTF-8

# Skip the not really helping Ubuntu global compinit
skip_global_compinit=1

export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share

ZDOTDIR=$XDG_CONFIG_HOME/zsh

export GIT_TERMINAL_PROMPT=1

# export HOMEBREW_GITHUB_API_TOKEN=""
source "${ZDOTDIR:-${XDG_CONFIG_HOME:-${HOME}/.config}/zsh}/.zsh.secret"
export HOMEBREW_FORCE_BREWED_GIT="1"
export HOMEBREW_FORCE_BREWED_CURL=1
export HOMEBREW_CURLRC=1

export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"

# export PATH="/usr/local/opt/curl/bin:$PATH"
# export PATH="/usr/local/opt/curl-openssl/bin:$PATH"
# export PATH="/usr/local/opt/curl-max/bin:$PATH"

export GNUPGHOME="${XDG_CONFIG_HOME:-${HOME}/.config}/.gnupg"
export GPG_TTY=$(tty)

export PATH="/usr/local/opt/grep/libexec/gnubin:$PATH"

# export PATH="/usr/local/opt/gnu-which/libexec/gnubin:$PATH"

# export MANPATH="/usr/local/opt/make/libexec/gnuman:$MANPATH"

# export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"

# export PATH="/usr/local/opt/sqlite/bin:$PATH"

# export PATH="/usr/local/opt/m4/bin:$PATH"

# export PATH="/usr/local/opt/e2fsprogs/bin:$PATH"
# export PATH="/usr/local/opt/e2fsprogs/sbin:$PATH"

# export PYENV_VIRTUALENVWRAPPER_PREFER_PYVENV="true"

export PYTHON_BUILD_ARIA2_OPTS="-x 10 -k 1M"
export PYENV_ROOT="${XDG_CONFIG_HOME}/.pyenv"

export PATH="/usr/local/opt/ruby/bin:${PATH}"

export RBENV_ROOT="${XDG_CONFIG_HOME}/.rbenv"

# export PATH="/usr/local/opt/node@10/bin:${PATH}"

# export IPYTHONDIR=$XDG_CONFIG_HOME/ipython
# export JUPYTER_CONFIG_DIR=$XDG_CONFIG_HOME/jupyter
# export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/config
