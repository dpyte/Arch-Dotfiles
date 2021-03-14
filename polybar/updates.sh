 #!/bin/bash
if ! updates=$(checkupdates 2> /dev/null | wc -l); then
	updates=0
fi

if [ "$updates" -gt 1 ]; then
	echo "%{F#ff5555}  : $(($updates - 1)) %{F-}"
else
	echo " %{F#50fa7b}  :  %{F-}"
fi
