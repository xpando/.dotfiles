# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Prompt https://starship.rs
# config in: ~/.config/starship.toml
eval "$(starship init bash)"

alias ls='exa'
alias l='ls -lh'
alias ll='ls -lah'
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
