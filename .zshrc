# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="/Users/tjohnson/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="mm/dd/yyyy"
plugins=(git docker node npm brew osx zsh-syntax-highlighting zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# ALIASES
## Terminal
alias ll="ls -alFG"
alias cls="clear && printf '\e[3J' && echo ~~~~~~~~~~~~~~~ CLEARED ~~~~~~~~~~~~~~~"
alias loadbash="source ~/.bashrc && echo ~~~~~~~~~~~~~~~ BASH CONFIG LOADED ~~~~~~~~~~~~~~~"
alias loadzsh="source ~/.zshrc && echo ~~~~~~~~~~~~~~~ ZSH CONFIG LOADED ~~~~~~~~~~~~~~~"
alias rm="rm -i"
alias mv="mv -i"
alias cp="cp -i"
alias editbashrc="code ~/.bashrc"
alias editzshrc="code ~/.zshrc"
alias viewzshrc="cat ~/.zshrc"
alias viewbashrc="cat ~/.bashrc"
alias hs='history | grep'
alias myip="curl http://ipecho.net/plain; echo"
alias -s {yml,yaml}=vim


## Git
alias g="git"
alias ga="git add ."
alias gac="git add . && git commit -a -m "
alias gum="git pull upstream master"

## Docker
alias d="docker"
alias dm=docker-machine
alias dc="docker-compose"
alias dprune="docker system prune -a"
alias dcont="docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)"
alias dimg="docker rmi $(docker images -a -q)"
alias dnuke="dcont && dimg & dprune"


## Functions
# Take a screenshot every n seconds
# Fun for making timelapse gifs later
# run `creep 20` for every 20 seconds
function creep() {
    while :; do; echo "📸" $(date +%H:%M:%S); screencapture -x ~/Screenshots/wes/$(date +%s).png; sleep $1; done
}

function zource(){
  source ~/.zshrc && -
}

# Other
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
[[ /usr/local/bin/kubectl ]] && source <(kubectl completion zsh)
