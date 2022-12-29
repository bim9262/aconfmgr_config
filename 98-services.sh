SystemdEnable --name getty@tty1.service systemd /usr/lib/systemd/system/getty@.service

SystemdEnable --type user gcr-4 /usr/lib/systemd/user/gcr-ssh-agent.socket
SystemdEnable --type user gnome-keyring /usr/lib/systemd/user/gnome-keyring-daemon.socket
SystemdEnable --type user p11-kit /usr/lib/systemd/user/p11-kit-server.socket
SystemdEnable --type user pipewire /usr/lib/systemd/user/pipewire.socket
SystemdEnable --type user pipewire-pulse /usr/lib/systemd/user/pipewire-pulse.socket
SystemdEnable --type user wireplumber /usr/lib/systemd/user/wireplumber.service
SystemdEnable --type user xdg-user-dirs /usr/lib/systemd/user/xdg-user-dirs-update.service

SystemdEnable fail2ban /usr/lib/systemd/system/fail2ban.service
SystemdEnable kernel-modules-hook /usr/lib/systemd/system/linux-modules-cleanup.service
SystemdEnable logrotate /usr/lib/systemd/system/logrotate.timer
SystemdEnable ly-reloaded-git /usr/lib/systemd/system/ly.service
SystemdEnable openssh /usr/lib/systemd/system/sshd.service
SystemdEnable pacserve /usr/lib/systemd/system/pacserve.service
SystemdEnable pcsclite /usr/lib/systemd/system/pcscd.socket
SystemdEnable smartmontools /usr/lib/systemd/system/smartd.service
SystemdEnable systemd /usr/lib/systemd/system/remote-fs.target
SystemdEnable upower /usr/lib/systemd/system/upower.service
SystemdEnable zeronet-git /usr/lib/systemd/system/zeronet.service

if [[ "$HOSTNAME" == bmalyn-tower ]]; then
    SystemdEnable octoprint-venv /usr/lib/systemd/system/octoprint.service
fi
