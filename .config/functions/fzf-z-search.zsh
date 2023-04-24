fzf-z-search() {
	local res=$(z | sort -rn | cut -c 12- |FZF_DEFAULT_OPTS=$FZF_CD_OPTS fzf)
    if [ -n "$res" ]; then
        BUFFER+="cd $res"
        zle accept-line
    else
        return 1
    fi
}

zle -N fzf-z-search