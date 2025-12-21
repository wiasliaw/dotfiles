# starship
eval "$(starship init zsh)"
# starship end

# environment variables
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR="vim"   # remote
else
  export EDITOR="hx"    # local
fi
export VISUAL="hx"
export LANG=en_US.UTF-8
# end environment variables

# pnpm
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F
{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.gi
t" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
# End of Zinit's installer chunk

# zsh plugin install
zinit ice wait lucid atinit"zpcompinit; zpcdreplay"
zinit light zdharma-continuum/fast-syntax-highlighting

zinit ice wait lucid atload"_zsh_autosuggest_start"
zinit light zsh-users/zsh-autosuggestions

zinit ice wait lucid blockf atpull'zinit creinstall -q .'
zinit light zsh-users/zsh-completions
# end zsh plugin install

# alias
alias vim="hx"
alias cat="bat"
alias diff="delta"
alias find="fd"
alias ls="eza"
alias tree="eza --tree --git-ignore"
alias ps="procs"
alias htop="btm --basic"
alias grep='rg'
# end alias
