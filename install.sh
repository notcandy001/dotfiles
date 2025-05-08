#!/bin/bash
clear

repo="notcandy001/dotfiles"
download_folder="$HOME/.candy"

if [ ! -d $download_folder ]; then
    mkdir -p $download_folder
fi

get_latest_release() {
    curl --silent "https://api.github.com/repos/$repo/releases/latest" |
        grep '"tag_name":' |
        sed -E 's/.*"([^"]+)".*/\1/'
}

get_latest_zip() {
    curl --silent "https://api.github.com/repos/$repo/releases/latest" |
        grep '"zipball_url":' |
        sed -E 's/.*"([^"]+)".*/\1/'
}

_isInstalled() {
    package="$1"
    check="$(sudo pacman -Qs --color always "${package}" | grep "local" | grep "${package} ")"
    if [ -n "${check}" ]; then echo 0; return; fi
    echo 1; return
}

_checkCommandExists() {
    package="$1"
    if ! command -v $package >/dev/null; then return 1; else return 0; fi
}

_installPackages() {
    toInstall=()
    for pkg; do
        if [[ $(_isInstalled "${pkg}") == 0 ]]; then echo ":: ${pkg} is already installed."; continue; fi
        toInstall+=("${pkg}")
    done
    if [[ "${toInstall[@]}" == "" ]]; then return; fi
    printf "Installing packages:\n%s\n" "${toInstall[@]}"
    sudo pacman --noconfirm -S "${toInstall[@]}"
}

_installYay() {
    _installPackages "base-devel"
    SCRIPT=$(realpath "$0")
    temp_path=$(dirname "$SCRIPT")
    git clone https://aur.archlinux.org/yay.git $download_folder/yay
    cd $download_folder/yay
    makepkg -si --noconfirm
    cd $temp_path
    echo ":: yay has been installed successfully."
}

packages=("wget" "unzip" "gum" "rsync" "git" "curl" "rofi" "swaylock" "brightnessctl" "wl-clipboard" "grim" "kitty" "waybar" "neofetch" "thunar" "ranger")

aur_packages=("swww" "python-pywal" "cliphist")

echo -e "\033[0;32m"
cat <<"EOF"
   ____          _               _     
  / ___|__ _ ___| |__   ___  ___| |__  
 | |   / _` / __| '_ \ / _ \/ __| '_ \ 
 | |__| (_| \__ \ | | |  __/\__ \ | | |
  \____\__,_|___/_| |_|\___||___/_| |_|                                

EOF
echo "candy-dotfiles-ultimate auto-installer"
echo -e "\033[0m"

echo ":: Installing packages..."
sudo pacman -Sy
_installPackages "${packages[@]}"

if _checkCommandExists "yay"; then
    echo ":: yay already installed"
else
    echo ":: Installing yay..."
    _installYay
fi

echo ":: Installing AUR packages..."
yay -S --noconfirm "${aur_packages[@]}"

echo ":: Fetching latest dotfiles release..."
zip_url=$(get_latest_zip)
cd $download_folder
curl -L "$zip_url" -o dotfiles.zip
unzip dotfiles.zip -d $download_folder/temp
mv $download_folder/temp/* $download_folder/dotfiles

echo ":: Applying dotfiles..."
cp -r $download_folder/dotfiles/.config/* ~/.config/
cp -r $download_folder/dotfiles/wallpapers ~/Pictures/

echo ":: Applying theme and refreshing environment..."
wal -i ~/Pictures/wallpapers/default.jpg
killall waybar 2>/dev/null
waybar &

echo ":: Reloading Hyprland..."
hyprctl reload

echo
echo ":: candy-dotfiles-ultimate setup complete!"
