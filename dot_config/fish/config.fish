if status is-interactive

    # Disable Greeting
    set fish_greeting

    # # eza (ls replacement)
    set -x eza_params --git --icons --classify --group-directories-first --group

    # # Bat colorizing pager for manpages
    set -x MANPAGER "sh -c 'sed -u -e \"s/\\x1B\[[0-9;]*m//g; s/.\\x08//g\" | bat -p -lman'"

    # Direnv
#    set -g direnv_fish_mode eval_on_arrow
#    direnv hook fish | source

    # Zoxide
    zoxide init fish --cmd cd | source

    # Starship Prompt
    starship init fish | source
    enable_transience

end

# bun
set --export BUN_INSTALL "$HOME/.local/share/reflex/bun"
fish_add_path $BUN_INSTALL/bin
fish_add_path $HOME/go/bin
