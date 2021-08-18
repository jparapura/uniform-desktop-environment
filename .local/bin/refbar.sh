# refreshes status bar
# every time it's called, status bar updates

#!/bin/bash

cd ~/.local/bin
kill $(<sleepPid)


#kill "$(pstree -lp | grep -- -dwmbar\([0-9] |sed "s/.*sleep(\([0-9]\+\)).*/\1/")"
