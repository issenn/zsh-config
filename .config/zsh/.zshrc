# module_path+=( "${XDG_DATA_HOME:-${HOME}/.local/share}/zsh/zinit/bin/zmodules/Src" )
# zmodload zdharma/zplugin

local ZSHRC="zshrc.zinit.zsh"

[[ "${UID}" -ge 500 ]] &&
  {
    [[ -f "${ZDOTDIR:-${XDG_CONFIG_HOME:-${HOME}/.config}/zsh}/${ZSHRC:-zshrc.zinit.zsh}" ]] &&
    source "${ZDOTDIR:-${XDG_CONFIG_HOME:-${HOME}/.config}/zsh}/${ZSHRC:-zshrc.zinit.zsh}" ||
    {
      [[ -f "${0:a:h}/${ZSHRC:-zshrc.zinit.zsh}" ]] &&
      source "${0:a:h}/${ZSHRC:-zshrc.zinit.zsh}"
    }
  }

unset ZSHRC
