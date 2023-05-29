#/bin/bash

pacman -S --noconfirm tlp tlp-rdw

#禁用usb挂起
echo "USB_AUTOSUSPEND=0" >> /etc/tlp.conf
systemctl enable --now tlp
systemctl enable --now NetworkManager-dispatcher.service

#ui   yay -S tlpui