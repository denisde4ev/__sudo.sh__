#!/bin/sh
q(){ for i;do printf %s "$i"|sed "s/'/'\\\\''/g;1s/^/'/;\$s/\$/' /";done;}
eval "$(case $1 in #"
-S)echo 'shift;exec su -c "';;*)echo '9<&0 8>&1 7>&2 0</dev/tty 1>/dev/tty 2>/dev/tty exec su -c "0<&9 1>&8 2>&7 9>&- 8>&- 7>&-'
esac) exec \$(q \"\$@\")\""
