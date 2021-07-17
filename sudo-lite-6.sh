#!/bin/sh
q(){ for i;do printf %s "$i"|sed "s/'/'\\\\''/g;1s/^/'/;\$s/\$/' /";done;}
eval "$(U='0<&9 1>&8 2>&7 9>&- 8>&- 7>&-';T='9<&0 8>&1 7>&2 0</dev/tty 1>/dev/tty 2>/dev/tty'
case $1 in
-S)shift;T='';U='';;-*)echo "sudo: invalid option '$1'";exit 1
esac
printf %s "$T exec su -c \"$U") exec \$(q \"\$@\")\""
