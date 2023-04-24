function ghq-sel () {
  local selected_dir=$(ghq list -p |FZF_DEFAULT_OPTS='--height 80% --reverse --border --preview "tree -C {} | head -200"' fzf --query "$LBUFFER")
  if [ -n "$selected_dir" ]; then
    BUFFER="cd ${selected_dir}"
    zle accept-line
  fi
  zle clear-screen
}

zle -N ghq-sel 