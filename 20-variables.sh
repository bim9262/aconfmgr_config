LOCALE=en_US.UTF-8

BMALYN_UID=1000
BMALYN_GID=1000
BMALYN_HOME=/home/bmalyn

if [[ "$HOSTNAME" == bmalyn-tower ]]; then
    GRUB_DEFAULT='gnulinux-linux-advanced-cbf3b9ac-06bb-4993-b2bc-ba9997521d12'
    GRUB_CMDLINE_LINUX_DEFAULT="loglevel=3 quiet splash vt.global_cursor_default=0"
    GRUB_PRELOAD_MODULES="part_gpt part_msdos"
    GRUB_ENABLE_CRYPTODISK=n
    MODULES="(dm-mod raid1)"
    HOOKS="(base udev plymouth autodetect modconf block mdadm_udev lvm2 filesystems keyboard fsck)"
    ZERONET_FILESERVER_PORT=33869
elif [[ "$HOSTNAME" == bmalyn-yoga ]]; then
    GRUB_DEFAULT="gnulinux-linux-advanced-88373b61-cccb-47a6-a2e4-c4b0b3faa8bf"
    GRUB_CMDLINE_LINUX_DEFAULT="quiet splash loglevel=3 rd.udev.log_priority=3 vt.global_cursor_default=0 modprobe.blacklist=i2c_hid hpet=disable cryptdevice=UUID=1582acf6-f5f6-4840-9bbd-49798ecb169a:cryptolvm root=/dev/mapper/m2-root--arch resume=/dev/mapper/m2-swap"
    GRUB_PRELOAD_MODULES="part_gpt part_msdos lvm"
    GRUB_ENABLE_CRYPTODISK=y
    MODULES="(i915)"
    HOOKS="(base udev plymouth autodetect modconf keyboard keymap block plymouth-encrypt lvm2 resume filesystems fsck)"
    ZERONET_FILESERVER_PORT=34622
fi
