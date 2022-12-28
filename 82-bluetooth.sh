if [[ "$HOSTNAME" == bmalyn-yoga ]]; then

    AddPackage blueman # GTK+ Bluetooth Manager
    AddPackage bluez-utils # Development and debugging utilities for the bluetooth protocol stack

    AddPackage --foreign bluez-firmware # Firmwares for Broadcom BCM203x and STLC2300 Bluetooth chips
    AddPackage --foreign bluez-hcitool # deprecated hcitool from bluez

    SystemdEnable bluez /usr/lib/systemd/system/bluetooth.service

    CopyFile /etc/polkit-1/rules.d/51-blueman.rules

fi