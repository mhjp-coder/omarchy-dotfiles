# This file is for referance only, it is not used by the shell
# Aliases in fish are defined as functions in the ~/.config/fish/functions/ directory
# fish has a built in alias command that is used to create the functions.

# Whan adding a new alias, make sure to update chezmoi to track the new files
# chezmoi add ~/.config/fish/functions/alias.fish
#
# You can add the alias by running it in the terminal and appending --save
# alias ll 'ls -l' --save

# eza
alias l     'eza --group-directories-first --icons=auto'
alias ll    'l -lh'
alias ls    'l -lah'
alias la    'l -lbhHigUmuSa'
alias lt    'eza --tree --level=2 --long --icons --git'
alias lta   'lt -a --group-directories-first'

# ip
alias ip        'ip -c'
alias ipa       'ip -br addr'

# Python
alias uvi       'uv init'
alias uvs       'uv sync'
alias uva       'uv add'
alias uvr       'uv remove'

# Misc
alias cat       'bat'
alias zd        'cd $HOME/Dev'
alias sc        '$HOME/.config/fish/config.fish | source'
alias tarnow    'tar -acf '
alias untar     'tar -zxvf '
alias fixpacman 'sudo rm /var/lib/pacman/db.lck'
alias rmpkg     'yay -Rcns '
alias psmem     'ps auxf | sort -nr -k 4'
alias psmem10   'ps auxf | sort -nr -k 4 | head -10'
alias grep      'rg'

# Chezmoi
alias cz        'chezmoi '
alias czcd      'chezmoi cd'
alias cza       'chezmoi add '
alias czra      'chezmoi re-add '
alias czu       'chezmoi update'
alias czap      'chezmoi apply'
alias cze       'chezmoi edit --apply '
alias czs       'chezmoi status'
alias czd       'chezmoi doctor'
alias czf       'chezmoi forget '

# Vim
alias vim       'nvim'
alias vi        'nvim'
alias v         'nvim'
