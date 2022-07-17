# calculates and refreshes
# status bar information every minute

#!/bin/bash

delim=" "

current_time() {
    #display $(date +"[%a %e.%m %H:%M]")
    display $(date +"%H:%M")
}

battery() {
    amt="$(cat /sys/class/power_supply/BAT0/capacity)"

    #display "btr=$amt%"
    [ -z "$amt" ] && display ""
    [ ! -z "$amt" ] && display "$amt%"
}

internet() {
    status=$(cat /sys/class/net/wlp3s0/operstate)
    [[ $status = "up" ]] && display "web=on"
    [[ ! $status = "up" ]] && display "web=off"
}

memory_percentage() {
    amt="$(printf %.0f $(free | awk '/^Pam/ {print $3 "/" $2 "*" 100}' | bc -l))"

    display "mem=$amt%"
}

memory() {
    amt=$(free -h | awk '/^Pam/ {print $3}')

    display $amt
}


cpu_temp() {
    amt="$(printf $(sensors | awk '/^temp1/ {print $2}'))"

    display "temp=$amt"
}

add_to_statusbar() {
    $1
    [ -z $2 ] && display "$delim"
}

display() {
    echo -n "$1"
}

status() {
    add_to_statusbar memory
    add_to_statusbar battery
    add_to_statusbar current_time "end"
}

# TODO zrobić czytanie liczby sekund po pierwszym uruchomienu
# i na podstawie tego ustawić sleep, żeby dokładniej znać godzinę

while :; do
    sleep 1m &
    pid=$!
    cd ~/.local/bin/
    echo "$pid" > sleepPid
    xsetroot -name "$(status)"   
    wait $pid
done
