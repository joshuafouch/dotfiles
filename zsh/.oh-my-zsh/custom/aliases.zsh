# all of my aliases are stored in here

alias zshconfig='nvim ~/.zshrc'
alias aliasconfig='nvim $ZSH_CUSTOM/aliases.zsh'

alias mkdirp='mkdir -p'

alias c='clear'
alias rebterm='zsh && exit'

alias ls='exa'
alias l='exa -lah'
alias sl='exa'
alias cat='batcat'
alias v='nvim'

alias frickin='sudo apt'
alias fricking='sudo apt-get'

alias swap-esctocaps="setxkbmap -option \"caps:swapescape\""
alias swapesc-reset="setxkbmap -option \"\""

alias sudopush='xclip -sel c < ~/.gittoken.txt && git push'
alias sudopull='xclip -sel c < ~/.gittoken.txt && git pull'
alias sudoclone='xclip -sel c < ~/.gittoken.txt && git clone'
