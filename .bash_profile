export BASH_SILENCE_DEPRECATION_WARNING=1

eval "$(/opt/homebrew/bin/brew shellenv)"
. $(brew --prefix asdf)/libexec/asdf.sh
. $(brew --prefix asdf)/etc/bash_completion.d/asdf

source ~/.bash_profile_helpers/shell_settings
source ~/.bash_profile_helpers/ruby_settings
source ~/.bash_profile_helpers/bash_prompt
source ~/.bash_profile_helpers/git_aliases
source ~/.bash_profile_helpers/git_autocomplete
source ~/.bash_profile_helpers/aliases
source ~/.bash_profile_helpers/vim_clojure
#source ~/.bash_profile_helpers/rbenv
source ~/.bash_profile_helpers/path

[ -f "$HOME/.bash_custom" ] && source "$HOME/.bash_custom"



# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/dhassler/Downloads/google-cloud-sdk/path.bash.inc' ]; then . '/Users/dhassler/Downloads/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/dhassler/Downloads/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/dhassler/Downloads/google-cloud-sdk/completion.bash.inc'; fi


# BEGIN opam configuration
# This is useful if you're using opam as it adds:
#   - the correct directories to the PATH
#   - auto-completion for the opam binary
# This section can be safely removed at any time if needed.
test -r '/Users/dhassler/.opam/opam-init/init.sh' && . '/Users/dhassler/.opam/opam-init/init.sh' > /dev/null 2> /dev/null || true
# END opam configuration
