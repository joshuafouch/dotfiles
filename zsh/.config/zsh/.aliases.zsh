# my custom aliases

alias cd='z'	# dependent on zoxide tool
alias p='sudo pacman'

alias zshconf='nvim $ZDOTDIR/.zshrc'
alias aliasconf='nvim $ZDOTDIR/.aliases.zsh'

alias mkdir='mkdir -p'

alias zsh='zsh && exit'

alias l='exa -lah'
alias sl='cmatrix'
alias cat='bat'	# dependent on bat tool
alias v='nvim'	# dependent on neovim
alias vim='nvim'  # dependent on neovim
alias open='xdg-open'

alias swap-esctocaps="setxkbmap -option \"caps:swapescape\""
alias swapesc-reset="setxkbmap -option \"\""

alias lg='lazygit'

alias ls='eza -lh --group-directories-first --icons=auto'
alias lsa='ls -a'
alias lt='eza --tree --level=2 --long --icons --git'
alias lta='lt -a'
alias ff="fzf --preview 'bat --style=numbers --color=always {}'"

# Directories
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias poke='pokemon-colorscripts'	# dependent on pokemon-colorscripts

alias pacman-hist="awk '/installed/ { gsub(/^\[/, \"\", \$1); split(\$1, a, \"T\"); print a[1], \$4, \$5; }' /var/log/pacman.log"

alias say='./sam'

alias Trust='kjv Psalm 23' # dependent on kjv-apocrypha
