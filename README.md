# Alarm battary

If you forgot to connect the power cable to your laptop and the battery is about to run out, the script will notify you about it.

```
crontab -e

*/1 * * * * /bin/bash /home/odity/bin/battery.sh
```
