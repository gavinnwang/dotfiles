fish_add_path /usr/local/bin
fish_add_path ~/.local/share/cargo/bin
fish_add_path ~/.local/share/npm/bin
fish_add_path ~/bin
fish_add_path /opt/homebrew/bin
fish_add_path /usr/local/texlive/2023/bin/universal-darwin

alias ls eza --icons -F -H --group-directories-first --git
alias cat bat
alias vim nvim
alias cd z
alias rm trash
alias config='/usr/bin/git --git-dir=/Users/gavinwang/.cfg/ --work-tree=/Users/gavinwang'

starship init fish | source

if status is-interactive
    # Commands to run in interactive sessions can go here
end

