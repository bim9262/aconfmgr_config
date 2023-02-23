AddPackage --foreign arch-silence-grub-theme-git # Arch Silence - GRUB2 theme - GIT version
AddPackage --foreign wl-gammarelay-rs # Like wl-gammarelay, but written in rust, runs on a single thread, has three times less SLOC and uses DBus (for simplicity)
AddPackage efibootmgr # Linux user-space application to modify the EFI Boot Manager
AddPackage grub # GNU GRand Unified Bootloader (2)
AddPackage kernel-modules-hook # Keeps your system fully functional after a kernel upgrade
AddPackage linux # The Linux kernel and modules
AddPackage linux-firmware # Firmware files for Linux
AddPackage linux-headers # Headers and scripts for building modules for the Linux kernel
AddPackage linux-lts # The LTS Linux kernel and modules
AddPackage linux-lts-headers # Headers and scripts for building modules for the LTS Linux kernel
AddPackage virtualbox-host-dkms # VirtualBox Host kernel modules sources


if [[ "$HOSTNAME" == bmalyn-tower ]]; then

    AddPackage ddcutil # Query and change Linux monitor settings using DDC/CI and USB.
    AddPackage amd-ucode # Microcode update image for AMD CPUs
    AddPackage --foreign ddcci-driver-linux-dkms # A pair of Linux kernel drivers for DDC/CI monitors (DKMS)
    CopyFile /etc/modules-load.d/ddcci.conf

elif [[ "$HOSTNAME" == bmalyn-yoga ]]; then

   AddPackage intel-ucode # Microcode update files for Intel CPUs

fi

cat > "$(CreateFile /etc/default/grub)" <<EOF
# GRUB boot loader configuration

GRUB_DEFAULT="$GRUB_DEFAULT"
GRUB_TIMEOUT=10
GRUB_DISTRIBUTOR="Arch"
GRUB_CMDLINE_LINUX_DEFAULT="$GRUB_CMDLINE_LINUX_DEFAULT"
GRUB_CMDLINE_LINUX=""

# Preload both GPT and MBR modules so that they are not missed
GRUB_PRELOAD_MODULES="$GRUB_PRELOAD_MODULES"

# Uncomment to enable booting from LUKS encrypted devices
GRUB_ENABLE_CRYPTODISK=$GRUB_ENABLE_CRYPTODISK

# Set to 'countdown' or 'hidden' to change timeout behavior,
# press ESC key to display menu.
GRUB_TIMEOUT_STYLE=menu

# Uncomment to use basic console
GRUB_TERMINAL_INPUT=console

# Uncomment to disable graphical terminal
#GRUB_TERMINAL_OUTPUT=console

# The resolution used on graphical terminal
# note that you can use only modes which your graphic card supports via VBE
# you can see them in real GRUB with the command \`videoinfo'
GRUB_GFXMODE=auto

# Uncomment to allow the kernel use the same resolution used by grub
GRUB_GFXPAYLOAD_LINUX=keep

# Uncomment if you want GRUB to pass to the Linux kernel the old parameter
# format "root=/dev/xxx" instead of "root=/dev/disk/by-uuid/xxx"
#GRUB_DISABLE_LINUX_UUID=true

# Uncomment to disable generation of recovery mode menu entries
GRUB_DISABLE_RECOVERY=true

# Uncomment and set to the desired menu colors.  Used by normal and wallpaper
# modes only.  Entries specified as foreground/background.
#GRUB_COLOR_NORMAL="light-blue/black"
#GRUB_COLOR_HIGHLIGHT="light-cyan/blue"

# Uncomment one of them for the gfx desired, a image background or a gfxtheme
#GRUB_BACKGROUND="/path/to/wallpaper"
GRUB_THEME="/boot/grub/themes/arch-silence/theme.txt"

# Uncomment to get a beep at GRUB start
#GRUB_INIT_TUNE="480 440 1"

# Uncomment to make GRUB remember the last selection. This requires
# setting 'GRUB_DEFAULT=saved' above.
#GRUB_SAVEDEFAULT=true

# Uncomment to disable submenus in boot menu
GRUB_DISABLE_SUBMENU=y

GRUB_DISABLE_OS_PROBER=false
EOF

f=$(GetPackageOriginalFile mkinitcpio /etc/mkinitcpio.conf)
set_variable "MODULES" "=" "$MODULES" "$f"
set_variable "HOOKS" "=" "$HOOKS" "$f"
