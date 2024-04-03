if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting web-search)
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


export PNPM_HOME="/Users/gavinwang/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

[ -s "/Users/gavinwang/.bun/_bun" ] && source "/Users/gavinwang/.bun/_bun"

export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$HOME/go/bin
export GOROOT=/usr/local/go
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export PATH="$HOME/.poetry/bin:$PATH"
export PATH="/Users/gavinwang/CODE/codeql-dev/codeql:$PATH"
export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"

# opam configuration
[[ ! -r /Users/gavinwang/.opam/opam-init/init.zsh ]] || source /Users/gavinwang/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null


alias config='/usr/bin/git --git-dir=/Users/gavinwang/.cfg/ --work-tree=/Users/gavinwang'
alias vim='nvim'
alias k="kubectl"
alias ls="eza --icons -F -H --group-directories-first --git"
alias cd="z"
alias cat="bat"
alias rm="trash"

alias black="ssh gwang@black.tailf7f8d.ts.net"

PATH="/opt/homebrew/bin:$PATH"
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/gavinwang/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/gavinwang/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/gavinwang/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/gavinwang/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"
