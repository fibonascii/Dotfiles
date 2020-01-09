if [ "$TMUX" = ""  ]; then tmux; fi

#DISABLE_AUTO_TITLE="true"

# Path to your oh-my-zsh installation.

if [[ "$(uname 2> /dev/null)" != "Linux" ]]; then
	export ZSH="/Users/fibonascii/.oh-my-zsh"
else
	export ZSH="$HOME/.oh-my-zsh"
fi


ZSH_THEME="refined"

# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# General Settings
##################################################

export TERM=xterm-256color 

# What does this do again?
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/vault vault

if [[ $(which nvim) -eq 0 ]] then;
	export EDITOR="nvim"
	alias vim="nvim"
fi

# Python Configuration
################################
export PATH=/usr/local/opt/python/libexec/bin:$PATH
export PATH=/usr/local/bin:$PATH

# Setup Virtualenv Wrapper
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Devel

# MacOs Paths to Virtualenv Wrapper
if [[ "$(uname 2> /dev/null)" != "Linux" ]]; then

	export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python
    source /usr/local/bin/virtualenvwrapper.sh
else
	# Manjaro Paths to Virtualenv Wrapper
	export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python
	source /usr/local/bin/virtualenvwrapper.sh
fi

#########################################
#FZF Configuration


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Homebrew installs support for fzf completion by default
# This has to be sourced manually on linux
if [[ "$(uname 2> /dev/null)" == "Linux" ]]; then
#	source /usr/share/fzf/key-bindings.zsh
	source 	$HOME/.fzf/shell/key-bindings.zsh
#	source /usr/share/fzf/completion.zsh
    source 	$HOME/.fzf/shell/completion.zsh
fi

# fh - repeat history
fh() {
  print -z $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | \
      sed -E 's/ *[0-9]*\*? *//' | sed -E 's/\\/\\\\/g')
}

# fp - Preview files in current directory
fp() {
	fzf --preview="head -$LINES {}" 
}

export DOCKER_HOST=tcp://localhost:2375



#Keychain Manager - apt install keychain
eval $(keychain --eval id_rsa)
