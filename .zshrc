#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/aiken/opt/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/aiken/opt/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/aiken/opt/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/aiken/opt/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
conda config --set auto_activate_base false
# <<< conda initialize <<<

# <<< app aliasing <<<
alias subl='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'

# >>> basic setting >>>
export EDITOR=vim
