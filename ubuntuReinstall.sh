#!/usr/bin/env bash
# ----------------------------- VARIÁVEIS ----------------------------- #
PPA_GRAPHICS_DRIVERS="ppa:graphics-drivers/ppa"

URL_GOOGLE_CHROME="https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"

DIRETORIO_DOWNLOADS="$HOME/Downloads/programas"

PROGRAMAS_APT=(
  snapd
  flameshot
  papirus-icon-theme
  papirus-folders
  gnome-tweaks
  filezilla
  putty
  default-jre  
  default-jdk
  lxqt-sudo
  alacarte
  git
  yarn
  nodejs
  zsh
  dconf-cli
)

PROGRAMAS_SNAP=(
    spotify
    code
    eclipse
    insomnia
)

sudo apt update -y

## Adicionando repositórios ##

sudo apt-add-repository "$PPA_GRAPHICS_DRIVERS" -y
sudo add-apt-repository ppa:papirus/papirus

## -----

sudo apt-get install curl
curl -sL https://deb.nodesource.com/setup_13.x | sudo -E bash -
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

sudo apt update -y

## Download e instalaçao de programas externos ##
mkdir "$DIRETORIO_DOWNLOADS"

if ! google-chrome --version; then
    wget -c "$URL_GOOGLE_CHROME"       -P "$DIRETORIO_DOWNLOADS"
fi

## Instalando pacotes .deb dos programas externos##
sudo dpkg -i $DIRETORIO_DOWNLOADS/*.deb

# Instalar programas no apt
for nome_do_programa in ${PROGRAMAS_APT[@]}; do
  if ! dpkg -l | grep -q $nome_do_programa; then 
    echo "[INSTALANDO] - $nome_do_programa"
    sudo apt-get install "$nome_do_programa" -y
  else
    echo "[JA INSTALADO] - $nome_do_programa"
  fi
done

## Icons
papirus-folders -C red --theme Papirus-Dark
##

## Instalando pacotes Snap ##

for nome_do_programa in ${PROGRAMAS_SNAP[@]}; do
  if ! dpkg -l | grep -q $nome_do_programa; then 
    echo "[JA INSTALADO] - $nome_do_programa"
    sudo snap install "$nome_do_programa"
    sudo snap install "$nome_do_programa" --classic
  else
    echo "[INSTALADO] - $nome_do_programa"
  fi
done

# ---------------------------------------------------------------------- #

#Retira PrintScreen Key
gsettings set org.gnome.settings-daemon.plugins.media-keys screenshot ''
gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "`gsettings get org.gnome.settings-daemon.plugins.media-keys custom-keybindings | sed -e"s>'\]>','/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/']>"| sed -e"s>@as \[\]>['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/']>"`"

#ADICIONA FLAMESHOT NA PRINTSCREEN
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ name 'FlameShot'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ command '/usr/bin/flameshot gui'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ binding 'Print'

sudo apt update && sudo apt dist-upgrade -y
sudo apt autoclean
sudo apt autoremove -y

gsettings set org.gnome.desktop.interface icon-theme "Papirus-Dark"
gsettings set org.gnome.desktop.interface gtk-theme "Yaru-dark"
gsettings set org.gnome.desktop.interface cursor-theme "DMZ-White"

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
chsh -s $(which zsh)

git clone https://github.com/dracula/gnome-terminal
cd gnome-terminal
./install.sh

echo "INSTALACAO COMPLETA"

cd ..
code AFTER.md
