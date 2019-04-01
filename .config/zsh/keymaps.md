
#### original
`bindkey -l`
```
.safe
command
emacs
isearch
main
vicmd
viins
viopp
visual
```
`bindkey -LM main`
```
"^@" set-mark-command
"^A" beginning-of-line
"^B" backward-char
"^D" delete-char-or-list
"^E" end-of-line
"^F" forward-char
"^G" send-break
"^H" backward-delete-char
"^I" expand-or-complete
"^J" accept-line
"^K" kill-line
"^L" clear-screen
"^M" accept-line
"^N" down-line-or-history
"^O" accept-line-and-down-history
"^P" up-line-or-history
"^Q" push-line
"^R" history-incremental-search-backward
"^S" history-incremental-search-forward
"^T" transpose-chars
"^U" kill-whole-line
"^V" quoted-insert
"^W" backward-kill-word
"^X^B" vi-match-bracket
"^X^F" vi-find-next-char
"^X^J" vi-join
"^X^K" kill-buffer
"^X^N" infer-next-history
"^X^O" overwrite-mode
"^X^U" undo
"^X^V" vi-cmd-mode
"^X^X" exchange-point-and-mark
"^X*" expand-word
"^X=" what-cursor-position
"^XG" list-expand
"^Xg" list-expand
"^Xr" history-incremental-search-backward
"^Xs" history-incremental-search-forward
"^Xu" undo
"^Y" yank
"^[^D" list-choices
"^[^G" send-break
"^[^H" backward-kill-word
"^[^I" self-insert-unmeta
"^[^J" self-insert-unmeta
"^[^L" clear-screen
"^[^M" self-insert-unmeta
"^[^_" copy-prev-word
"^[ " expand-history
"^[!" expand-history
"^[\"" quote-region
"^[\$" spell-word
"^['" quote-line
"^[-" neg-argument
"^[." insert-last-word
"^[0" digit-argument
"^[1" digit-argument
"^[2" digit-argument
"^[3" digit-argument
"^[4" digit-argument
"^[5" digit-argument
"^[6" digit-argument
"^[7" digit-argument
"^[8" digit-argument
"^[9" digit-argument
"^[<" beginning-of-buffer-or-history
"^[>" end-of-buffer-or-history
"^[?" which-command
"^[A" accept-and-hold
"^[B" backward-word
"^[C" capitalize-word
"^[D" kill-word
"^[F" forward-word
"^[G" get-line
"^[H" run-help
"^[L" down-case-word
"^[N" history-search-forward
"^[OA" up-line-or-search
"^[OB" down-line-or-search
"^[OC" forward-char
"^[OD" backward-char
"^[OF" end-of-line
"^[OH" beginning-of-line
"^[P" history-search-backward
"^[Q" push-line
"^[S" spell-word
"^[T" transpose-words
"^[U" up-case-word
"^[W" copy-region-as-kill
"^[[200~" bracketed-paste
"^[[3~" delete-char
"^[[A" up-line-or-history
"^[[B" down-line-or-history
"^[[C" forward-char
"^[[D" backward-char
"^[_" insert-last-word
"^[a" accept-and-hold
"^[b" backward-word
"^[c" capitalize-word
"^[d" kill-word
"^[f" forward-word
"^[g" get-line
"^[h" run-help
"^[l" down-case-word
"^[n" history-search-forward
"^[p" history-search-backward
"^[q" push-line
"^[s" spell-word
"^[t" transpose-words
"^[u" up-case-word
"^[w" copy-region-as-kill
"^[x" execute-named-cmd
"^[y" yank-pop
"^[z" execute-last-named-cmd
"^[|" vi-goto-column
"^[^?" backward-kill-word
"^_" undo
" "-"~" self-insert
"^?" backward-delete-char
"\M-^@"-"\M-^?" self-insert
```

`OMZ::plugins/sudo/sudo.plugin.zsh`
```
# Add
"^[^[" sudo-command-line
```

`compinit`
```
# Add
"^X^R" _read_comp
"^X?" _complete_debug
"^XC" _correct_filename
"^Xa" _expand_alias
"^Xc" _correct_word
"^Xd" _list_expansions
"^Xe" _expand_word
"^Xh" _complete_help
"^Xm" _most_recent_file
"^Xn" _next_tags
"^Xt" _complete_tag
"^X~" _bash_list-choices
"^[," _history-complete-newer
"^[/" _history-complete-older
"^[~" _bash_complete-word
```

`issenn/zui`
```
# Add
"^O^Z" zui-demo-various
```

`issenn/zzcomplete`
```
# Changed
"^F" zzcomplete
```

`hlissner/zsh-autopair`
```
# Changed
"^H" autopair-delete
" " autopair-insert
"!" self-insert
"\"" autopair-insert
"#"-"&" self-insert
"'"-"(" autopair-insert
")" autopair-close
"*"-"Z" self-insert
"[" autopair-insert
"\\\\" self-insert
"]" autopair-close
"\^"-"_" self-insert
"\`" autopair-insert
"a"-"z" self-insert
"{" autopair-insert
"|" self-insert
"}" autopair-close
"~" self-insert
"^?" autopair-delete
```

`urbainvaes/fzf-marks`
```
# Changed
"^G" fzm
```

`Aloxaf/fzf-tab`
```
# Changed
"^I" fzf-tab-complete
```

`OMZ::plugins/vi-mode/vi-mode.plugin.zsh`
```
"^A" beginning-of-line
"^B"-"^C" self-insert
"^D" list-choices
"^E" end-of-line
"^F" self-insert
"^G" list-expand
"^H" backward-delete-char
"^I" expand-or-complete
"^J" accept-line
"^K" self-insert
"^L" clear-screen
"^M" accept-line
"^N" down-history
"^O" self-insert
"^P" up-history
"^Q" vi-quoted-insert
"^R" history-incremental-search-backward
"^S" history-incremental-search-forward
"^T" self-insert
"^U" vi-kill-line
"^V" vi-quoted-insert
"^W" backward-kill-word
"^Y"-"^Z" self-insert
"^[" vi-cmd-mode
"^[OA" up-line-or-history
"^[OB" down-line-or-history
"^[OC" vi-forward-char
"^[OD" vi-backward-char
"^[[200~" bracketed-paste
"^[[A" up-line-or-history
"^[[B" down-line-or-history
"^[[C" vi-forward-char
"^[[D" vi-backward-char
"^\\\\"-"~" self-insert
"^?" backward-delete-char
"\M-^@"-"\M-^?" self-insert
```

`OMZ::lib/key-bindings.zsh`
```
# Add
"^X^E" edit-command-line
"^[[1;5C" forward-word
"^[[1;5D" backward-word
"^[[5~" up-line-or-history
"^[[6~" down-line-or-history
"^[[Z" reverse-menu-complete
"^[m" copy-prev-shell-word
" " magic-space

# Changed
"^[OA" up-line-or-beginning-search
"^[OB" down-line-or-beginning-search
"^[l" "ls^J"
"^[w" kill-region
```