#!/usr/bin/env bash
# ----------------------------- VARIÁVEIS ----------------------------- #

DIRETORIO_DOWNLOADS="$HOME/Downloads/programas"

PROGRAMAS_APT=(
  snapd
  flameshot
  default-jre  
  default-jdk
  git
  yarn
  nodejs
  zsh
  dconf-cli
  brave-browser
  brave-browser-nightly
  vpnc
  network-manager-vpnc
  network-manager-vpnc-gnome
  maven
)

PROGRAMAS_SNAP=(
    spotify
    code
    insomnia
    postman
    vlc
    slack
)

sudo apt update -y

## Adicionando repositórios ##

sudo apt-add-repository "$PPA_GRAPHICS_DRIVERS" -y
sudo add-apt-repository ppa:papirus/papirus

## -----

sudo apt-get install curl
curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
curl -fsSLo /usr/share/keyrings/brave-browser-nightly-archive-keyring.gpg https://brave-browser-apt-nightly.s3.brave.com/brave-browser-nightly-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
echo "deb [signed-by=/usr/share/keyrings/brave-browser-nightly-archive-keyring.gpg arch=amd64] https://brave-browser-apt-nightly.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-nightly.list

sudo apt update -y

## Download e instalaçao de programas externos ##
# mkdir "$DIRETORIO_DOWNLOADS"

## Instalando pacotes .deb dos programas externos##
# sudo dpkg -i $DIRETORIO_DOWNLOADS/*.deb

# Instalar programas no apt
for nome_do_programa in ${PROGRAMAS_APT[@]}; do
  if ! dpkg -l | grep -q $nome_do_programa; then 
    echo "[INSTALANDO] - $nome_do_programa"
    sudo apt-get install "$nome_do_programa" -y
  else
    echo "[JA INSTALADO] - $nome_do_programa"
  fi
done

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

sudo apt update && sudo apt dist-upgrade -y
sudo apt autoclean
sudo apt autoremove -y

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
chsh -s $(which zsh)

git clone https://github.com/dracula/gnome-terminal
cd gnome-terminal
./install.sh

echo "INSTALACAO COMPLETA"

cd ..
code AFTER.md
