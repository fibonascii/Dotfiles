# Path to your oh-my-zsh installation.

if [ "$(uname 2> /dev/null)" != "Linux" ]; then
	export ZSH="/Users/rkirby/.oh-my-zsh"
fi

export ZSH="/home/rkirby/.oh-my-zsh"

ZSH_THEME="refined"

# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# General Settings
##################################################

export TERM=screen-256color 

# What does this do again?
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/vault vault


export EDITOR="nvim"
alias vim="nvim"


# Python Configuration
################################
export PATH=/usr/local/opt/python/libexec/bin:$PATH
export PATH=/usr/local/bin:$PATH

# Setup Virtualenv Wrapper
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Devel

# MacOs Paths to Virtualenv Wrapper
if [ "$(uname 2> /dev/null)" != "Linux" ]; then

	export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python
    source /usr/local/bin/virtualenvwrapper.sh
fi

# Manjaro Paths to Virtualenv Wrapper
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python
source /usr/bin/virtualenvwrapper.sh

#########################################
#FZF Configuration


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh


# fh - repeat history
fh() {
  print -z $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | \
      sed -E 's/ *[0-9]*\*? *//' | sed -E 's/\\/\\\\/g')
}

# fp - Preview files in current directory
fp() {
	fzf --preview="head -$LINES {}" 
}

