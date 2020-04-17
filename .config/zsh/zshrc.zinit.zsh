#!/usr/bin/env zsh


# 作为嵌入式终端时禁用 tmux
# https://www.reddit.com/r/tmux/comments/a2e5mn/tmux_on_dolphin_inbuilt_terminal/
# 上面的方法由于 alacritty 0.4.0 的释出而失效
# if [[ "$OSTYPE" == "darwin"* ]]; then
#   exec tmux -f "$XDG_CONFIG_HOME/tmux/tmux.conf"
# else
#   if [[ "$TMUX" == "" && $- == *i* ]]; then
#     if [[ ! "$(</proc/$PPID/cmdline)" =~ "/usr/bin/(dolphin|emacs|kate)" ]]; then
#       exec tmux -f "$XDG_CONFIG_HOME/tmux/tmux.conf"
#     fi
#   fi
# fi

# WSL doesnt set $SHELL correctly.
# if [[ $(uname -r) =~ Microsoft$ ]]; then
#   SHELL=$(which zsh)
# fi


# Start: Zsh ENV PATH

export PATH="/usr/local/opt/openssl@1.1/bin:${PATH}"

# export PATH="/usr/local/opt/curl/bin:$PATH"
# export PATH="/usr/local/opt/curl-openssl/bin:$PATH"
# export PATH="/usr/local/opt/curl-max/bin:$PATH"

export PATH="/usr/local/opt/grep/libexec/gnubin:${PATH}"

# export PATH="/usr/local/opt/gnu-which/libexec/gnubin:$PATH"

# export MANPATH="/usr/local/opt/make/libexec/gnuman:$MANPATH"

# export PATH="/usr/local/opt/sqlite/bin:$PATH"

# export PATH="/usr/local/opt/m4/bin:$PATH"

# export PATH="/usr/local/opt/e2fsprogs/bin:$PATH"
# export PATH="/usr/local/opt/e2fsprogs/sbin:$PATH"

export PATH="/usr/local/opt/ruby/bin:${PATH}"

export PATH="/usr/local/opt/node/bin:${PATH}"

export GPG_TTY=$(tty)

# End: Zsh ENV PATH


# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-${HOME}/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-${HOME}/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Lines configured by zsh-newuser-install
# HISTFILE=~/.histfile
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
# zstyle :compinstall filename '/Users/issenn/.zshrc'
zstyle :compinstall filename "${ZDOTDIR:-${XDG_CONFIG_HOME:-${HOME}/.config}/zsh}/.zshrc"

# autoload -Uz compinit
# compinit
# End of lines added by compinstall


# Start: Zinit initial

# Base config
# declare -A ZINIT  # initial Zinit's hash definition, if configuring before loading Zinit, and then:

# ZINIT[BIN_DIR]="${XDG_DATA_HOME:-${HOME}/.local/share}/zsh/zinit/bin"
# ZINIT[HOME_DIR]="${XDG_DATA_HOME:-${HOME}/.local/share}/zsh/zinit"
# ZINIT[PLUGINS_DIR]="${XDG_DATA_HOME:-${HOME}/.local/share}/zsh/zinit/plugins"
# ZINIT[COMPLETIONS_DIR]="${XDG_DATA_HOME:-${HOME}/.local/share}/zsh/zinit/completions"
# ZINIT[SNIPPETS_DIR]="${XDG_DATA_HOME:-${HOME}/.local/share}/zsh/zinit/snippets"
# ZINIT[ZCOMPDUMP_PATH]="${ZDOTDIR:-${XDG_CONFIG_HOME:-${HOME}/.config}/zsh}/.zcompdump-$(whoami)-${ZSH_VERSION}"
# ZINIT[COMPINIT_OPTS]="-C"
# ZINIT[MUTE_WARNINGS]=
# ZINIT[OPTIMIZE_OUT_DISK_ACCESSES]=

typeset -A ZINIT=(
  BIN_DIR         "${XDG_DATA_HOME:-${HOME}/.local/share}/zsh/zinit/bin"
  HOME_DIR        "${XDG_DATA_HOME:-${HOME}/.local/share}/zsh/zinit"
  PLUGINS_DIR     "${XDG_DATA_HOME:-${HOME}/.local/share}/zsh/zinit/plugins"
  SNIPPETS_DIR    "${XDG_DATA_HOME:-${HOME}/.local/share}/zsh/zinit/snippets"
  # ZCOMPDUMP_PATH  "${ZDOTDIR:-${XDG_CONFIG_HOME:-${HOME}/.config}/zsh}/.zcompdump-$(whoami)-${ZSH_VERSION}"
  ZCOMPDUMP_PATH  "${XDG_CACHE_HOME:-${HOME}/.cache}/zsh/.zcompdump-$(whoami)-${ZSH_VERSION}"
  COMPINIT_OPTS   "-C"
)

# typeset -g ZPLG_MOD_DEBUG=1

if [[ ! -s "${ZINIT[BIN_DIR]}/zinit.zsh" ]]; then
  print -P "%F{33}▓▒░ %F{220}Installing DHARMA Initiative Plugin Manager (zdharma/zinit)…%f"
  command git clone git@github.com:issenn/zinit.git "${ZINIT[BIN_DIR]}" && \
    print -P "%F{33}▓▒░ %F{34}Installation successful.%f" || \
    print -P "%F{160}▓▒░ The clone has failed.%f"
  zcompile "${ZINIT[BIN_DIR]}/zinit.zsh"
fi

source "${ZINIT[BIN_DIR]}/zinit.zsh"

autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# End: Zinit initial


# Start: Zinit Plugins Configuration Settings

# {{{1
# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="yyyy-mm-dd"
# }}}1

[[ -d "${XDG_CACHE_HOME:-${HOME}/.cache}/less" ]] || mkdir -p "${XDG_CACHE_HOME:-${HOME}/.cache}/less"

# tmux {{{1
[[ -z "${ZSH_TMUX_CONFIG}" ]] && ZSH_TMUX_CONFIG="${XDG_CONFIG_HOME:-${HOME}/.config}/tmux/tmux.conf"
[[ -z "${ZSH_TMUX_AUTOSTART}" ]] && ZSH_TMUX_AUTOSTART=false  # tmux自启动有问题
[[ -z "${ZSH_TMUX_AUTOSTART_ONCE}" ]] && ZSH_TMUX_AUTOSTART_ONCE=true
[[ -z "${ZSH_TMUX_AUTOCONNECT}" ]] && ZSH_TMUX_AUTOCONNECT=false
[[ -z "${ZSH_TMUX_AUTOQUIT}" ]] && ZSH_TMUX_AUTOQUIT=false
[[ -z "${ZSH_TMUX_FIXTERM}" ]] && ZSH_TMUX_FIXTERM=true
[[ -z "${ZSH_TMUX_UNICODE}" ]] && ZSH_TMUX_UNICODE=true

if [[ ! -s "${XDG_DATA_HOME:-${HOME}/.local/share}/tmux/plugins/tpm/tpm" ]]; then
  command git clone git@github.com:tmux-plugins/tpm.git "${XDG_DATA_HOME:-${HOME}/.local/share}/tmux/plugins/tpm"
  # command zsh "${XDG_DATA_HOME:-${HOME}/.local/share}/tmux/plugins/tpm/bin/install_plugins"
  command mkdir -p "${XDG_DATA_HOME:-${HOME}/.local/share}/tmux/"{logging,resurrect}
fi

# }}}1

# rime squirrel plum {{{1
if (( $+commands[brew] )) && dir=$(brew --prefix squirrel 2>/dev/null); then
  if [[ ! -s "${XDG_DATA_HOME:-${HOME}/.local/share}/Rime/plum/rime-install" ]]; then
    command git clone --depth 1 https://github.com/rime/plum.git "${XDG_DATA_HOME:-${HOME}/.local/share}/Rime/plum"
  fi
  # if [[ ! -d "${XDG_DATA_HOME:-${HOME}/.local/share}/Rime/plum/package/rime/double-pinyin" ]]; then
  #   command bash "${XDG_DATA_HOME:-${HOME}/.local/share}/Rime/plum/rime-install" "double-pinyin"
  # fi
fi
# }}}1

[[ -d "${XDG_CONFIG_HOME:-${HOME}/.config}/mysql" ]] || mkdir -p "${XDG_CONFIG_HOME:-${HOME}/.config}/mysql"

# nvm {{{1
# ZSH_NVM_NO_LOAD=true
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.config/nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
# export NVM_SYMLINK_CURRENT="true"  # nvm use should make a symlink
export NVM_LAZY_LOAD=true
# export NVM_NO_USE=true
export NVM_AUTO_USE=true
# }}}1

# {{{1
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
ZSH_AUTOSUGGEST_USE_ASYNC=1
# make prompt faster
ZSH_AUTOSUGGEST_MANUAL_REBIND=1
ZSH_AUTOSUGGEST_COMPLETION_IGNORE='( |man |pikaur -S )*'
# }}}1

# make pasting into terminal faster
DISABLE_MAGIC_FUNCTIONS=true

GENCOMP_DIR="${ZDOTDIR:-${XDG_CONFIG_HOME:-${HOME}/.config}/zsh}/completions"

# Define them before sourcing the plugin if you don't use any plugin manager.
# forgit_log=glo
# forgit_diff=gd
# forgit_add=ga
# forgit_reset_head=grh
# forgit_ignore=gi
# forgit_restore=gcf
# forgit_clean=gclean
# forgit_stash_show=gss

# ZSHZ_DATA="${XDG_DATA_HOME:-${HOME}/.local/share}/zshz/.z"
export _ZL_DATA="${XDG_DATA_HOME:-${HOME}/.local/share}/z.lua/.z"
if [[ ! -f "${_ZL_DATA}" ]]; then
  command mkdir -p "${XDG_DATA_HOME:-${HOME}/.local/share}/z.lua"
fi

export FZF_MARKS_FILE="${XDG_DATA_HOME:-${HOME}/.local/share}/fzf-marks/.fzf-marks"
if [[ ! -f "${FZF_MARKS_FILE}" ]]; then
  command mkdir -p "${XDG_DATA_HOME:-${HOME}/.local/share}/fzf-marks"
fi

export AGV_EDITOR='kwrite -l $line -c $col $file'

# (experimental, may change in the future)
local extract="
# trim input(what you select)
in=\${\${\"\$(<{f})\"%\$'\0'*}#*\$'\0'}
# get ctxt for current completion(some thing before or after the current word)
local -A ctxt=(\"\${(@ps:\2:)CTXT}\")
"

zstyle ':fzf-tab:*' single-group ''

# use input as query string when completing zlua
zstyle ':fzf-tab:complete:_zlua:*' query-string input

# give a preview of commandline arguments when completing `kill`
zstyle ':fzf-tab:complete:kill:argument-rest' extra-opts --preview=$extract'ps --pid=$in[(w)1] -o cmd --no-headers -w -w' --preview-window=down:3:wrap

# give a preview of directory by exa when completing cd
zstyle ':fzf-tab:complete:cd:*' extra-opts --preview=$extract'exa -1 --color=always ${~ctxt[hpre]}$in'

# Powerlevel10k  {{{1
# https://github.com/romkatv/powerlevel10k/issues/132
ZLE_RPROMPT_INDENT=0

# }}}1

# End: Zinit Plugins Configuration Settings


# Start: Zinit Annexes

# zinit-zsh/z-a-test \
# zinit-zsh/z-a-man \
zinit light-mode for \
  zinit-zsh/z-a-patch-dl \
  zinit-zsh/z-a-submods \
  issenn/z-a-bin-gem-node \
  zinit-zsh/z-a-rust \
  zinit-zsh/z-a-as-monitor

# End: Zinit Annexes


# Start: Zinit Functions

fpath+=("${ZDOTDIR:-${XDG_CONFIG_HOME:-${HOME}/.config}/zsh}/functions" "${ZDOTDIR:-${XDG_CONFIG_HOME:-${HOME}/.config}/zsh}/completions")

# autoload -Uz rgzh rgsrc rgdata pslist ebindkey expand_alias palette printc
# autoload +X zman
# autoload -Uz zcalc zmv
autoload -Uz jump-target expand_alias
# autoload -Uz ebindkey

# End: Zinit Functions


# Start: Zinit completions Plugins

zinit ice atpull'zinit creinstall -q .' blockf
zinit light zsh-users/zsh-completions

zinit light Aloxaf/gencomp

# End: Zinit completions Plugins


# Start: Zinit Programs

# ogham/exa, replacement for ls
zinit as"null" lucid from"gh-r" for \
  sbin"fzf" \
    junegunn/fzf-bin \
  sbin"**/fd" \
    @sharkdp/fd \
  sbin"**/bat" \
    @sharkdp/bat \
  sbin"exa* -> exa" \
    ogham/exa

zinit ice as="program" atclone="rm -f ^(rgg|agv)"
zinit light lilydjwg/search-and-view

zinit ice mv=":cht.sh -> cht.sh" atclone="chmod +x cht.sh" as="program"
zinit snippet https://cht.sh/:cht.sh

zinit ice mv=":zsh -> _cht" as="completion"
zinit snippet https://cheat.sh/:zsh

zinit light lukechilds/zsh-nvm  # This load nvm on first use of node, npm, etc

# End: Zinit Programs


# Start: Zinit Scripts

# On OSX, you might need to install coreutils from homebrew and use the
# g-prefix – gsed, gdircolors
# ogham/exa also uses the definitions
zinit ice lucid reset \
  atclone"local P=${${(M)OSTYPE:#*darwin*}:+g}
          \${P}sed -i \
          '/DIR/c\DIR 38;5;63;1' LS_COLORS; \
          \${P}dircolors -b LS_COLORS > c.zsh" \
  atpull'%atclone' pick"c.zsh" nocompile'!' \
  atload'zstyle ":completion:*" list-colors "${(s.:.)LS_COLORS}";'
zinit light trapd00r/LS_COLORS

# End: Zinit Scripts


# Start: Zinit Snippets

zinit snippet OMZ::lib/clipboard.zsh
# OMZ 主题基本上都使用了 OMZ 提供的 git 库，因此使用这些主题之前需要先加载 git.zsh
zinit snippet OMZ::lib/git.zsh
zinit snippet OMZ::lib/completion.zsh
zinit snippet OMZ::lib/history.zsh
# 直接加载 OMZ 的键位绑定
# zinit snippet OMZ::lib/key-bindings.zsh
zinit snippet OMZ::lib/theme-and-appearance.zsh
zinit snippet OMZ::lib/functions.zsh
zinit snippet OMZ::lib/misc.zsh

zinit snippet OMZ::plugins/git/git.plugin.zsh
zinit snippet OMZ::plugins/vi-mode/vi-mode.plugin.zsh
# zinit snippet OMZ::plugins/common-aliases/common-aliases.plugin.zsh
zinit snippet OMZ::plugins/colored-man-pages/colored-man-pages.plugin.zsh
zinit snippet OMZ::plugins/git-extras/git-extras.plugin.zsh
zinit snippet OMZ::plugins/systemd/systemd.plugin.zsh
zinit snippet OMZ::plugins/sudo/sudo.plugin.zsh
zinit snippet OMZ::plugins/pyenv/pyenv.plugin.zsh
zinit snippet OMZ::plugins/rbenv/rbenv.plugin.zsh
zinit snippet OMZ::plugins/autojump/autojump.plugin.zsh

zinit ice svn if'[[ -n "$commands[tmux]" ]]' lucid
zinit snippet OMZ::plugins/tmux

zinit ice svn
zinit snippet OMZ::plugins/extract
zinit ice svn
zinit snippet OMZ::plugins/pip

zinit as="completion" for \
  OMZ::plugins/nvm/_nvm \
  OMZ::plugins/cargo/_cargo \
  OMZ::plugins/rust/_rust \
  OMZ::plugins/fd/_fd

# End: Zinit Snippets


# Start: Zinit Plugins

zinit light issenn/zui
zinit light issenn/zzcomplete

zinit ice pick'autopair.zsh' nocompletions
zinit light hlissner/zsh-autopair

zinit light hchbaw/zce.zsh
zinit light skywind3000/z.lua
# zinit light agkozak/zsh-z
zinit light wfxr/forgit
zinit light urbainvaes/fzf-marks

# b4b4r07/enhancd

# End: Zinit Plugins


# 初始化补全
# autoload -Uz compinit
# compinit
# zinit cdreplay -q
ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay


# Start: Zinit Customization Snippets

# zinit ice lucid id-as"auto"
# zinit snippet 'https://github.com/issenn/zsh-config/blob/master/.config/zsh/snippets/alias.zsh'

alias rm="rm -i"

zinit ice lucid id-as"auto"
# zinit snippet 'https://github.com/issenn/zsh-config/blob/master/.config/zsh/snippets/key-bindings.zsh'
zinit snippet "${ZDOTDIR:-${XDG_CONFIG_HOME:-${HOME}/.config}/zsh}/snippets/key-bindings.zsh"

zinit ice lucid id-as"auto"
# zinit snippet 'https://github.com/issenn/zsh-config/blob/master/.config/zsh/snippets/misc.zsh'
zinit snippet "${ZDOTDIR:-${XDG_CONFIG_HOME:-${HOME}/.config}/zsh}/snippets/misc.zsh"

zinit ice lucid id-as"auto"
# zinit snippet 'https://github.com/issenn/zsh-config/blob/master/.config/zsh/snippets/history.zsh'
zinit snippet "${ZDOTDIR:-${XDG_CONFIG_HOME:-${HOME}/.config}/zsh}/snippets/history.zsh"

zinit ice lucid id-as"auto"
# zinit snippet 'https://github.com/issenn/zsh-config/blob/master/.config/zsh/snippets/alias-tips.zsh'
zinit snippet "${ZDOTDIR:-${XDG_CONFIG_HOME:-${HOME}/.config}/zsh}/snippets/alias-tips.zsh"

zinit ice lucid id-as"auto"
# zinit snippet 'https://github.com/issenn/zsh-config/blob/master/.config/zsh/snippets/gpg.zsh'
zinit snippet "${ZDOTDIR:-${XDG_CONFIG_HOME:-${HOME}/.config}/zsh}/snippets/gpg.zsh"

# End: Zinit Customization Snippets


# Start: Zinit Special Plugins

zinit light Aloxaf/fzf-tab

# Fast-syntax-highlighting & autosuggestions & completions
zinit ice atload"_zsh_autosuggest_start"
zinit light zsh-users/zsh-autosuggestions
zinit light issenn/fast-syntax-highlighting

# zinit lucid light-mode for \
#   atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay" \
#     issenn/fast-syntax-highlighting \
#   atload"!_zsh_autosuggest_start" \
#     zsh-users/zsh-autosuggestions \
#   atpull'zinit creinstall -q .' atload"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay" blockf \
#     zsh-users/zsh-completions

# End: Zinit Special Plugins


# Start: Zinit Themes

# 加载 Powerlevel10k 主题
zinit depth=1 atload='[[ ! -f "${ZDOTDIR:-${XDG_CONFIG_HOME:-${HOME}/.config}/zsh}/.p10k.zsh" ]] || source "${ZDOTDIR:-${XDG_CONFIG_HOME:-${HOME}/.config}/zsh}/.p10k.zsh"' lucid nocd
zinit light romkatv/powerlevel10k

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
# [[ ! -f "${ZDOTDIR:-${XDG_CONFIG_HOME:-${HOME}/.config}/zsh}/.p10k.zsh" ]] || source "${ZDOTDIR:-${XDG_CONFIG_HOME:-${HOME}/.config}/zsh}/.p10k.zsh"

# End: Zinit Themes
