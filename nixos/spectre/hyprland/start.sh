#!/usr/bin/env bash

swww init &
swww img ~/nixconfig/wallpapers/wallpaper

nm-applet --indicator &

waybar

dunst
