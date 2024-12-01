#!/bin/bash

cp -r /home/hamedgk/.config/{alacritty,sway,waybar} .config/
cp -r /opt/{github_token,grim} opt/

cp /home/hamedgk/.zshrc .

ARCH_REPO_PACKAGES_PATH='arch_repo_installed_apps.txt'
USER_REPO_PACKAGES_PATH='user_repo_installed_apps.txt'
DEPEENDANCY_PACKAGES_PATH='dependency_installed_apps.txt'

pacman -Qeq > $ARCH_REPO_PACKAGES_PATH
echo $ARCH_REPO_PACKAGES_PATH

pacman -Qmq > $USER_REPO_PACKAGES_PATH
echo $USER_REPO_PACKAGES_PATH

pacman -Qtdq > $DEPEENDANCY_PACKAGES_PATH
echo $DEPEENDANCY_PACKAGES_PATH

if [ -s $DEPEENDANCY_PACKAGES_PATH ]; then
	echo "info: $DEPEENDANCY_PACKAGES_PATH is not empty"
fi

