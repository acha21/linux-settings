#!/bin/sh
xrandr --newmode "1920x1080_60.00+16htot"  173.00  1920 2048 2248 2592  1080 1083 1088 1120 -hsync +vsync
xrandr --output HDMI-1-1 --left-of eDP-1-1
xrandr --addmode HDMI-1-1 "1920x1080_60.00+16htot"
xrandr --output HDMI-1-1 --mode "1920x1080_60.00+16htot"
