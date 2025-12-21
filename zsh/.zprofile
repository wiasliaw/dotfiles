# ssh agent
export SSH_AUTH_SOCK="$HOME/Library/Containers/com.bitwarden.desktop/Data/.bitwarden-ssh-agent.sock"
# ssh agent end

# homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"
# heombrew end

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init.zsh 2>/dev/null || :
