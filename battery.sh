#!/bin/bash
st=$(cat /sys/class/power_supply/BAT0/capacity)
i=0
charge=$(cat /sys/class/power_supply/BAT0/charge_now)
sleep 10
if [ $st -le 15 ] && [ $(cat /sys/class/power_supply/BAT0/charge_now) -le $charge ]
then
         echo "Low"
         while true; do
            echo -ne '\007'
            if [ $i -eq 5 ]
            then
                    break
            fi
            i=$((i+1))
            XDG_RUNTIME_DIR=/run/user/$(id -u)  speaker-test -t sine -f 2000 -l 1
            sleep 0.5
            XDG_RUNTIME_DIR=/run/user/$(id -u)  speaker-test -t sine -f 1500 -l 1
            XDG_RUNTIME_DIR=/run/user/$(id -u)  notify-send "[!] BATTERY IS LOW!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
         done
#else
 #        echo "high"
fi
