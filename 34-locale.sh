echo LANG=$LOCALE > "$(CreateFile /etc/locale.conf)"
sed -i "s/^#\($LOCALE\)/\1/g" $(GetPackageOriginalFile glibc /etc/locale.gen)