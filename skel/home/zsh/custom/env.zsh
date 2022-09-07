#ulimit -n 8192
export TERM=xterm-256color
export TF_LOG="DEBUG"
export USER_AGENT='Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:75.0) Gecko/20100101 Firefox/75.0'
export GOPATH=$HOME/go
export PATH=$PATH:~/.local/bin:/usr/games/
if grep -q Microsoft /proc/version 2>/dev/null; then
    export LESSCHARSET="utf-8"
fi

# bash_completion if brew is installed
if [ "$(command -v brew)" ] ; then
    if [ -f $(brew --prefix)/etc/bash_completion ]; then
        source $(brew --prefix)/etc/bash_completion
    fi
fi

# Configure screen
mkdir -p ~/.screen
chmod 700 ~/.screen
export SCREENDIR=$HOME/.screen

# Configure SSH agent
SSH_ENV="$HOME/.ssh/environment"

function start_agent {
    #echo "Initialising new SSH agent..."
    /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
    #echo succeeded
    chmod 600 "${SSH_ENV}"
    . "${SSH_ENV}" > /dev/null
    /usr/bin/ssh-add;
}

# Source SSH settings, if applicable
if [ -f "${SSH_ENV}" ]; then
    . "${SSH_ENV}" > /dev/null
    #ps ${SSH_AGENT_PID} doesn't work under cywgin
    ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
        start_agent;
    }
else
    start_agent;
fi

# Homebrew
if [ -d $HOME/.homebrew ]; then
    HOMEBREW=$HOME/.homebrew
else
    HOMEBREW=/usr/local
fi
export HOMEBREW
export PATH=$HOMEBREW/bin:$PATH
export PATH="$PATH:$HOME/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export HOMEBREW_NO_ANALYTICS=1
# ZSH context highlighting and suggestions
source $HOMEBREW/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOMEBREW/share/zsh-autosuggestions/zsh-autosuggestions.zsh
export HOMEBREW_CASK_OPTS="--appdir=~/Applications"

# User configuration

# For tab completion
export FIGNORE=".o:~:Application Scripts"

# Java
#export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
#export JAVA8_HOME=$JAVA_HOME
#export JAVA7_HOME=$JAVA_HOME
#export JAVA6_HOME=$JAVA_HOME

# Eliminate duplicate path entries
typeset -U PATH
