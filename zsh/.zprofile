# source ~/src/github.com/b4b4r07/history/misc/zsh/init.zsh 2>/dev/null
bindkey "^[[4~" end-of-line
bindkey "^[[1~" beginning-of-line
bindkey "^[[3~" delete-char
bindkey "^k" vi-forward-word
bindkey "^j" vi-backward-word
bindkey '^G' ghq-sel
bindkey '^Y' fzf-z-search
bindkey '^T' fzf-file-widget
bindkey '^N' fzf-cd-widget
