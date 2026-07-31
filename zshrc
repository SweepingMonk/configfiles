# initialize starship
eval "$(starship init zsh)"

# alias
alias ls="ls -G"
alias ll="ls -la"
export LANG="en_US.UTF-8"
export EDITOR=vim
export PATH=$HOME/.local/bin:$PATH

# cd 补全大小写不敏感
autoload -Uz compinit
compinit

zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' menu select

source "$HOME/.cargo/env"
