#!/bin/sh
alias e='printf ${2:-%s}"${2:+'%s' }" "$1"' U="e '0<&9 1>&8 2>&1'"
T(){
e '9<&0 8>&1 7>&2 '
[ -w /dev/tty ]&&e '0</dev/tty 1>/dev/tty 2>/dev/tty'||{>&2 e "${0##*/}: can't write /dev/tty, use -S option";exit 1;}
}
case $1 in
'')e "usage: ${0##*/} [-S] <command>";echo;exit;;
-S)shift;alias T=: U=:;;
-*)e "${0##*/}: invalid option -- '$1'";echo;exit 1
esac
set -- "$(
(e "${@//"'"/"\'\\\'\'"}" \ ) 2>&-||for i;do e "$i"|sed "s/'/'\\\\''/g;1s/^/'/;\$s/\$/' /";done)"
eval "$(T) exec su -c \"$(U) exec \$1\""
