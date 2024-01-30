# /etc/skel/.bashrc
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !


# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi

# Put your fun stuff here.

# Bash shell options
shopt -s checkwinsize # Check window size and enable $COLUMS and $ROWS
shopt -s expand_aliases # Expand aliases
shopt -s globstar # Pattern matching for **
shopt -s histappend # Append history to history file
shopt -s dotglob # Match files starting with . in expansion
shopt -s extglob # Enable Pathname Expansion

# vi mode everywhere
set -o vi # Enable vi mode

# Stty
stty -ixon # Disable control-s/control-q tty flow control

# History
export HISTCONTROL=ignoreboth # Ignore commands that start with space and commands that are duplicated
export HISTSIZE=500
export HISTFILESIZE=1000

# Prompt
PROMPT_LONG=20
PROMPT_MAX=95
PROMPT_AT=@

# Prompt
__ps1() {
	local P='$' dir="${PWD##*/}" B countme short long double \
	r='\[\e[31m\]' g='\[\e[32m\]' h='\[\e[34m\]' \
	u='\[\e[33m\]' p='\[\e[34m\]' w='\[\e[35m\]' \
	b='\[\e[36m\]' x='\[\e[0m\]'

	[[ $EUID == 0 ]] && P='#' && u=$r && p=$u # root
	[[ $PWD = / ]] && dir=/
	[[ $PWD = "$HOME" ]] && dir='~'

	B=$(git branch --show-current 2>/dev/null)
	[[ $dir = "$B" ]] && B=.
	countme="$USER$PROMPT_AT$(hostname):$dir($B)\$ "

	[[ $B == master || $B == main ]] && b="$r"
	[[ -n "$B" ]] && B="$g($b$B$g)"

	short="$u\u$g$PROMPT_AT$h\h$g:$w$dir$B$p$P$x "
	long="$g╔ $u\u$g$PROMPT_AT$h\h$g:$w$dir$B\n$g╚ $p$P$x "
	double="$g╔ $u\u$g$PROMPT_AT$h\h$g:$w$dir\n$g║ $B\n$g╚ $p$P$x "

	if ((${#countme} > PROMPT_MAX)); then
		PS1="$double"
	elif ((${#countme} > PROMPT_LONG)); then
		PS1="$long"
	else
		PS1="$short"
	fi
}

PROMPT_COMMAND="__ps1"

# Load files
## Load aliases
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"

# Paths
## local binaries
localbin="$HOME/.local/bin"
if ! [[ $PATH =~ "$localbin" ]]; then
	export PATH="$localbin:$PATH"
fi
## GOLANG
GOPATH="$HOME/go"
if ! [[ $PATH =~ "$GOPATH" ]]; then
	export PATH="$PATH:$GOPATH/bin"
fi
