# usr export setup

export EDITOR='nvim'
export VISUAL='nvim'
export PAGER='less'
export LANG='en_US.UTF-8'
# colorize some commands such as tree
export CLICOLOR=1
export PATH=".local/bin:$PATH"
# change the default config dir in macos
if [[ "$(uname)" == "Darwin" ]]; then
    export XDG_CONFIG_HOME="$HOME/.config" 
fi

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/Caskroom/miniconda/base/bin:$PATH"
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

alias ls='ls -l --color'
alias la='colorls -la'
alias ll='colorls -l'
alias cl='clear'
alias cat='bat'
alias vim='nvim'
alias ra='joshuto'
alias lg='lazygit'
alias top='btop'
alias f='fd --type d --hidden --exclude .git --exclude Library| fzf-tmux -p --reverse' 
alias fv='fd --type f --hidden --exclude .git --exclude Library| fzf-tmux -p --reverse | xargs nvim'
alias tl='tldr --list | fzf-tmux -p --reverse --preview "tldr {1} --color=always" --preview-window=right,70% | xargs tldr'
alias skim='/Applications/Skim.app/Contents/MacOS/Skim'  # pdf viewer for latex

if [[ $TERM == "xterm-kitty" ]]; then
    alias ssh="kitty +kitten ssh"
fi

#==================================================================================================
# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"

# dont change the order of plugins
plug "zsh-users/zsh-autosuggestions"
plug "zsh-users/zsh-syntax-highlighting"
plug "zap-zsh/completions" 
plug "zap-zsh/vim"
plug "zap-zsh/fzf"

# completions init
autoload -Uz compinit

#==================================================================================================
# additional features setup

# use tmux-fzf as default fzf
export FZF_TMUX=1
export FZF_TMUX_OPTS='-p --reverse'
# zoxide init
eval "$(zoxide init zsh --cmd cd)"
# colorscheme setup 
eval "$(starship init zsh)"
