# History configuration
export HISTSIZE=1000000000
export SAVEHIST=$HISTSIZE
setopt EXTENDED_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt SHARE_HISTORY
setopt autocd

# Homebrew setup
eval "$(/opt/homebrew/bin/brew shellenv)"

# Completion system - only initialize once, after FPATH is set
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
fi

autoload -Uz compinit
if [ "$(date +'%j')" != "$(stat -f '%Sm' -t '%j' ~/.zcompdump 2>/dev/null)" ]; then
    compinit
else
    compinit -C
fi

# Fuzzy finder for history
source <(fzf --zsh)

# Zsh autosuggestions
if [ -f "$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ]; then
    source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

# Vi mode
bindkey -v
bindkey '^?' backward-delete-char  # Fix backspace in vi mode
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^I'   complete-word       # tab          | complete
bindkey '^[[Z' autosuggest-accept  # shift + tab  | autosuggest

# Aliases
alias ls='ls -G'  # macOS-compatible color output
alias c="clear"
alias gst="git status"

# Silver Searcher function
lsgrep() {
    NEEDLE="$(echo $@|sed -E 's/\.([a-z0-9]+)$/\\.\1/'|sed -E 's/\?/./'| sed -E 's/[ *]/.*?/g')"
    ag --depth 9 -S -g "$NEEDLE" 2> /dev/null
}

# Conditionally set ag alias if .ignore file exists
if [ -f ~/.ignore ]; then
    alias ag='ag --path-to-ignore ~/.ignore'
fi

# PATH modifications
export PATH=$PATH:~/dev/flutter/bin
export PATH="$HOME/.local/bin:$PATH"

# Prompt
eval "$(starship init zsh)"

# Local overrides
source ~/.zshrc.local
