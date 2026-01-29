export HISTSIZE=1000000000
export SAVEHIST=$HISTSIZE
setopt EXTENDED_HISTORY
setopt autocd
autoload -U compinit; compinit

eval "$(/opt/homebrew/bin/brew shellenv)"

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
  #
  # Smarter completion initialization
  autoload -Uz compinit
  if [ "$(date +'%j')" != "$(stat -f '%Sm' -t '%j' ~/.zcompdump 2>/dev/null)" ]; then
      compinit
  else
      compinit -C
  fi
fi

# Fuzzy finder for history
source <(fzf --zsh)

# vi mode
set -o vi
# Fix for backspace in vi mode
bindkey -v '^?' backward-delete-char
 
# Keybindings and plugins
bindkey -v
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

bindkey '^I'   complete-word       # tab          | complete
bindkey '^[[Z' autosuggest-accept  # shift + tab  | autosuggest

# Aliases
alias ls='ls --color'
alias c="clear"
alias gst="git status"

# Silver Searcher (`brew install the_silver_searcher`)
lsgrep ()
{
    NEEDLE="$(echo $@|sed -E 's/\.([a-z0-9]+)$/\\.\1/'|sed -E 's/\?/./'| sed -E 's/[ *]/.*?/g')";
    ag --depth 9 -S -g "$NEEDLE" 2> /dev/null
}
alias ag='ag --path-to-ignore ~/.ignore'

export PATH=$PATH:~/dev/flutter/bin
#export PATH="$HOME/.jenv/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

eval "$(starship init zsh)"

source ~/.zshrc.local

