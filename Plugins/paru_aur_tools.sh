#!/bin/bash

su rjn -c "git clone https://aur.archlinux.org/paru.git"
su rjn -c "cd paru"
su rjn -c "makepkg -si"

