#!/usr/bin/bash
NNN_FIFO=${NNN_FIFO:-$1}
if [ ! -r "$NNN_FIFO" ]; then
    echo "Unable to open \$NNN_FIFO='$NNN_FIFO'" | less
fi

while read -r selection; do
    clear
    lines=$(($(tput lines)-1))
    cols=$(tput cols)

    # Print directory tree
    if [ -d "$selection" ]; then
        cd "$selection" || continue
        exa -ahH --git --git-ignore --tree -L 2 --icons --color=always \
            | head -n $lines \
            | cut -c 1-"$cols"
        continue
    fi

    # Print file head
    if [ -f "$selection" ]; then
        bat -pp --color=always --wrap=never --line-range :$lines $selection
        continue
    fi

    # Something went wrong
    echo "Unknown type: '$selection'"
done < "$NNN_FIFO"

