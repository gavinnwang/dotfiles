fish_add_path /usr/local/bin
fish_add_path ~/bin
fish_add_path /opt/homebrew/bin
fish_add_path /opt/homebrew/opt/node@20/bin

fish_vi_key_bindings

set fish_greeting

function finder
	open -a finder $argv
end

zoxide init fish | source

starship init fish | source

alias ls='eza --icons -F -H --group-directories-first --git'
alias cat bat
alias v nvim
alias cd z
alias wez='wezterm cli'
alias rm trash
alias config='/usr/bin/git --git-dir=/Users/gavinwang/.cfg/ --work-tree=/Users/gavinwang'


if status is-interactive
    # Commands to run in interactive sessions can go here
end

