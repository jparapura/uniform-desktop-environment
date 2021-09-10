#
# ~/.bashrc
#

# if not running interactively, don't do anything
[[ $- != *i* ]] && return

# turn on vi mode in terminal
set -o vi

# PS1='[\u@\h \W]\$ '
PS1='$ '

export PATH=${PATH}:/home/me/.local/bin

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

startx_alias_path=${HOME}/.local/bin/startx-alias
# aliases
alias sx="${startx_alias_path}/run.sh"
alias startx="${startx_alias_path}/reset.sh; sx"
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias scipio="sx w b"
alias ls='ls --color=auto'
alias l='ls'
alias sl='ls'
alias v="vim"
alias m="make"
alias ka="killall"
alias sudo="echo \"Use doas instead of sudo. If you REALLY need to use sudo, use \\sudo\""

# shortcut functions
# TODO add all important folders
se() { du -a ~/.local/bin ~/.config/{fontconfig,git,sxhkd,tmux,X11,zathura} ~/progs/suckless/{dmenu,dwm,slock,st}/*.{c,h} | awk '{print $2}' | fzf | xargs -or $EDITOR ;}

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
