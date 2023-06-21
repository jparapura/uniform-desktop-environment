#
# ~/.bashrc
#

# if not running interactively, don't do anything
[[ $- != *i* ]] && return

# turn on vi mode in terminal
set -o vi

# PS1='[\u@\h \W]\$ '
# PS1='$ '
PROMPT_COMMAND=__prompt_command   # Function to generate PS1 after CMDs
__prompt_command() {
    local exit="$?"
    PS1=""

    local RCol='\[\e[0m\]'
    local Red='\[\e[0;91m\]'

    [[ $exit != 0 ]] && PS1+="${Red}${exit}${RCol} "
    # PS1+="\W > "
    PS1+="\W $ "
    # PS1+="$ "
    # PS1+="[jp@\h \W]\$ "
    # PS1+="[\u@\h \W]\$ "
}

export PATH=${PATH}:/home/${LOGNAME}/.local/bin:/home/${LOGNAME}/.config/tint2/scripts

# default programs:
export EDITOR="nvim"
export TERMINAL="alacritty"
export BROWSER="brave"

# declutter home directory
export XDG_DATA_HOME=${XDG_DATA_HOME:="$HOME/.local/share"}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:="$HOME/.cache"}
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:="$HOME/.config"}
export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority"
export LESSHISTFILE="-"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export HISTFILE="$XDG_DATA_HOME/bash/history"
export WGETRC="$XDG_CONFIG_HOME/wgetrc"
export PYTHONSTARTUP="$XDG_CONFIG_HOME/pythonrc"

if [ -f ${XDG_CONFIG_HOME}/shell/aliasrc ]; then
    source ${XDG_CONFIG_HOME}/shell/aliasrc
fi

# Set up Node Version Manager
source /usr/share/nvm/init-nvm.sh

# shortcut functions
# TODO add all important folders
# TODO paths to separate variable
se() { du -a ~/.local/bin ~/.config/{fontconfig,ghci,git,i3,i3status,shell,sxhkd,tmux,qutebrowser,X11,zathura} ~/.local/src/{dmenu,dwm,slock,st}/*.{c,h} | awk '{print $2}' | fzf | xargs -or $EDITOR ;}
docf() { du -a /home/me/office/docs/college/ | awk '{print $2}' | grep .pdf | fzf | (xargs -r zathura &) ;}
hwf() { c "$(find /home/me/homework/{asd1,asd2,iasd,ip,mn,p2,pf,pn,pwww,python,pz,rps,sem-kogni,to,zwpa} -type d | grep -v '.git\|venv\|lib\|bin\|node_modules\|build\|gradle\|share' | fzf)" ;}
# TODO to jest w osobnym skrypcie w ~/.local/bin, stąd trzeba to usunąć
getConfigFiles() { du -a /home/me/.local/bin /home/me/.config/{fontconfig,ghci,git,shell,sxhkd,tmux,qutebrowser,X11,zathura} /home/me/.local/src/{dmenu,dwm,slock,st}/*.{c,h} | awk '{print $2}' ;}

# for reloading .vimrc with keyboard shortcut
# TODO change this path
# export MYVIMRC="~/.vimrc"
# export MYVIMRC="~/.config/nvim/init.lua"
export MYVIMRC="~/.config/nvim/init.vim"

# polish LC_NUMERIC sometimes causes printf to print "invalid number"
export LC_NUMERIC="en_US.UTF-8"

# setup for googletest
export GTEST_HOME=~/usr/gtest
export LD_LIBRARY_PATH=$GTEST_HOME/lib:$LD_LIBRARY_PATH

# alias c="cd $1; ls"

# temporary solution for programs that don't follow
# XDG Base Directory Specification or I don't have
# patience to make them save their files in the proper 
# directory
${HOME}/.local/bin/clear_home_dir.sh

# commands written with space at the beginning are not saved in history
export HISTCONTROL="ignorespace"

# fix for Android Studio showing up as a blank window
export _JAVA_AWT_WM_NONREPARENTING=1


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"


# pomodoro timer CLI by totanya24
[[ -s "$HOME/.local/bin/pomo.sh" ]] && source "$HOME/.local/bin/pomo.sh"


function c() {
    if [ $# -ne 1 ]; then
        echo "Usage: c <directory name>"
        exit 1
        # TODO incorrect use causes st to terminate
    fi
    cd $1 && ls
}

function mcdir() {
    if [ $# -ne 1 ]; then
        echo "Usage: mcdir <directory name>"
        exit 1
    fi
    mkdir -p $1 && cd $_
}

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/usr/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/usr/etc/profile.d/conda.sh" ]; then
        . "/usr/etc/profile.d/conda.sh"
    else
        export PATH="/usr/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

