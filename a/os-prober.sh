#!/bin/bash

echo "GRUB_DISABLE_OS_PROBER=false" >> /etc/default/grub
os-prober
grub-mkconfig -o /boot/grub/grub.cfg
