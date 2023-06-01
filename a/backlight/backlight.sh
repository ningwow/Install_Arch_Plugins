#/bin/bash

mkdir /etc/acpi/handlers
cp events/backlight* /etc/acpi/events
cp handlers/* /etc/acpi/handlers/
systemctl enable --now acpid