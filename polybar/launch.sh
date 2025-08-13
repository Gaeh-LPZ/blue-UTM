#!/usr/bin/env bash

# Kill other instances if exist
pkill polybar

# Launch bars

# Left bar
polybar left -c ~/.config/polybar/config.ini &

# Center bar
polybar center -c ~/.config/polybar/config.ini &

# Right bar
polybar right -c ~/.config/polybar/config.ini
