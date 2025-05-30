# my custom aliases

alias cd='z'	# dependent on zoxide tool

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
alias vim='nvim'

alias swap-esctocaps="setxkbmap -option \"caps:swapescape\""
alias swapesc-reset="setxkbmap -option \"\""

alias sudopush='xclip -sel c < ~/Documents/.gittoken.txt && git push'	# dependent on xlip tool
alias sudopull='xclip -sel c < ~/Documents/.gittoken.txt && git pull'
alias sudoclone='xclip -sel c < ~/Documents/.gittoken.txt && git clone'
