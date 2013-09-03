# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi


# User specific aliases and functions

export PATH=$PATH:/sbin:~/bin
export VISUAL=vim
export EDITOR=vim

# completion
if [ -f /etc/bash_completion ]
then	#fedora
	. /etc/bash_completion
fi
if [ -f /etc/profile.d/bash-completion.sh ]
then	#gentoo
	. /etc/profile.d/bash-completion.sh
fi

# history append
shopt -s histappend 
PROMPT_COMMAND='history -a' 

#my alias
alias ga='git add -A'
alias gc='git commit -a'
alias gcm='git commit -m'
alias gd='git diff'
alias gi='git add -i'
alias gl='git log --graph'
alias glp='git log --graph -p'
alias gp='git push'
alias gr='git ls-files -d |xargs git checkout --'
alias gs='git status'
alias gu='git pull'
alias gw='git show'

alias la='ls -lAh --color=auto'
alias ll='ls -lh --color=auto'
alias vi='vim'
alias vim='gvim'

#set the screen title  
case $TERM in  
screen*)  
    # This is the escape sequence ESC k \w ESC \  
    # Use path as title  
    PATHTITLE='\[\ek\W\]\[\e\\\]'  
    # Use program name as title  
    PROGRAMTITLE='\[\ek\]\[\e\\\]'  
    PS1="${PROGRAMTITLE}${PATHTITLE}${PS1}"  
    ;;  
*)  
    ;;  
esac  

# colorful multi lines bash prompt ----------
Color_Off='\e[0m'       # Text Reset

# Regular Colors
Black='\e[0;30m'        # Black
Red='\e[0;31m'          # Red
Green='\e[0;32m'        # Green
Yellow='\e[0;33m'       # Yellow
Blue='\e[0;34m'         # Blue
Purple='\e[0;35m'       # Purple
Cyan='\e[0;36m'         # Cyan
White='\e[0;37m'        # White

# Bold
BBlack='\e[1;30m'       # Black
BRed='\e[1;31m'         # Red
BGreen='\e[1;32m'       # Green
BYellow='\e[1;33m'      # Yellow
BBlue='\e[1;34m'        # Blue
BPurple='\e[1;35m'      # Purple
BCyan='\e[1;36m'        # Cyan
BWhite='\e[1;37m'       # White

# High Intensity
IBlack='\e[0;90m'       # Black
IRed='\e[0;91m'         # Red
IGreen='\e[0;92m'       # Green
IYellow='\e[0;93m'      # Yellow
IBlue='\e[0;94m'        # Blue
IPurple='\e[0;95m'      # Purple
ICyan='\e[0;96m'        # Cyan
IWhite='\e[0;97m'       # White

function parse_git_branch {
   git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'1
} 

# notes:
#	if use color, then PS1 should be PS1="\[$COLOR\]", otherwise wrap will go wrong
#	the basic multi lines should be PS1="\342\224\214\342\224\200\n\342\224\224\342\224\200\342\224\200>"

# multi line color
sq_color="\[$BBlue\]"


LINE1="\[$BBlue\][:)][\w]"

LINE2="\[$BBlue\]\u\[$BBlue\]@\[$BBlue\]\h\[$BBlue\] $ \[$Color_Off\]"

PS1="\n$sq_color\342\224\214\342\224\200$LINE1\n$sq_color\342\224\224\342\224\200\342\224\200>$LINE2"

#- -----------------------------------
