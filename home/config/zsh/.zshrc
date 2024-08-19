# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

#start msg
EXCLAMATION="!!!"
cowsay "Welcome to " ''$DISTRO''$EXCLAMATION | lolcat

#oh-my-zsh
if [[ -f "$HOME/.zsh/plugins/zsh-nix-shell/nix-shell.plugin.zsh" ]]; then
  source "$HOME/.zsh/plugins/zsh-nix-shell/nix-shell.plugin.zsh"
fi

ZSH_CUSTOM=$HOME/.config/oh-my-zsh

#alias
alias ..="cd ../"
alias ...="cd ../../"
alias ....="cd ../../../"
alias ls="eza"
alias tree="eza --tree"
alias cat="bat"
alias find="fd"
alias ps="procs"
alias man="tldr"
alias diff="delta --side-by-side"
alias neofetch="fastfetch"
alias hm="home-manager switch"
alias gc="nix-collect-garbage"

#rust
. "$HOME/.cargo/env" 

#zoxide
eval "$(zoxide init zsh)"
#starship
eval "$(starship init zsh)"

