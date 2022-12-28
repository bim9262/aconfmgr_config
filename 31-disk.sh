AddPackage lvm2 # Logical Volume Manager 2 utilities
AddPackage mdadm # A tool for managing/monitoring Linux md device arrays, also known as Software RAID

if [[ "$HOSTNAME" == bmalyn-tower ]]; then
    AddPackage --foreign raid-check-systemd # Raid data scrubbing script with systemd timer to be used with mdadm.


    cat >> "$(GetPackageOriginalFile mdadm /etc/mdadm.conf)" <<EOF
MAILADDR $EMAIL 
ARRAY /dev/md/efi  metadata=1.0 UUID=0cc18d97:5809e110:6ed55ef7:f6b8dba2 name=archiso:efi
ARRAY /dev/md/1  metadata=1.2 UUID=7191120f:19451463:4bd58487:76b35778 name=archiso:1
EOF


    SystemdEnable raid-check-systemd /usr/lib/systemd/system/raid-check.timer

fi

CopyDirTo "/$HOSTNAME/etc/lvm/archive" "/etc/lvm/archive" 600
CopyDirTo "/$HOSTNAME/etc/lvm/backup" "/etc/lvm/backup" 600

CopyFileTo "/$HOSTNAME/etc/fstab" "/etc/fstab"