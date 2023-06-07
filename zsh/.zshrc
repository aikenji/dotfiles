# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
plug "zsh-users/zsh-autosuggestions"
plug "zsh-users/zsh-syntax-highlighting"
plug "zap-zsh/vim"
plug "chivalryq/zsh-autojump"
plug "romkatv/powerlevel10k"

# Load and initialise completion system
autoload -Uz compinit
compinit

#==================================================================================================
# usr export setup

export EDITOR='nvim'
export VISUAL='nvim'
export PAGER='less'
export LANG='en_US.UTF-8'
# colorize some commands such as tree
export CLICOLOR=1
export PATH=".local/bin:$PATH"

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
# <<< conda initialize <<<

# >>> homebrew initialize >>>
export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.ustc.edu.cn/brew.git"
export HOMEBREW_CORE_GIT_REMOTE="https://mirrors.ustc.edu.cn/homebrew-core.git"
export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.ustc.edu.cn/homebrew-bottles"
export HOMEBREW_API_DOMAIN="https://mirrors.ustc.edu.cn/homebrew-bottles/api"
export HOMEBREW_NO_AUTO_UPDATE

export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/sbin:$PATH"
export CPATH=/opt/homebrew/include
export LIBRARY_PATH=/opt/homebrew/lib
# <<< homebrew initialize <<<

#==================================================================================================
# usr alias setup

alias ls='colorls'
alias l='colorls -l'
alias cat='bat'
alias grep='rg'
alias vim='nvim'
alias ra='ranger'
alias top='vtop'
alias ff='fd --type d --hidden --exclude .git --exclude Library| fzf-tmux -p --reverse' 
alias ffv='fd --type f --hidden --exclude .git --exclude Library| fzf-tmux -p --reverse | xargs nvim'
alias ma='tldr --list | fzf-tmux -p --reverse --preview "tldr {1} --color=always" --preview-window=right,70% | xargs tldr'

#==================================================================================================
# usr function setup

# If you want to change the dir on demand when you exit ranger, use the following wrapper function. With this, your shell changes the directory only when you quit ranger with keybinding capital Q.
function ranger {
    local IFS=$'\t\n'
    local tempfile="$(mktemp -t tmp.XXXXXX)"
    local ranger_cmd=(
        command
        ranger
        --cmd="map Q chain shell echo %d > "$tempfile"; quitall"
    )
    
    ${ranger_cmd[@]} "$@"
    if [[ -f "$tempfile" ]] && [[ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]]; then
        cd -- "$(cat "$tempfile")" || return
    fi
    command rm -f -- "$tempfile" 2>/dev/null
}

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
