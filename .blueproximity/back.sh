#!/bin/bash
/usr/bin/gnome-screensaver-command -d
echo "/status avail" > ~/.mcabber/mcabber.fifo
~/bin/wakeup_screen
