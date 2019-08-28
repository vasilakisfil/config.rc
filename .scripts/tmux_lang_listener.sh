#!/bin/bash
while IFS= read -r newline
do
    tmux refresh-client -S
done < <(dconf watch /org/gnome/desktop/input-sources/mru-sources)
