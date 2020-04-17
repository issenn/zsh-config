# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
# export ZSH="/Users/issenn/.oh-my-zsh"
export ZSH="${HOME}/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="robbyrussell"
ZSH_THEME="agnoster"

DEFAULT_USER="issenn"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"
COMPLETION_WAITING_DOTS="true"

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
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  git-flow
  history
  node
  npm
  kubectl
)

# ZSH_COMPDUMP="${ZDOTDIR:-${HOME}}/.zcompdump-${SHORT_HOST}-${ZSH_VERSION}"
ZSH_COMPDUMP="${ZDOTDIR:-${HOME}}/.zsh/.zcompdump-$(whoami)-${ZSH_VERSION}"

source $ZSH/oh-my-zsh.sh


source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fpath=(/usr/local/share/zsh-completions $fpath)

[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh


# Completion

# autoload -Uz compinit && compinit -i
autoload -Uz compinit && compinit -d "${ZDOTDIR:-${HOME}}/.zsh/.zcompdump-$(whoami)-${ZSH_VERSION}"


# User configuration


# Cache for completion
# Completion caching
zstyle ':completion:*' accept-exact '*(N)'
# zstyle ':completion:*' use-cache on
zstyle ':completion::complete:*' use-cache on               # completion caching, use rehash to clear
# zstyle ':completion:*' cache-path ~/.zsh/cache
zstyle ':completion::complete:*' cache-path ~/.zsh/cache    # cache path

# Fallback to built in ls colors
# zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}       # colorz !

# zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'   # ignore case
# zstyle ':completion:*' menu select=2                        # menu if nb items > 2
# zstyle ':completion:*::::' completer _expand _complete _ignored _approximate # list of completers to use


##############################################################################
# History Configuration
##############################################################################

# 关于历史纪录的配置 {{{
# 历史纪录文件
HISTFILE="${HOME}/.zsh_history"  # Where to save history to disk
# 历史纪录条目数量
HISTSIZE=10000000                # How many lines of history to keep in memory
# 注销后保存的历史纪录条目数量
SAVEHIST=10000000                # Number of history entries to save to disk
# HISTDUP=erase                    # Erase duplicates in the history file
setopt BANG_HIST                 # Treat the '!' character specially during expansion.
# 为历史纪录中的命令添加时间戳
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
# 以附加的方式写入历史纪录
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
# setopt appendhistory             # Append history to the history file (no overwriting)
# setopt incappendhistory          # Immediately append to the history file, not just when a term is killed
setopt SHARE_HISTORY             # Share history between all sessions.
# setopt sharehistory              # Share history across terminals
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
# 如果连续输入的命令相同，历史纪录中只保留一个
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
# 在命令前添加空格，不将此命令添加到纪录文件中
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.
setopt HIST_BEEP                 # Beep when accessing nonexistent history.
# }}}

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

export EDITOR='vim'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# export PATH=".:$PATH"

# eval "$(gh-md-toc --completion-script-zsh)"

# NodeJS

export PATH="/usr/local/opt/node@10/bin:${PATH}"

export NVM_DIR="${HOME}/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d" ] && . "/usr/local/opt/nvm/etc/bash_completion.d"  # This loads nvm bash_completio

# Ruby

export PATH="/usr/local/opt/ruby/bin:${PATH}"

# # Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
# export PATH="$PATH:$HOME/.rvm/bin"
#
# [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

if command -v rbenv 1>/dev/null 2>&1; then
  eval "$(rbenv init -)"
fi

# Python

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

if command -v pyenv-virtualenv-init > /dev/null; then
  eval "$(pyenv virtualenv-init -)";
fi

# export PYENV_VIRTUALENVWRAPPER_PREFER_PYVENV="true"


# if command -v jenv 1>/dev/null 2>&1; then
#   eval "$(jenv init -)"
# fi

eval "$(perl -I$HOME/.perl5/lib/perl5 -Mlocal::lib=$HOME/.perl5)"

export GIT_TERMINAL_PROMPT=1
