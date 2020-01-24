#!/usr/bin/env bash
# ----------------------------- VARIÁVEIS ----------------------------- #
PPA_GRAPHICS_DRIVERS="ppa:graphics-drivers/ppa"

URL_GOOGLE_CHROME="https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
URL_GITKRAKEN="https://release.gitkraken.com/linux/gitkraken-amd64.deb
sudo dpkg -i gitkraken-amd64.deb"

DIRETORIO_DOWNLOADS="$HOME/Downloads/programas"

PROGRAMAS_APT=(
  snapd
  flameshot
  papirus-icon-theme
  papirus-folders
  gnome-tweak
  filezilla
  putty
  default-jre  
  default-jdk
  lxqt-sudo
  alacarte
  git
  yarn
  nodejs
)

PROGRAMAS_SNAP=(
    spotify
    code
    notepad-plus-plus
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
wget -c "$URL_GOOGLE_CHROME"       -P "$DIRETORIO_DOWNLOADS"
wget -c "$URL_GITKRAKEN"       -P "$DIRETORIO_DOWNLOADS"

## Instalando pacotes .deb dos programas externos##
sudo dpkg -i $DIRETORIO_DOWNLOADS/*.deb

# Instalar programas no apt
for nome_do_programa in ${PROGRAMAS_APT[@]}; do
  if ! dpkg -l | grep -q $nome_do_programa; then 
    apt-get install "$nome_do_programa" -y
  else
    echo "[INSTALADO] - $nome_do_programa"
  fi
done

## Icons
papirus-folders -C red --theme Papirus-Dark
##

## Instalando pacotes Snap ##

for nome_do_programa in ${PROGRAMAS_SNAP[@]}; do
  if ! dpkg -l | grep -q $nome_do_programa; then 
    snap install "$nome_do_programa"
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


echo "INSTALACAO COMPLETA -- Colocar Thema de Icones: Papirus-Dark"
