if [[ "$HOSTNAME" == bmalyn-tower ]]; then

    AddPackage apcupsd # Power mangement and controlling most of APC's UPS models

    cat > "$(CreateFile /etc/apcupsd/config)" <<EOF
APCUPSD_MAIL="sendmail"
SYSADMIN="$EMAIL"
EOF

    SystemdEnable apcupsd /usr/lib/systemd/system/apcupsd.service

fi
