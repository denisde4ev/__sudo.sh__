#!/bin/sh -e
e(){ printf "${2:-%s}" "$1"; }
E(){ e "${0##*/}: $1" %s\\n;exit 1; }
T(){
	e '9<&0 8>&1 7>&2 '
	[ -w /dev/tty ] && \
	e '0</dev/tty 1>/dev/tty 2>/dev/tty' || {
		e "${0##*/}: can't write /dev/tty, use -S option" >&2
		exit 1
	}
}
U(){ e '0<&9 1>&8 2>&1'; }
case $1 in
	''|-h) printf %s\\n "usage: ${0##*/} [-S] <command>";exit;;
	-S) shift; T(){ :;}; U(){ :;};;
	-*) E "invalid option -- '$1'";;
esac
set -- "$(
	( e "${@//"'"/"\'\\\'\'"}" "'%s' " ) 2>&- \
	|| for i; do
		e "$i" | sed "s/'/'\\\\''/g; 1s/^/'/; \$s/\$/' /"
	done
)"
eval "$(T) exec su -c \"$(U) exec \$1\""
