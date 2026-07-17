# If not running interactively, don't do anything (leave this at the top of this file)
[[ $- != *i* ]] && return

<<<<<<< HEAD
# History control
shopt -s histappend
HISTCONTROL=ignoreboth
HISTSIZE=32768
HISTFILESIZE="${HISTSIZE}"
=======
# All the default Omarchy aliases and functions
# (don't mess with these directly, just overwrite them here!)
# source ~/.local/share/omarchy/default/bash/rc
>>>>>>> 73f86af37f9f49199c88a98038f281f5895f148f

# Autocompletion
if [[ ! -v BASH_COMPLETION_VERSINFO && -f /usr/share/bash-completion/bash_completion ]]; then
  source /usr/share/bash-completion/bash_completion
fi

# Ensure command hashing is off for mise
set +h

case "$TERM" in
    xterm-color|*-256color|tmux|tmux-256color) color_prompt=yes;;
esac

alias gs="git status"
alias gp="git pull"
alias gcm="git commit -m"
alias ll="ls -alh"
alias sb="source ~/.bashrc"
alias eb="nvim ~/.bashrc"

export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:~/Applications/scrcpy-linux-x86_64-v4.0/
export PATH=$PATH:~/Downloads/esptool-linux-aarch64/

# Automatically start tmux unless already in a tmux session
# Auto-attach to an existing session, or create a new one if none exists
if command -v tmux &>/dev/null && [ -z "$TMUX" ]; then
  tmux attach-session -t base || tmux new-session -s base
fi

alias alert='notify-send "Done" "Task finished!" && paplay /usr/share/sounds/Yaru/stereo/message.oga'
alias pyenv='source ~/Documents/venv/bin/activate'
