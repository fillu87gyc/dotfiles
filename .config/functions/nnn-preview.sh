#!/usr/bin/bash
nnn-preview ()
{
    # Block nesting of nnn in subshells
    if [ -n "$NNNLVL" ] && [ "${NNNLVL:-0}" -ge 1 ]; then
        echo "nnn is already running"
        return
    fi

    export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"

    NNN_FIFO="$(mktemp --suffix=-nnn -u)"
    export NNN_FIFO
    (umask 077; mkfifo "$NNN_FIFO")

    preview_cmd="$HOME/dotfiles/.config/functions/preview_cmd.sh"

    if [ -e "${TMUX%%,*}" ]; then
        tmux split-window -e "NNN_FIFO=$NNN_FIFO" -dh "$preview_cmd"
    fi

    nnn "$@"

    if [ -f "$NNN_TMPFILE" ]; then
            . "$NNN_TMPFILE"
            rm -f "$NNN_TMPFILE" > /dev/null
    fi
    rm -f "$NNN_FIFO"
}
