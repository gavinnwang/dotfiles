ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

if [[ ! -d "$ZINIT_HOME" ]]; then
    mkdir -p "$(dirname $ZINIT_HOME)"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"
zinit ice as"command" from"gh-r" \
          atclone"./starship init zsh > init.zsh; ./starship completions zsh > _starship" \
          atpull"%atclone" src"init.zsh"

autoload -U compinit && compinit

zinit light starship/starship
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light Aloxaf/fzf-tab
zinit light zsh-users/zsh-autosuggestions

zinit cdreplay -q

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
# dont add to history if command has a " " before it
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

eval "$(fzf --zsh)"
eval "$(zoxide init zsh)"

# ignore case for autocomplete
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors '${(s.:.)LS_COLORS}'
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:z:*' fzf-preview 'eza --icons -1 --color=always $realpath'

alias ta='tmux attach || tmux new'
alias ls='eza --icons -F -H --group-directories-first --git'
alias cat="bat"
alias v="nvim"
alias t="tmux"
alias cd="z"

# macos only
finder() {
    if [ -z "$1"];then
        open -a finder .
    else
        open -a finder "$1"
    fi
}

# search using the existing prefix
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down

export PATH="$PATH:$(go env GOPATH)/bin"

export PATH="$HOME/.cargo/bin:$PATH"
export PATH=$PATH:$HOME/go/bin
# bun completions
[ -s "/Users/gavinwang/.bun/_bun" ] && source "/Users/gavinwang/.bun/_bun"
# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"

. "$HOME/.local/bin/env"

alias c='clear'
#git
alias gcm='git commit -m'
alias ga='git add .'
alias gs='git status'
alias gp='git pull'
alias gpr='git pull --rebase'
alias gpu='git push'
alias gamend='git add . && git commit --amend --no-edit -n && git push -f'
alias gcm='git checkout master'
alias g-='git checkout -'
alias gg='f() { git add . && git commit -m "$1" && git push; }; f'
