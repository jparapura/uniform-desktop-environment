# calculates and refreshes
# status bar information every minute

#!/bin/bash

delim=" "

get_time() {
    #echo $(date +"[%a %e.%m %H:%M]")
    echo $(date +"%H:%M")
}

battery() {
    amt="$(cat /sys/class/power_supply/BAT0/capacity)"

    #echo "btr=$amt%"
	if [ -z "$amt" ]
	then
		echo ""
	else
		echo "$amt%"
	fi
}

internet() {
    status=$(cat /sys/class/net/wlp3s0/operstate)
    if [[ $status = "up" ]]; then
        echo "web=on"
    else
        echo "web=off"
    fi
}

memory() {
    amt="$(printf %.0f $(free | awk '/^Pam/ {print $3 "/" $2 "*" 100}' | bc -l))"

    echo "mem=$amt%"
}


cpu_temp() {
    amt="$(printf $(sensors | awk '/^temp1/ {print $2}'))"

    echo "temp=$amt"
}

status2() {
    echo " pid=$1$delim$(internet)$delim$(memory)$delim$(cpu_temp)$delim$(battery)$delim$(get_time) "
}

status() {
	#echo " pid=$1$delim$(battery)$delim$(get_time) "
	echo "$(battery)$delim$(get_time)"
}

# TODO zrobić czytasnie liczby sekund po pierwszym uruchomienu
# i na podstawie tego ustawić sleep, żeby dokładniej znać godzinę

while :; do
    sleep 1m &
    pid=$!
    cd ~/.local/bin/
    echo "$pid" > sleepPid
    #xsetroot -name "$(status2 $pid)"   
    xsetroot -name "$(status)"   
    wait $pid
done
