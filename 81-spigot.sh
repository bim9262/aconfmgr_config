if [[ "$HOSTNAME" == bmalyn-tower ]]; then

    AddPackage --foreign spigot # High performance Minecraft server implementation

    CopyFile /etc/conf.d/spigot

    SystemdEnable spigot /usr/lib/systemd/system/spigot-backup.timer
    SystemdEnable spigot /usr/lib/systemd/system/spigot.service

fi
