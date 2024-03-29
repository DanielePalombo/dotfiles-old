# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="agnoster"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to disable command auto-correction.
# DISABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Shell command
TOUCH_ID=`xinput | grep Touchpad | awk '{ print $6 }'| awk -F= '{ print $2}'`
export EDITOR='vim'
alias touch_dis='xinput set-prop $TOUCH_ID "Device Enabled" 0'
alias touch_en='xinput set-prop $TOUCH_ID "Device Enabled" 1'


# Tmux
alias sp="tmuxinator start" 
alias tmux='TERM=screen-256color-bce tmux'
alias tmuxinator='TERM=screen-256color-bce tmuxinator'

alias sudo='sudo env "PATH=$PATH"'

# Ruby aliases
alias bundle='nocorrect bundle'
alias be="bundle exec"
alias bi="bundle install"
alias bo="bundle open"

# Console aliases
alias git="hub"
alias g="hub"
alias gd="g diff"
alias gs="g status"

# Android configuration
export PATH="$PATH:$HOME/android-sdk-linux/platform-tools/" # Add Android platform tools bin
export PATH="$PATH:$HOME/android-sdk-linux/tools/" # Add Android platform tools bin
export JAVA_HOME=/usr/lib/jvm/java-8-oracle/jre/
export ANDROID_HOME="$HOME/android-sdk-linux/" # Add Android platform tools bin

export PS1="$PS1"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
