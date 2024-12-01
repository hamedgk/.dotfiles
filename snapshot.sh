cp -r /home/hamedgk/.config/{alacritty,sway,waybar} .config/
cp -r /opt/{github_token,grim} opt/
cp /home/hamedgk/.zshrc .
pacman -Qe > arch_repo_installed_apps.txt
pacman -Qm > user_repo_installed_apps.txt
