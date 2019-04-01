# http://zsh.sourceforge.net/Doc/Release/Options.html

# 限制单条历史记录长度
# return 1: will not be saved
# reutnr 2: saved on the internal history list
autoload -Uz add-zsh-hook
add-zsh-hook zshaddhistory max_history_len
function max_history_len() {
  if (($#1 > 160)) {
    return 2
  }
  return 0
}


## History wrapper
function omz_history {
  local clear list
  zparseopts -E c=clear l=list

  if [[ -n "$clear" ]]; then
    # if -c provided, clobber the history file
    echo -n >| "$HISTFILE"
    echo >&2 History file deleted. Reload the session to see its effects.
  elif [[ -n "$list" ]]; then
    # if -l provided, run as if calling `fc' directly
    builtin fc "$@"
  else
    # unless a number is provided, show all history events (starting from 1)
    [[ ${@[-1]-} = *[0-9]* ]] && builtin fc -l "$@" || builtin fc -l "$@" 1
  fi
}


# Timestamp format
case ${HIST_STAMPS-} in
  "mm/dd/yyyy") alias history='omz_history -f' ;;
  "dd.mm.yyyy") alias history='omz_history -E' ;;
  "yyyy-mm-dd") alias history='omz_history -i' ;;
  "") alias history='omz_history' ;;
  *) alias history="omz_history -t '$HIST_STAMPS'" ;;
esac

## History file configuration
# 历史纪录文件
[ -z "$HISTFILE" ] && HISTFILE="${ZDOTDIR:-${XDG_CONFIG_HOME:-${HOME}/.config}/zsh}/.zsh_history"  # Where to save history to disk
# 历史纪录条目数量
HISTSIZE=10000000                # How many lines of history to keep in memory
# 注销后保存的历史纪录条目数量
SAVEHIST=10000000                # Number of history entries to save to disk

# History Command Configuration
# 关于历史纪录的配置 {{{1
setopt BANG_HIST                 # Treat the '!' character specially during expansion.
# 记录时间戳.为历史纪录中的命令添加时间戳
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" timestamp format.
# 以附加的方式写入历史纪录.按执行顺序添加历史
setopt INC_APPEND_HISTORY        # Append to the history file immediately, not just when the shell exits.
# setopt APPEND_HISTORY            # Append history to the history file (no overwriting)
# 实例之间即时共享历史
setopt SHARE_HISTORY             # Share history between all sessions.
# 首先移除重复历史
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
# 忽略重复.如果连续输入的命令相同，历史纪录中只保留一个
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
# 忽略空格开头的命令.在命令前添加空格，不将此命令添加到纪录文件中
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_NO_STORE
# setopt HIST_NO_FUNCTIONS
# 展开历史时不执行
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.
setopt HIST_BEEP                 # Beep when accessing nonexistent history.
# 更佳性能
setopt HIST_FCNTL_LOCK
# 使用 fc -IR 读取历史  fc -IA 保存历史
# }}}1
