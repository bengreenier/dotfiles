# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

eval $(thefuck --alias)
eval $(thefuck --alias FUCK)

PATH=$PATH:$HOME/bin
export PS1="⚡ \[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
export TERM=xterm-256color
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
alias ls='ls -GFh --color=auto'
alias weather='curl -4 http://wttr.in/London'

export PATH
