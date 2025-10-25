# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="comfyline"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git
zsh-autosuggestions
zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
#source ~/.oh-my-zsh/themes/comfyline_prompt/comfyline.zsh-theme
# source ~/.zshrc

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


# Keyboard detection
#TECLADO=`lsusb | grep 'KB'`

# if [[ -z $TECLADO ]]
# then
  # echo "us"
  # setxkbmap us
# else
  # echo "latam"
  # setxkbmap latam
# fi


# MY CONFIGS
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
typeset -g POWERLEVEL9K_INSTANT_PROMPT=off
# numlockx on
# ~/.zlogin
last_login=$(last -1 "$USER" | head -n 1 | awk '{print $4, $5, $6, $7, "on", $2}')
echo "Last login: $last_login\n"

#pfetch
#neofetch | lolcat

# VARIABLES
htdocs='/opt/lampp/htdocs'
gcoddev='/home/gcoddev'
#pgfiles='/var/lib/pgadmin/storage/geco.yak77_gmail.com'

# SCRIPTS
_wifi_conn_complete() {
    local cur prev opts
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    opts=$(nmcli -t -f ssid dev wifi list | cut -d ':' -f 2)

    # Si la palabra anterior es 'wifi-conn' y estamos en el primer argumento,
    # permitir la autocompletación sin dividir los nombres de red que contienen espacios.
    if [[ ${cur} == * && ${prev} == 'wifi-conn' && ${COMP_CWORD} -eq 1 ]] ; then
        local IFS=$'\n'  # Establecer el separador de campos interno para nombres de red con espacios
        COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
        return 0
    fi
}
complete -F _wifi_conn_complete wifi-conn


## [Completion]
## Completion scripts setup. Remove the following line to uninstall
[[ -f /home/gary/.dart-cli-completion/zsh-config.zsh ]] && . /home/gary/.dart-cli-completion/zsh-config.zsh || true
## [/Completion]

# PATHS
PATH=$PATH:/opt/lampp
#PATH=$PATH:/opt/lampp/bin
#PATH=$PATH:/lib/jvm/jdk-11.0.18/bin
#PATH=$PATH:~/.fly/bin
PATH=$PATH:~/.config/composer/vendor/bin
PATH=$PATH:~/.scripts
PATH=$PATH:~/.local/share/gem/ruby/3.3.0/bin
#PATH=$PATH:/opt/flutter/bin
PATH=$PATH:~/Android/Sdk/cmdline-tools/latest/bin
PATH=$PATH:~/Android/Sdk/platform-tools
PATH=$PATH:~/.config/bspwm/scripts
#source /usr/share/nvm/init-nvm.sh

PATH=$PATH:~/fvm/default/bin
#PATH=$PATH:~/.pub-cache/bin



# >>> pyenv initialization >>>
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

# Inicializa pyenv (habilita comandos como pyenv shell)
eval "$(pyenv init - zsh)"

# Si usás pyenv-virtualenv (opcional pero recomendado)
if which pyenv-virtualenv-init > /dev/null; then
  eval "$(pyenv virtualenv-init -)"
fi
# <<< pyenv initialization <<<

export CHROME_EXECUTABLE="/usr/bin/google-chrome-stable"
export ANDROID_HOME="~/Android/Sdk"
export FLYCTL_INSTALL="/home/gary/.fly"
export PATH="$FLYCTL_INSTALL/bin:$PATH"
export EDITOR=vim
export JAVA_HOME="/usr/lib/jvm/default"

export WINEESYNC=1
export WINEFSYNC=1
export WINEDEBUG=-all
# export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dsun.java2d.xrender=True'

# Postgresql
alias psql-start='sudo systemctl start postgresql.service && echo "Postgresql service started" && nohup ~/pgadmin4/bin/pgadmin4 &'
alias psql-stop='sudo systemctl stop postgresql.service && echo "Postgresql service stoped" && pkill pgadmin4'
alias psql-status='sudo systemctl status postgresql.service'
alias psql-restart='sudo systemctl restart postgresql.service'

#export GTK_THEME=Sweet-Ambar-Blue-Dark-v40

# Docker
alias docker-start='sudo systemctl start docker.socket docker.service'
alias docker-stop='sudo systemctl stop docker.service docker.socket'
alias docker-status='sudo systemctl status docker'
alias docker-restart='sudo systemctl restart docker'
alias docker-exec='docker exec -it -u $1 $2 bash'

# Mis alias
#alias clear='printf "\033[2J\033[3J\033[1;1H" && neofetch'
source $(dirname $(gem which colorls))/tab_complete.sh
alias ll='colorls --sd'
# alias ytdown='~/Music/.ytdown'
alias clear='clear && echo -e "Last login: $last_login"'
alias ip-get="ip route get 1.1.1.1 | awk '{print \$7}'"

#alias mysql='/opt/lampp/bin/mysql'
#alias set-php7='sudo xampp stop && sudo mv /opt/lampp /opt/lampp8 && sudo mv /opt/lampp7 /opt/lampp && sudo xampp start'
#alias set-php8='sudo xampp stop && sudo mv /opt/lampp /opt/lampp7 && sudo mv /opt/lampp8 /opt/lampp && sudo xampp start'
alias set-php7='sudo systemctl stop httpd mariadb && sudo /opt/lampp/xampp start'
alias set-php8='sudo /opt/lampp/xampp stop && sudo systemctl start httpd mariadb'
alias php-v='/opt/lampp/bin/php --version'

#alias sudo-sync='for ((i=0;i<10;i++)) do sudo sync && sudo sysctl -w vm.drop_caches=3 && sudo sync'
alias sudo-sync='sudo sync && sudo sysctl -w vm.drop_caches=3 && sudo sync'
alias off='shutdown -h now'
alias set-bright='brightnessctl set '
alias tux-mount='sudo mount -t ntfs-3g /dev/sda1 /home/Tux'
alias utux-mount='sudo umount /home/Tux'
alias service='sudo systemctl '
alias feh-random='feh --bg-fill ~/.pictures/$(($RANDOM % $( ls ~/.pictures | wc -l ))).jpg'
alias py='python'
alias netr='sudo systemctl restart NetworkManager.service'
alias pacman-syu='sudo pacman -Syu --noconfirm'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PHPVM_DIR="/home/gary/.phpvm"
export PATH="$PHPVM_DIR/bin:$PATH"
if [[ -s "$PHPVM_DIR/phpvm.sh" ]]; then
  source "$PHPVM_DIR/phpvm.sh"
fi
