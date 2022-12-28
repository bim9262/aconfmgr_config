CopyFile /etc/fail2ban/jail.local
CopyFile /etc/nsswitch.conf
CopyFile /etc/profile.d/homepath.sh
CopyFile /etc/sudoers.d/bmalyn 440
CopyFile /etc/sysctl.d/90-override.conf
CopyFile /etc/udev/rules.d/51-garmin-usb.rules
CopyFile /etc/udev/rules.d/60-cm-rgb.rules
CopyFile /etc/zsh/zshenv


GetPackageOriginalFile util-linux /etc/pam.d/login > /dev/null
GetPackageOriginalFile shadow /etc/pam.d/passwd > /dev/null
GetPackageOriginalFile openssh /etc/pam.d/sshd > /dev/null
cat <<EOF | aug
ins 01 after "/files/etc/pam.d/login/*[type = 'auth'][module = 'system-local-login']"
set /files/etc/pam.d/login/01/type auth
set /files/etc/pam.d/login/01/control optional
set /files/etc/pam.d/login/01/module pam_gnome_keyring.so

ins 02 after "/files/etc/pam.d/login/*[type = 'session'][module = 'system-local-login']"
set /files/etc/pam.d/login/02/type session
set /files/etc/pam.d/login/02/control optional
set /files/etc/pam.d/login/02/module pam_gnome_keyring.so
set /files/etc/pam.d/login/02/argument auto_start

ins 03 after "/files/etc/pam.d/passwd/*[type = 'password'][module = 'pam_unix.so']"
set /files/etc/pam.d/passwd/03/type password
set /files/etc/pam.d/passwd/03/control optional
set /files/etc/pam.d/passwd/03/module pam_gnome_keyring.so

ins 04 before "/files/etc/pam.d/sshd/*[type = 'auth'][module = 'system-remote-login']"
set /files/etc/pam.d/sshd/04/type auth
set /files/etc/pam.d/sshd/04/control required
set /files/etc/pam.d/sshd/04/module pam_google_authenticator.so
set /files/etc/pam.d/sshd/04/argument no_increment_hotp

save
EOF


f="$(GetPackageOriginalFile ly-reloaded-git /etc/ly/config.ini)"
sed -ri "s/^#(animate = true|animation|blank_password = true)/\1/g" "$f"
set_variable "animation" "=" "1" "$f"

f="$(GetPackageOriginalFile pacman /etc/makepkg.conf)"
sed -ri "s/^#(MAKEFLAGS)/\1/g" "$f"
set_variable "MAKEFLAGS" "=" '"-j$(nproc)"' "$f"
set_variable "INTEGRITY_CHECK" "=" "(sha256 sha512 b2)" "$f"


f="$(GetPackageOriginalFile pacman /etc/pacman.conf)"
sed -ri "s/^#(Color)/\1\nILoveCandy/g" "$f"
sed -ri "s/^#(VerbosePkgLists|ParallelDownloads)/\1/g" "$f"
sed -ri "s#(\[(core|extra|community)\])#\1\nInclude  = /etc/pacman.d/pacserve#g" "$f"


cat >> "$(GetPackageOriginalFile openssh /etc/ssh/sshd_config)" <<EOF
StreamLocalBindUnlink yes
EOF

cat >> "$(GetPackageOriginalFile vim-runtime /etc/vimrc)" <<EOF
set mouse=
set ttymouse=
EOF

f="$(GetPackageOriginalFile reflector /etc/xdg/reflector/reflector.conf)"
sed -ri "s/^# (--country).*/\1 US/g" "$f"
sed -ri "s/^(--sort).*/\1 score/g" "$f"

cat >> "$(GetPackageOriginalFile zeronet-git /etc/zeronet.conf)" <<EOF
fileserver_port = $ZERONET_FILESERVER_PORT
EOF



# These are just the default files, that we don't modify
GetPackageOriginalFile pambase /etc/pam.d/system-auth > /dev/null
GetPackageOriginalFile sudo /etc/sudoers > /dev/null

