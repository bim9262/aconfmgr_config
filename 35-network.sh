CreateLink /etc/resolv.conf /run/systemd/resolve/stub-resolv.conf

echo $HOSTNAME > "$(CreateFile /etc/hostname)"

cat > "$(CreateFile /etc/hosts)" <<EOF
#
# /etc/hosts: static lookup table for host names
#

#<ip-address>	<hostname.domain.org>	<hostname>
127.0.0.1	localhost.localdomain	localhost
::1		localhost.localdomain	localhost
127.0.0.1	$HOSTNAME.localdomain	$HOSTNAME
EOF

if [[ "$HOSTNAME" == bmalyn-tower ]]; then

    CopyFileTo "/$HOSTNAME/etc/systemd/network/20-wired.network" "/etc/systemd/network/20-wired.network"

    SystemdEnable systemd /usr/lib/systemd/system/systemd-networkd.service
    SystemdEnable systemd /usr/lib/systemd/system/systemd-networkd.socket
    SystemdEnable systemd /usr/lib/systemd/system/systemd-networkd-wait-online.service

elif [[ "$HOSTNAME" == bmalyn-yoga ]]; then

    AddPackage libmicrodns # Minimal mDNS resolver library
    AddPackage netctl # Profile based systemd network management
    AddPackage networkmanager # Network connection manager and user applications
    AddPackage --foreign networkmanager-dispatcher-chrony # Dispatcher Script for chrony

    SystemdEnable networkmanager /usr/lib/systemd/system/NetworkManager.service
    SystemdEnable networkmanager /usr/lib/systemd/system/NetworkManager-wait-online.service
    SystemdEnable networkmanager /usr/lib/systemd/system/NetworkManager-dispatcher.service

fi

CopyFile /etc/systemd/resolved.conf
SystemdEnable systemd /usr/lib/systemd/system/systemd-resolved.service
SystemdEnable avahi /usr/lib/systemd/system/avahi-daemon.service
SystemdEnable avahi /usr/lib/systemd/system/avahi-daemon.socket
