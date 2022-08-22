export WAYLAND_DESKTOP
systemctl --user set-environment XDG_CURRENT_DESKTOP=sway
systemctl --user import-environment XDG_CURRENT_DESKTOP WAYLAND_DISPLAY
