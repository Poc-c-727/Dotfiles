#!/bin/zsh

# uso: toggle-process.sh <nome_do_processo> <commando> [args...]

proc="$1"
shift

if pgrep -x "$proc" > /dev/null; then
    pkill -x "$proc"
else
    "$@" &
fi
