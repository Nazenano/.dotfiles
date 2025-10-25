#
#  (`-').-> (`-').->  _     <-. (`-')_            <-.(`-')
#  ( OO)_   (OO )__  (_)       \( OO) )     .->    __( OO)      .->
# (_)--\_) ,--. ,'-' ,-(`-'),--./ ,--/ (`-')----. '-'---.\ ,--.(,--.
# /    _ / |  | |  | | ( OO)|   \ |  | ( OO).-.  '| .-. (/ |  | |(`-')
# \_..`--. |  `-'  | |  |  )|  . '|  |)( _) | |  || '-' `.)|  | |(OO )
# .-._)   \|  .-.  |(|  |_/ |  |\    |  \|  |)|  || /`'.  ||  | | |  \
# \       /|  | |  | |  |'->|  | \   |   '  '-'  '| '--'  /\  '-'(_ .'
#  `-----' `--' `--' `--'   `--'  `--'    `-----' `------'  `-----'
#
# github: https://github.com/Nazenano

autoload -U colors && colors
source <(fzf --zsh)

export STARSHIP_CONFIG=$HOME/.config/starship/starship.toml
export NODE_REPL_HISTORY=
export DOTNET_ROOT=$HOME/dotnet
export PATH=$PATH:$HOME/dotnet
export PATH=$PATH:$HOME/.spicetify
export PATH=$PATH:$HOME/.config/scripts
export EDITOR="nvim"
export ZSH_COMPDUMP="$HOME/.cache/zsh/.zcompdump-$(whoami)-${ZSH_VERSION}"
export SQLITE_HISTORY="$HOME/.cache/sqlite3/.sqlite_history"
export LESSHISTFILE=-

HISTFILE=$HOME/.zsh_history
SAVEHIST=100000
HISTSIZE=99999
setopt HIST_IGNORE_ALL_DUPS

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
autoload -U compinit && compinit
autoload -U colors && colors

alias v='nvim'
alias ls='ls -AGUtp'
alias ql='qlmanage -p'
alias nf='clear; neofetch'
alias src="source $HOME/.zshrc"
finder() { open . }
zle -N finder
bindkey '^o' finder
alias mv='mv -i'
alias cp='cp -i'
alias ln='ln -i'
alias mkdir='mkdir -pv'
alias dtf='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias dev='cd $HOME/Developer/'
alias sch='cd $HOME/School/fifth-sem/'
alias ..='cd ..'
alias ...='cd ..; cd ..'
alias ....='cd ..; cd ..; cd ..'
alias .....='cd ..; cd ..; cd ..; cd ..'
alias ......='cd ..; cd ..; cd ..; cd ..; cd ..'
bindkey '^[[Z' reverse-menu-complete

eval "$(starship init zsh)"

neofetch

source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
