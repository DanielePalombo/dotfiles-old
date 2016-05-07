# Path to Oh My Fish install.
set -gx OMF_PATH "/home/ksemuldie/.local/share/omf"

# Customize Oh My Fish configuration path.
#set -gx OMF_CONFIG "/home/ksemuldie/.config/omf"

set fish_function_path $fish_function_path "/home/ksemuldie/.local/lib/python2.7/site-packages/powerline/bindings/fish"
#powerline-setup

# Load oh-my-fish configuration.
source $OMF_PATH/init.fish

set TOUCH_ID `xinput | grep Touchpad | awk '{ print $6 }'| awk -F= '{ print $2}'`
alias touch_dis='xinput set-prop $TOUCH_ID "Device Enabled" 0'
alias touch_en='xinput set-prop $TOUCH_ID "Device Enabled" 1'

alias bundle='nocorrect bundle'
alias sp="tmuxinator start" 

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PATH="$PATH:$HOME/android-sdk-linux/platform-tools/" # Add Android platform tools bin
export PATH="$PATH:$HOME/android-sdk-linux/tools/" # Add Android platform tools bin
export JAVA_HOME=/usr/lib/jvm/java-7-oracle/jre/

alias tmux="env TERM=screen-256color-bce tmux"
alias tmuxinator="env TERM=screen-256color-bce tmuxinator"

set PS1 "$PS1"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'

cd .
