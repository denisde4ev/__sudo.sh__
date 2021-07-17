#!/bin/sh
q(){ for i;do printf %s "$i"|sed "s/'/'\\\\''/g;1s/^/'/;\$s/\$/' /";done;}
eval "$([ "$1" = -S ]&&echo 'shift;su -c "'||echo '9<&0 8>&1 7>&2 0</dev/tty 1>/dev/tty 2>/dev/tty su -c "0<&9 1>&8 2>&7 9>&- 8>&- 7>&-') \$(q \"\$@\")\""
