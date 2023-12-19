#!/bin/bash

pacman -S --noconfirm polybar
mkdir /home/rjn/.config/polybar
cp launch.sh /home/rjn/.config/polybar/launch.sh
cp config.ini /home/rjn/.config/polybar/config.ini