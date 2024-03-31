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

# Exports/Paths
export ZSH="$HOME/.oh-my-zsh"
export PATH=$PATH:$HOME/bin

export STARSHIP_CONFIG=$HOME/.config/starship/starship.toml
export NODE_REPL_HISTORY=

export DOTNET_ROOT=$HOME/dotnet
export PATH=$PATH:$HOME/dotnet

export PATH=$PATH:/Users/shinobu/.spicetify

# Plugins
plugins=(
    git zsh-syntax-highlighting
    zsh-autosuggestions
    web-search
)
source $ZSH/oh-my-zsh.sh

# Shortened aliases
alias v='nvim'
alias ls='ls -aG'
alias ql='qlmanage -p'
alias nf='clear && neofetch'
alias src="source $HOME/.zshrc"

# Rickroll
alias rr='open https://www.youtube.com/watch\?v\=dQw4w9WgXcQ'

# Quality of life
findstuff() { fd --type f --hidden --exclude .git --exclude .DS_Store | fzf | xargs nvim }
zle -N findstuff 
bindkey '^f' findstuff 
alias mv='mv -i' 
alias cp='cp -i' 
alias ln='ln -i'
alias mkdir='mkdir -pv'
alias dtf='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias dev='cd $HOME/Developer/'
alias sch='cd $HOME/School/second-sem/'
alias ..='cd ..'


# Starship
eval "$(starship init zsh)"

# Neofetch
neofetch
