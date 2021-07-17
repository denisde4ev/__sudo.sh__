#!/bin/sh -e
alias e='printf %s' U='[ -w /dev/tty ]&&e "0<&9 1>&8 2>&1"' T='e "9<&0 8>&1 7>&2 0</dev/tty 1>/dev/tty 2>/dev/tty"'
case $1 in
'')e "usage: ${0##*/} [-S] <command>";! echo;;-S)shift;alias T=: U=:;;-*)e "${0##*/}: invalid option '$1'";! echo
esac
set -- "$(for i;do e "$i"|sed "s/'/'\\\\''/g;1s/^/'/;\$s/\$/' /";done)"
eval "$(T) exec su -c \"$(U) exec \$1\""

e >&2 "${0##*/}: use -S"
