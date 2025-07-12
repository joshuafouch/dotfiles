# my custom aliases

alias cd='z'	# dependent on zoxide tool
alias p='sudo pacman'

alias zshconf='nvim $ZDOTDIR/.zshrc'
alias aliasconf='nvim $ZDOTDIR/.aliases.zsh'

alias mkdir='mkdir -p'

alias c='clear'
alias zsh='zsh && exit'

alias ls='exa'	# dependent on eza tool
alias l='exa -lah'
alias sl='exa'
alias cat='bat'	# dependent on bat tool
alias v='nvim'	# dependent on neovim
alias vim='nvim'  # dependent on neovim

alias swap-esctocaps="setxkbmap -option \"caps:swapescape\""
alias swapesc-reset="setxkbmap -option \"\""

alias lg='lazygit'

alias poke='pokemon-colorscripts'	# dependent on pokemon-colorscripts

alias pacman-hist="awk '/installed/ { gsub(/^\[/, \"\", \$1); split(\$1, a, \"T\"); print a[1], \$4, \$5; }' /var/log/pacman.log"

alias say='./sam'
