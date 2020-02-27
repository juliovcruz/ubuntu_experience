# DEPOIS DE RODAR O SCRIPT

## Font FiraCode

    sudo add-apt-repository universe
    sudo apt install fonts-firacode

Colocar a fonte nas preferências do terminal.

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

# VSCODE

## PLUGINS VSCODE

    Dracula
    Material Icon Theme

## SETTINGS VSCODE

{
    "editor.fontFamily": "'Fira Code'",
    "editor.fontLigatures": true,
    "workbench.colorTheme": "Dracula",
    "workbench.iconTheme": "material-icon-theme",
    "window.doubleClickIconToClose": true,
    "window.titleBarStyle": "custom",
    "terminal.integrated.shell.osx": "/bin/zsh"
}

