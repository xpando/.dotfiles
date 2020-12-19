# Bail out if not running interactively
[[ $- != *i* ]] && return

export PATH=~/go/bin:$PATH
export PATH=~/.cargo/bin:$PATH
export PATH=~/.local/bin:$PATH

export EDITOR=nvim
export LESS=FRX

# Privacy
export DOTNET_CLI_TELEMETRY_OPTOUT=1
export SAM_CLI_TELEMETRY=0

# Prompt https://starship.rs
# config in: ~/.config/starship.toml
eval "$(starship init zsh)"

# Fuzzy find
if [ -n "${commands[fzf-share]}" ]; then
  export FZF_BASE="$(fzf-share)"
  source "$(fzf-share)/key-bindings.zsh"
  source "$(fzf-share)/completion.zsh"
fi

# Frecent files and directories
# With zsh plugin andrewferrier/fzf-z Ctrl-G will search
# directories and files weighted by frequency and recency of use.
eval "$(fasd --init auto)"
export FZFZ_RECENT_DIRS_TOOL=fasd

# Fuzzy search AWS EC2 infra
if type aws-fuzzy &>/dev/null; then
  export AWS_FUZZ_PRIVATE_IP='true'
  export AWS_FUZZ_USE_CACHE=yes
  export AWS_FUZZ_CACHE_EXPIRY=3600  # expiry time in seconds
fi

# ZSH Plugins
source <(antibody init)
export ZSH="$(antibody home)/https-COLON--SLASH--SLASH-github.com-SLASH-ohmyzsh-SLASH-ohmyzsh"
antibody bundle < ~/.zsh_plugins

# Aliases
alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias ip='ip -c'
alias reboot='sudo reboot'
alias sdn='sudo shutdown now'
alias docker-up='sudo systemctl start docker'
alias docker-down='sudo systemctl stop docker && sudo systemctl stop containerd'
alias vm-up='sudo systemctl start libvirtd && virsh net-start default'
alias vm-down='sudo systemctl stop libvirtd && virsh net-destroy default'

# Tmux
alias t='tmux'
alias ta='t a -t'
alias tls='t ls'
alias tn='t new -t'

# Common command replacements
# EXA is a better ls written in rust: https://the.exa.website/
if type exa &>/dev/null; then
  alias ls='exa --git --group-directories-first'
fi
alias l='ls -lh'
alias ll='ls -lah'

# prefer nvim
if type nvim &>/dev/null; then
  alias vim='nvim'
fi
alias v='vim'

# Colorized cat
if type bat &>/dev/null; then
  alias cat='bat -p'
  export MANPAGER="sh -c 'col -bx | bat -l man -p'"
fi

# Git
alias gfa='git fetch --all'
alias gb='git branch'
alias gba='git branch --all'
alias gr='git remote -v'
alias gra='git remote add'

# Misc
alias path="tr ':' '\n' <<< \$PATH"
alias qr='qrencode -t ANSI -s 1 -m 1'
alias wttr='curl wttr.in'

# httpie - https://httpie.org/
if type http &>/dev/null; then
  alias https='http --default-scheme=https'
fi

# Java development 
# Install with: curl -s "https://get.sdkman.io" | bash
if [[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]]; then 
  export SDKMAN_DIR="$HOME/.sdkman"
  source "$HOME/.sdkman/bin/sdkman-init.sh"
fi

if type gradle-or-gradlew &>/dev/null; then
  alias gw='gradle-or-gradlew'
fi

# Fast nodejs version manager
if type fnm &>/dev/null; then
  eval "$(fnm env)"
fi

alias mirrors='reflector --verbose -f 5 -c US -p https'
alias umirrors='mirrors | sudo tee /etc/pacman.d/mirrorlist'
alias up='yay -Syyu --noconfirm --nodiffmenu --noeditmenu && yay -Sc --noconfirm && yay -Ps'
alias pkgs='yay -Qett'
alias ipkg='yay -Slq | fzf -m --preview '\''cat <(yay -Si {1}) <(yay -Fl {1} | awk "{print \$2}")'\'' | xargs -ro yay -S'
alias upkg='yay -Qett | fzf -m --preview '\''cat <(yay -Si {1}) <(yay -Fl {1} | awk "{print \$2}")'\'' | xargs -ro yay -Rc' 
alias clean-pkgs='yay -Yc && yay -Sc --noconfirm'
alias clean-logs='sudo journalctl --vacuum-time=10d'
