#!/bin/bash
[ "$1" = -S ]&&: 'shift\;su -c "'||: '9<&0 8>&1 7>&2 0</dev/tty 1>/dev/tty 2>/dev/tty su -c "0<&9 1>&8 2>&7 9>&- 8>&- 7>&-'
eval "echo $_\${*@Q}\""
