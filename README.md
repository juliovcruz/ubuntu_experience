# Ubuntu Experience

1º - Baixar "ubuntuReinstall.sh"

2º - chmod +x ubuntuReinstall.sh

3º - Rodar script no terminal

4º - Esperar

# Tema Dracula no Terminal

## Instalar o Terminal zsh

    sudo apt install zsh
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  Para torná-lo padrão:
  
    chsh -s $(which zsh)

Necessário reiniciar o sistema para manter a alteração.

## Font FiraCode

    sudo add-apt-repository universe
    sudo apt install fonts-firacode

Colocar a fonte nas preferências do terminal.

## Instalar as Cores do Dracula

    sudo apt-get install dconf-cli
    git clone https://github.com/dracula/gnome-terminal
    cd gnome-terminal
    ./install.sh

## Instalar o tema Spaceship

    npm install -g spaceship-prompt

Dentro de *"~/.zshrc"*, alterar *"ZSH_THEME"* para *"spaceship"*

Depois reinicie o terminal.

## Plugins

    sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"

Adicionar no final de *"~./zshrc"*:

    zinit light zdharma/fast-syntax-highlighting
    zinit light zsh-users/zsh-autosuggestions
    zinit light zsh-users/zsh-completions

## Configuração do Spaceship

Adicionar no final do arquivo *"~./zshrc"*

    SPACESHIP_PROMPT_ORDER=(
    user          
    host          
    dir           
    git           
    exec_time     
    vi_mode       
    jobs          
    exit_code     
    char          
    )
    SPACESHIP_USER_SHOW=always
    SPACESHIP_PROMPT_ADD_NEWLINE=false
    SPACESHIP_CHAR_SYMBOL="❯"
    SPACESHIP_CHAR_SUFFIX=" "


## Zsh no VSCode
Adicionar no settings.json do VSCode:

    "terminal.integrated.shell.osx": "/bin/zsh"
