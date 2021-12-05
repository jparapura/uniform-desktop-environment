#
# ~/.bashrc
#

# if not running interactively, don't do anything
[[ $- != *i* ]] && return

# turn on vi mode in terminal
set -o vi

# PS1='[\u@\h \W]\$ '
# PS1='$ '
PROMPT_COMMAND=__prompt_command    			# Function to generate PS1 after CMDs
__prompt_command() {
	local exit="$?"
	PS1=""

	local RCol='\[\e[0m\]'
	local Red='\[\e[0;91m\]'

	[[ $exit != 0 ]] && PS1+="${Red}${exit}${RCol} "
	PS1+="$ "
}

export PATH=${PATH}:/home/${LOGNAME}/.local/bin

# default programs:
export EDITOR="vim"
export TERMINAL="st"
export BROWSER="qutebrowser"

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

# shortcut functions
# TODO add all important folders
se() { du -a ~/.local/bin ~/.config/{fontconfig,ghci,git,shell,sxhkd,tmux,qutebrowser,X11,zathura} ~/.local/src/{dmenu,dwm,slock,st}/*.{c,h} | awk '{print $2}' | fzf | xargs -or $EDITOR ;}

# for reloading .vimrc with keyboard shortcut
# TODO change this path
export MYVIMRC="~/.vimrc"

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
