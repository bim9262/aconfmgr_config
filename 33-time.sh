AddPackage chrony # Lightweight NTP client and server

CreateLink /etc/localtime /usr/share/zoneinfo/US/Central
SystemdEnable chrony /usr/lib/systemd/system/chronyd.service
