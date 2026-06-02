# If not running interactively, don't do anything (leave this at the top of this file)
[[ $- != *i* ]] && return

# All the default Omarchy aliases and functions
# (don't mess with these directly, just overwrite them here!)
source ~/.local/share/omarchy/default/bash/rc

alias gs="git status"
alias gp="git pull"
alias gcm="git commit -m"
alias ll="ls -alh"
alias sb="source ~/.bashrc"
alias eb="nvim ~/.bashrc"

export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:~/Applications
