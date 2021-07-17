#!/bin/sh
e(){ printf %s$2 "$1"; }
U(){ e "0<&9 1>&8 2>&7"; }
T(){ e "9<&0 8>&1 7>&2 0</dev/tty 1>/dev/tty 2>/dev/tty"; }
case $1 in
'')e "usage: sudo [-S] <command>" \\n
exit;;-S)shift
alias T=: U=:;;-*)e "sudo: invalid option '$1'" \\n
exit 1
esac
set -- "$(for i;do e "$i"|sed "s/'/'\\\\''/g;1s/^/'/;\$s/\$/' /";done)"
eval "$(T) exec su -c \"$(U) exec \$1\""
