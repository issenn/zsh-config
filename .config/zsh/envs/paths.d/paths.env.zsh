
# Start: Zsh ENV PATH

# https://wiki.archlinux.org/index.php/Environment_variables#Globally
# If user ID is greater than or equal to 1000 & if ~/bin exists and is a directory & if ~/bin is not already in your $PATH
# then export ~/bin to your $PATH.
# if [[ $UID -ge 1000 && -d $HOME/bin && -z $(echo $PATH | grep -o $HOME/bin) ]]
# then
#     export PATH="${PATH}:$HOME/bin"
# fi

# zsh
export MANPATH="/usr/local/opt/zsh/share/man${MANPATH:+:${MANPATH}}"

export PATH="/usr/local/opt/grep/libexec/gnubin${PATH:+:${PATH}}"
export MANPATH="/usr/local/opt/grep/libexec/gnuman${MANPATH:+:${MANPATH}}"

if [[ "${UID}" -ge 500 && -d "/usr/local/opt/openssl@1.1/bin" && -z "$(echo ${PATH} | grep -o /usr/local/opt/openssl@1.1/bin)" ]]
then
  export PATH="/usr/local/opt/openssl@1.1/bin${PATH:+:${PATH}}"
fi

if [[ "${UID}" -ge 500 && -d "/usr/local/opt/curl/bin" && -z "$(echo ${PATH} | grep -o /usr/local/opt/curl/bin)" ]]
then
  export PATH="/usr/local/opt/curl/bin${PATH:+:${PATH}}"
  # export PATH="/usr/local/opt/curl-openssl/bin${PATH:+:${PATH}}"
  # export PATH="/usr/local/opt/curl-max/bin${PATH:+:${PATH}}"
fi

export PATH="/usr/local/opt/gnu-which/libexec/gnubin${PATH:+:${PATH}}"
export MANPATH="/usr/local/opt/gnu-which/libexec/gnuman${MANPATH:+:${MANPATH}}"

export PATH="/usr/local/opt/make/libexec/gnubin${PATH:+:${PATH}}"
export MANPATH="/usr/local/opt/make/libexec/gnuman${MANPATH:+:${MANPATH}}"

export PATH="/usr/local/opt/gnu-tar/libexec/gnubin${PATH:+:${PATH}}"
export MANPATH="/usr/local/opt/gnu-tar/libexec/gnuman${MANPATH:+:${MANPATH}}"

export PATH="/usr/local/opt/zip/bin${PATH:+:${PATH}}"
export PATH="/usr/local/opt/unzip/bin${PATH:+:${PATH}}"

# export PATH="/usr/local/opt/sqlite/bin:$PATH"

# export PATH="/usr/local/opt/m4/bin:$PATH"

# export PATH="/usr/local/opt/e2fsprogs/bin:$PATH"
# export PATH="/usr/local/opt/e2fsprogs/sbin:$PATH"

export PATH="${XDG_DATA_HOME:-${HOME}/.local/share}/perl5/bin${PATH:+:${PATH}}";

export PATH="/usr/local/opt/ruby/bin${PATH:+:${PATH}}"

export PATH="/usr/local/opt/node/bin${PATH:+:${PATH}}"

# export PATH="${GOROOT:+${GOROOT}/bin}${GOPATH:+:${GOPATH}/bin}${PATH:+:${PATH}}"
export PATH="${GOPATH:+:${GOPATH}/bin}${PATH:+:${PATH}}"

export PATH="$(yarn global bin)${PATH:+:${PATH}}"

# End: Zsh ENV PATH
