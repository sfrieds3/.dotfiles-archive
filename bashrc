# .bashrc
if [ -f $XDG_CONFIG_HOME/lib-scwfri/bash_colors.sh ]; then
    . $XDG_CONFIG_HOME/lib-scwfri/bash_colors.sh
fi

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

export TERM=xterm-256color

# disable C-s/C-q behavior
stty -ixon

# user@host:pwd in titlebar
# update history with each read/write
# do this only when outside emacs, to allow for ansi-term to work
if [ -n "$INSIDE_EMACS" ]; then
    PROMPT_COMMAND='history -a; history -n'
else
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"; history -a; history -n'
fi

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000000
HISTFILESIZE=1000000
# write to / reload from history after every command
# this keeps command history in sync across shell sessions
export HISTCONTROL=erasedups
shopt -s histappend

set -o noclobber

export EDITOR='vim'
export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"

# User specific aliases and functions
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# bash prompt setup
if [ -f $XDG_CONFIG_HOME/lib-scwfri/git/contrib/completion/git-completion.bash ]; then
    . $XDG_CONFIG_HOME/lib-scwfri/git/contrib/completion/git-completion.bash
fi

if [ -f $XDG_CONFIG_HOME/lib-scwfri/git/contrib/completion/git-prompt.sh ]; then
    . $XDG_CONFIG_HOME/lib-scwfri/git/contrib/completion/git-prompt.sh

    GIT_PS1_SHOWDIRTYSTATE=1
    GIT_PS1_SHOWSTASHSTATE=1
    GIT_PS1_SHOWUNTRACKEDFILES=1
    #PS1="[\[\e[33m\]\u\[\e[m\]\[\e[33m\]@\[\e[m\]\[\e[33m\]\h\[\e[m\]:\w\[\e[37m\]\`__git_ps1\`\[\e[m\]]\n$ "
    #PS1="\h:\W\$(__git_ps1) \u\$ "
    #PS1="[\[\e[33m\]\h:\[\e[m\]\[\e[35m\]\W\[\e[31m\]\`__git_ps1\`\[\e[m\] \[\e[33m\]\u\[\e[m\]]$ "
    #PS1="[\[\e[33m\]\u@\h:\[\e[m\]\[\e[37m\]\w\[\e[31m\]\`__git_ps1\`\[\e[m\]] \[\e[35m\](\D{%Y-%m-%d %H:%M:%S})\[\e[m\]\n$ "
    #PS1="\[\e[33m\]\w\[\e[37m\]\`__git_ps1\`\[\e[m\] $ "
    #PS1="\[\e[33m\]\h:\[\e[m\]\[\e[33m\]\w\[\e[31m\]\`__git_ps1\`\[\e[m\] \u\n$ "
    PS1="[\[\e[33m\]\u@\h:\[\e[m\]\[\e[37m\]\w\[\e[31m\]\`__git_ps1\`\[\e[m\]]\n$ " 
    #PS1="[\t]\[\e[33m\] \h \w\[\e[31m\]\`__git_ps1\`\[\e[m\] $ "
fi

