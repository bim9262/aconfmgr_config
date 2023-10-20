AddPackage --foreign bemoji-git # Emoji picker that remembers your favorites.
AddPackage --foreign i3status-rust-git # Very resourcefriendly and feature-rich replacement for i3status to use with bar programs (like i3bar and swaybar), written in pure Rust
AddPackage --foreign swaync-git # A simple notificaion daemon with a GTK panel for checking previous notifications like other DEs

AddPackage bemenu # Dynamic menu library and client program inspired by dmenu
AddPackage grim # Screenshot utility for Wayland
AddPackage pinentry-bemenu # Pinentry based on bemenu
AddPackage slurp # Select a region in a Wayland compositor
AddPackage sway # Tiling Wayland compositor and replacement for the i3 window manager
AddPackage swaybg # Wallpaper tool for Wayland compositors
AddPackage swayidle # Idle management daemon for Wayland
AddPackage swaylock # Screen locker for Wayland
AddPackage wayland-protocols # Specifications of extended Wayland protocols
AddPackage wl-clipboard # Command-line copy/paste utilities for Wayland
AddPackage wtype # xdotool type for wayland
AddPackage xclip # Command line interface to the X11 clipboard
AddPackage xdg-desktop-portal-wlr # xdg-desktop-portal backend for wlroots
AddPackage xorg-xrdb # X server resource database utility
AddPackage xorg-xwayland # run X clients under wayland
AddPackage xorgproto # combined X.Org X11 Protocol headers

if [[ "$HOSTNAME" == bmalyn-tower ]]; then


    AddPackage radeontop # View GPU utilization for total activity percent and individual blocks
    AddPackage vulkan-radeon # Radeon's Vulkan mesa driver
    AddPackage xf86-video-amdgpu # X.org amdgpu video driver
    AddPackage vulkan-icd-loader # Vulkan Installable Client Driver (ICD) Loader
    AddPackage mesa-vdpau # Mesa VDPAU drivers
    AddPackage vulkan-mesa-layers # Mesa's Vulkan layers
    AddPackage vulkan-tools # Vulkan Utilities and Tools
    AddPackage libva-mesa-driver # VA-API implementation for gallium
    AddPackage libva-vdpau-driver # VDPAU backend for VA API
    AddPackage vdpauinfo # Command line utility for querying the capabilities of a VDPAU device


elif [[ "$HOSTNAME" == bmalyn-yoga ]]; then

    AddPackage xf86-video-intel # X.org Intel i810/i830/i915/945G/G965+ video drivers
    AddPackage xf86-video-vesa # X.org vesa video driver

fi
