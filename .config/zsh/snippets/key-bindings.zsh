# https://github.com/Aloxaf/dotfiles/blob/master/zsh/.config/zsh/snippets/key-bindings.zsh

# Make sure that the terminal is in application mode when zle is active, since
# only then values from $terminfo are valid
if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
  function zle-line-init() {
    echoti smkx
  }
  function zle-line-finish() {
    echoti rmkx
  }
  zle -N zle-line-init
  zle -N zle-line-finish
fi

if [[ "${terminfo[kpp]}" != "" ]]; then
  bindkey "${terminfo[kpp]}" up-line-or-history       # [PageUp] - Up a line of history
fi
if [[ "${terminfo[knp]}" != "" ]]; then
  bindkey "${terminfo[knp]}" down-line-or-history     # [PageDown] - Down a line of history
fi

# start typing + [Up-Arrow] - fuzzy find history forward
if [[ "${terminfo[kcuu1]}" != "" ]]; then
  autoload -U up-line-or-beginning-search
  zle -N up-line-or-beginning-search
  bindkey "${terminfo[kcuu1]}" up-line-or-beginning-search
fi
# start typing + [Down-Arrow] - fuzzy find history backward
if [[ "${terminfo[kcud1]}" != "" ]]; then
  autoload -U down-line-or-beginning-search
  zle -N down-line-or-beginning-search
  bindkey "${terminfo[kcud1]}" down-line-or-beginning-search
fi

if [[ "${terminfo[khome]}" != "" ]]; then
  bindkey "${terminfo[khome]}" beginning-of-line      # [Home] - Go to beginning of line
fi
if [[ "${terminfo[kend]}" != "" ]]; then
  bindkey "${terminfo[kend]}"  end-of-line            # [End] - Go to end of line
fi

bindkey ' ' magic-space                               # [Space] - do history expansion

if [[ "${terminfo[kcbt]}" != "" ]]; then
  bindkey "${terminfo[kcbt]}" reverse-menu-complete   # [Shift-Tab] - move through the completion menu backwards
fi

bindkey '^?' backward-delete-char                     # [Backspace] - delete backward
if [[ "${terminfo[kdch1]}" != "" ]]; then
  bindkey "${terminfo[kdch1]}" delete-char            # [Delete] - delete forward
else
  bindkey "^[[3~" delete-char
  bindkey "^[3;5~" delete-char
  bindkey "\e[3~" delete-char
fi

# ^Xe Edit the current command line in $EDITOR
autoload -Uz edit-command-line
function edit-command-line-as-zsh {
  TMPSUFFIX=.zsh
  edit-command-line
  unset TMPSUFFIX
}
zle -N edit-command-line-as-zsh
bindkey '^X^E' edit-command-line-as-zsh

# file rename magick. better than copy-prev-word
# bindkey "^[m" copy-prev-shell-word
# bindkey "^[^_" copy-prev-shell-word

# -----------------------------------------------------------------------------
# command line
# -----------------------------------------------------------------------------

# Delete all characters whole line
# C-U 0x15
bindkey "^U" kill-whole-line

# Delete all characters left of the cursor
# ⌘⌫ 0x18 0x7f
bindkey "^X^?" backward-kill-line

# Delete all characters right of the cursor
# C-K 0x15
bindkey "^K" kill-line

# 单行模式下将当前内容入栈开启一个临时 prompt
# 多行模式下允许编辑前面的行
# ⌥q  # Alt-q
# Other way with Meta Key
bindkey "\eq" push-line-or-edit

# -----------------------------------------------------------------------------
# command word
# -----------------------------------------------------------------------------

# bindkey '^[[1;5C' forward-word                        # [Ctrl-RightArrow] - move forward one word
# bindkey '^[[1;5D' backward-word                       # [Ctrl-LeftArrow] - move backward one word

# ⌥→
bindkey "\e[1;9C" forward-word                        # [Option-RightArrow] - move forward one word
bindkey "\ef" forward-word
bindkey "^[f" forward-word

# ⌥←
bindkey "\e[1;9D" backward-word                       # [Option-LeftArrow] - move backward one word
bindkey "\eb" backward-word
bindkey "^[b" backward-word

# move by shell word {{{1
# 按参数边界跳转
# 参考 https://blog.lilydjwg.me/2013/11/14/zsh-move-by-shell-arguments.41712.html
() {
  # see select-word-style for more
  local -a to_bind=(forward-word backward-word backward-kill-word)
  local widget
  for widget ($to_bind) {
    autoload -Uz $widget-match
    zle -N zsh-$widget $widget-match
  }
  # set the style to shell
  zstyle ':zle:zsh-*' word-style shell
}
# ⇧⌥→
bindkey '\e[1;10C' zsh-forward-word
# ⇧⌥←
bindkey '\e[1;10D' zsh-backward-word

# Delete one word to left of cursor
# ⌥⌫ 0x1b 0x7f
bindkey "^[^?" zsh-backward-kill-word

# Delete one word to right of cursor
# ⌥⌦ 0x1b 0x7f
bindkey "\ed" kill-word

# }}}1

bindkey "^_" undo
bindkey "^X^_" redo

# -----------------------------------------------------------------------------
# plugin
# -----------------------------------------------------------------------------

# fuzzy 相关绑定 {{{1
# 快速目录跳转
function fz-zjump-widget() {
  local selected=$(z -l | fzf -n "2.." --tiebreak=end,index --tac --prompt="jump> ")
  if [[ "$selected" != "" ]] {
    builtin cd "${selected[(w)2]}"
  }
  zle push-line
  zle accept-line
}
zle -N fz-zjump-widget
bindkey '\ec' fz-zjump-widget

# 搜索历史
function fz-history-widget() {
  local selected=$(fc -rl 1 | fzf -n "2.." --tiebreak=index --prompt="cmd> " ${BUFFER:+-q $BUFFER})
  if [[ "$selected" != "" ]] {
    zle vi-fetch-history -n $selected
  }
}
zle -N fz-history-widget
bindkey '^R' fz-history-widget

# 搜索文件
# 会将 * 或 ** 替换为搜索结果
# 前者表示搜索单层, 后者表示搜索子目录
function fz-find() {
  local selected dir cut
  cut=$(grep -oP '[^* ]+(?=\*{1,2}$)' <<< $BUFFER)
  eval "dir=${cut:-.}"
  if [[ $BUFFER == *"**"* ]] {
    selected=$(fd -H . $dir | fzf --tiebreak=end,length --prompt="cd> ")
  } elif [[ $BUFFER == *"*"* ]] {
    selected=$(fd -d 1 . $dir | fzf --tiebreak=end --prompt="cd> ")
  }
  BUFFER=${BUFFER/%'*'*/}
  BUFFER=${BUFFER/%$cut/$selected}
  zle end-of-line
}
zle -N fz-find
bindkey '\es' fz-find

# }}}1

# url-quote {{{1

# # https://archive.zhimingwang.org/blog/2015-09-21-zsh-51-and-bracketed-paste.html
# autoload -Uz bracketed-paste-url-magic
# zle -N bracketed-paste bracketed-paste-url-magic

# # zsh 5.1+ uses bracketed-paste-url-magic
# if [[ $ZSH_VERSION =~ '^[0-4]\.' || $ZSH_VERSION =~ '^5\.0\.[0-9]' ]]; then
#   autoload -Uz url-quote-magic
#   zle -N self-insert url-quote-magic
#   toggle-uqm () {
#     if zle -l self-insert; then
#       zle -A .self-insert self-insert && zle -M "switched to self-insert"
#     else
#       zle -N self-insert url-quote-magic && zle -M "switched to url-quote-magic"
#     fi
#   }
#   zle -N toggle-uqm
#   bindkey '^X$' toggle-uqm
# fi

# }}}1

zstyle ':completion:*' menu select

# zmodload zsh/complist
# bindkey -M menuselect '^O' accept-and-infer-next-history

# use the vi navigation keys in menu completion
# bindkey -M menuselect 'h' vi-backward-char
# bindkey -M menuselect 'k' vi-up-line-or-history
# bindkey -M menuselect 'l' vi-forward-char
# bindkey -M menuselect 'j' vi-down-line-or-history

# jump to a position in a command line {{{2
# https://github.com/scfrazer/zsh-jump-target
autoload -Uz jump-target
zle -N jump-target
bindkey "^J^J" jump-target

# ZLE 相关 {{{1

# zce {{{2
# 快速跳转到指定字符
function zce-jump-char() {
  [[ -z $BUFFER ]] && zle up-history
  zstyle ':zce:*' prompt-char '%B%F{green}Jump to character:%F%b '
  zstyle ':zce:*' prompt-key '%B%F{green}Target key:%F%b '
  with-zce zce-raw zce-searchin-read
}
zle -N zce-jump-char
bindkey "^J" zce-jump-char

# 删除到指定字符
function zce-delete-to-char() {
  [[ -z $BUFFER ]] && zle up-history
  local pbuffer=$BUFFER pcursor=$CURSOR
  local keys=${(j..)$(print {a..z} {A..Z})}
  zstyle ':zce:*' prompt-char '%B%F{yellow}Delete to character:%F%b '
  zstyle ':zce:*' prompt-key '%B%F{yellow}Target key:%F%b '
  zce-raw zce-searchin-read $keys

  if (( $CURSOR < $pcursor ))  {
    pbuffer[$CURSOR,$pcursor]=$pbuffer[$CURSOR]
  } else {
    pbuffer[$pcursor,$CURSOR]=$pbuffer[$pcursor]
    CURSOR=$pcursor
  }
  BUFFER=$pbuffer
}
zle -N zce-delete-to-char
bindkey "^J^D" zce-delete-to-char

# }}}2

# 快速添加括号 {{{2
function add-bracket() {
  BUFFER[$CURSOR+1]="($BUFFER[$CURSOR+1]"
  BUFFER+=')'
}
zle -N add-bracket
bindkey "\e(" add-bracket
# }}}2

# 快速跳转到上级目录: ... => ../.. {{{2
# https://grml.org/zsh/zsh-lovers.html
function rationalise-dot() {
  if [[ $LBUFFER = *.. ]] {
    LBUFFER+=/..
  } else {
    LBUFFER+=.
  }
}
zle -N rationalise-dot
bindkey "." rationalise-dot
# }}}2

# }}}1

# 棒棒 Alt-x
function execute-command() {
  local selected=$(printf "%s\n" ${(k)widgets} | fzf --reverse --prompt="cmd> " --height=10 )
  zle redisplay
  [[ $selected ]] && zle $selected
}
zle -N execute-command
bindkey "\ex" execute-command
