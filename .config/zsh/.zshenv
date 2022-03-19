# Environment variables configuration
# Always read

# Skip the not really helping Ubuntu global compinit
skip_global_compinit=1


# Default Java Home.
[[ -z "${JAVA_VERSION}" ]] && JAVA_VERSION=1.8
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
source "${ZDOTDIR:-${XDG_CONFIG_HOME:-${HOME}/.config}/zsh}/.token.secret.zsh"
export HOMEBREW_FORCE_BREWED_GIT="1"
export HOMEBREW_FORCE_BREWED_CURL=1
export HOMEBREW_CURL_RETRIES=10
export HOMEBREW_CURLRC=1

# export HOMEBREW_DISPLAY_INSTALL_TIMES=1

# export HOMEBREW_NO_AUTO_UPDATE=1

export HOMEBREW_BUNDLE_FILE="${HOME}/dotfiles/Brewfile"

[[ "${UID}" -ge 500 && -d "${XDG_CONFIG_HOME:-${HOME}/.config}/gnupg" && -z "${GNUPGHOME}" ]] && export GNUPGHOME="${XDG_CONFIG_HOME:-${HOME}/.config}/gnupg"

# export SOPS_GPG_EXEC="gpg"
# export SOPS_PGP_FP=""
# export SOPS_KMS_ARN=""

[[ -z "${SOPS_AGE_KEY_FILE}" ]] && export SOPS_AGE_KEY_FILE="${XDG_CONFIG_HOME:-${HOME}/.config}/sops/keys.txt"
# export SOPS_AGE_RECIPIENTS=""

# export DOCKER_CONFIG="${XDG_CONFIG_HOME:-${HOME}/.config}/docker"

# export MACHINE_STORAGE_PATH="${XDG_DATA_HOME:-${HOME}/.local/share}/docker/machine"

export GOROOT="/usr/local/opt/go/libexec"

# export GOPATH="${HOME}/go"
[[ -z "${GOPATH}" ]] && export GOPATH="${XDG_DATA_HOME:-${HOME}/.local/share}/go"

# Enable the go modules feature
export GO111MODULE="on"

# Set the GOPROXY environment variable
# https://github.com/goproxy/goproxy.cn
# https://github.com/goproxyio/goproxy
export GOPROXY="https://goproxy.io,https://goproxy.cn,direct"

# Go Checksum Database
# A global Go checksum database, we follow google's privacy policy.
# export GOSUMDB=gosum.io+ce6e7565+AY5qEHUk/qmHc5btzW45JVoENfazw8LielDsaI+lEbq6

# For local::lib
# export PERL_MB_OPT="--install_base \"${XDG_DATA_HOME:-${HOME}/.local/share}/perl5\"";  # Only cpan
# export PERL_MM_OPT="INSTALL_BASE=${XDG_DATA_HOME:-${HOME}/.local/share}/perl5";  # Only cpan
export PERL5LIB="${XDG_DATA_HOME:-${HOME}/.local/share}/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}";
export PERL_LOCAL_LIB_ROOT="${XDG_DATA_HOME:-${HOME}/.local/share}/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}";

# Fetched files are unpacked in PERL_CPANM_HOME and automatically cleaned up periodically.
export PERL_CPANM_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/cpanm"
# export PERL_CPANM_OPT="--prompt --reinstall -l ${XDG_DATA_HOME:-${HOME}/.local/share}/perl5 --mirror http://cpan.cpantesters.org"

export PLENV_ROOT="${XDG_CONFIG_HOME:-${HOME}/.config}/plenv"

# export PYENV_VIRTUALENVWRAPPER_PREFER_PYVENV="true"

export PYTHON_BUILD_ARIA2_OPTS="-x 10 -k 1M"
export PYENV_ROOT="${XDG_CONFIG_HOME:-${HOME}/.config}/pyenv"
# PYLINTHOME
# PYLINTRC

# PYTHONUNBUFFERED=1

export RBENV_ROOT="${XDG_CONFIG_HOME:-${HOME}/.config}/rbenv"

# export IPYTHONDIR=$XDG_CONFIG_HOME/ipython
# export JUPYTER_CONFIG_DIR=$XDG_CONFIG_HOME/jupyter
# export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/config
# export GTAGSLABEL=pygments

export MYSQL_HISTFILE="${XDG_CONFIG_HOME:-${HOME}/.config}/mysql/mysql_history"

export WRANGLER_HOME="${XDG_CONFIG_HOME:-${HOME}/.config}/wrangler"
