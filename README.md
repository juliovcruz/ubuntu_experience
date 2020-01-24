# Ubuntu Experience

1º - Baixar "ubuntuReinstall.sh"
2º - Rodar script no terminal
3º - Esperar

# Tema Dracula no Terminal

## Instalar o Terminal zsh

    sudo apt install zsh
    $ sh -c "$(curl -fsSL [https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh](https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh))"
  Para torná-lo padrão:
  
    chsh -s $(which zsh)

Necessário reiniciar o sistema para manter a alteração.

## Font FiraCode

    sudo apd-apt-repository universe
    sudo apt install fonts-firacode
Colocar a fonte nas preferências do terminal.
## Instalar as Cores do Dracula

    sudo apt-get install dconf-cli
    git clone https://github.com/dracula/gnome-terminal
    cd gnome-terminal
    ./install.sh

## Instalar o tema Spaceship

    git clone [https://github.com/denysdovhan/spaceship-prompt.git](https://github.com/denysdovhan/spaceship-prompt.git) "$ZSH_CUSTOM/themes/spaceship-prompt"
    ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
Dentro de *"~/.zshrc"*, alterar *"ZSH_THEME"* para *"spaceship"*

Depois reinicie o terminal.

## Plugins

    sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"
Copiar o ./zshrc do repositório ou ...
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
