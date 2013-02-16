#!/bin/bash
/usr/bin/gnome-screensaver-command -l
echo "/status away" > ~/.mcabber/mcabber.fifo
/usr/bin/mpc pause
