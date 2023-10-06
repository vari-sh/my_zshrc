# Author: vari.sh

######## COLORS #########

NOCOLOR='\033[0m'
RED='\033[0;31m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHTGRAY='\033[0;37m'
DARKGRAY='\033[1;30m'
LIGHTRED='\033[1;31m'
LIGHTGREEN='\033[1;32m'
YELLOW='\033[1;33m'
LIGHTBLUE='\033[1;34m'
LIGHTPURPLE='\033[1;35m'
LIGHTCYAN='\033[1;36m'
WHITE='\033[1;37m'

######## PATH ##########

export PATH=$PATH:/usr/local/go/bin # ...

######## PLUGINS ##########

plugins=(
    git
    zsh-syntax-highlighting
    zsh-autosuggestions
    virtualenv
)

######### SOURCES ##########

export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

############# GIT #############

autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git svn
precmd() {
    vcs_info
}
setopt prompt_subst

branch=$'\uf418'
gitlogo=$'\uf09b'
chevron=$'\uf054'
dir=$'\uf413'
gitdir=$'\ue5fd'

zstyle ':vcs_info:*' get-revision true
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' stagedstr '\ue3e3'
zstyle ':vcs_info:*' unstagedstr '\ue3d7'
zstyle ':vcs_info:git*' formats "%B%F{blue}[%F{cyan}$gitlogo %b $branch %m%u%c %{$reset_color%}%B%F{blue}]%B%F{green}"

function github_info {
    [ -d .git ] && echo $vcs_info_msg_0_
}

########## VIRTUALENV ##########

iconpython=$'\ue235'

export VIRTUAL_ENV_DISABLE_PROMPT=yes

function virtualenv_info { 
    [ $VIRTUAL_ENV ] && echo '%B%F{blue}[%F{green}'$iconpython `basename $VIRTUAL_ENV`'%B%F{blue}]%B%F{green}'
}

########## ALIASES ##############

alias reload="source ~/.zshrc"
# ...

########## UTILS ###########

# hide EOL sign ('%')
PROMPT_EOL_MARK=""

########## PROMPT ##############

user=$'\uf21b'
folder=$'\uea83'
pc=$'\uf109'

PROMPT=$'%B%F{green}╭───%B%F{blue}[%B%F{magenta} $user %n %B%F{blue}|%B%F{magenta} $pc %M %F{blue}]%B%F{green}──%F{blue}[%F{yellow} $folder %(5~|%-1~/…/%3~|%4~)%F{blue}]%{$reset_color%}$(github_info)$(virtualenv_info)\n%B%F{green}╰─%(?.%b%F{blue}$chevron.%b%F{red}$chevron) ' 
RPROMPT=$'%B%F{blue}[%b%F{cyan} %D{%Y-%m-%d} %t %B%F{blue}]'

###############################
