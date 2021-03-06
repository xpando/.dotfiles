# Bail out if not running interactively
[[ $- != *i* ]] && return

export PATH=~/go/bin:$PATH
export PATH=~/.cargo/bin:$PATH
export PATH=~/.local/bin:$PATH

export LESS=FRX

export EDITOR=vim
if type nvim &>/dev/null; then # prefer nvim
    export EDITOR=nvim
fi

# Privacy
export DOTNET_CLI_TELEMETRY_OPTOUT=1
export SAM_CLI_TELEMETRY=0

# ZSH Plugins
# Install with: curl -sfL --proto-redir https https://git.io/antibody | sh -s - -b /usr/local/bin
source <(antibody init)
export ZSH="$(antibody home)/https-COLON--SLASH--SLASH-github.com-SLASH-ohmyzsh-SLASH-ohmyzsh"
antibody bundle < ~/.zsh_plugins

# Prompt https://starship.rs
# config in: ~/.config/starship.toml
# Install: curl -fsSL --proto-redir https https://starship.rs/install.sh | bash
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
    export AWS_FUZZ_USER='dfindley'
    export AWS_FUZZ_KEY_PATH='~/.ssh/newengen_rsa'
    export AWS_FUZZ_USE_CACHE=yes
    export AWS_FUZZ_CACHE_EXPIRY=3600  # expiry time in seconds
    alias awssh='aws-fuzzy --private'
fi

# Aliases
alias reboot='sudo reboot'
alias sdn='sudo shutdown now'
alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias ip='ip -c' # use colored output
alias docker-up='sudo systemctl start docker'
alias docker-down='sudo systemctl stop docker && sudo systemctl stop containerd'
alias vm-up='sudo systemctl start libvirtd && virsh net-start default'
alias vm-down='sudo systemctl stop libvirtd && virsh net-destroy default'
alias clean-logs='sudo journalctl --vacuum-time=5d'
alias path="tr ':' '\n' <<< \$PATH" # list path elements vertiacally for easier reading
alias qr='qrencode -t ANSI -s 1 -m 1'
alias wttr='curl wttr.in'
alias fkeys='echo 0 | sudo tee /sys/module/hid_apple/parameters/fnmode >/dev/null'
alias lastmod="find . -type f -exec stat --format '%Y :%y %n' \"{}\" \; | sort -nr | cut -d: -f2-"
alias gwp="gradle properties | grep plugins: | sed 's/^.*\[\(.*\)\]$/\1/' | tr \",\" \"\n\" | xargs -n 1 | sort"

# Common command replacements
# EXA is a better ls written in rust: https://the.exa.website/
if type exa &>/dev/null; then
    alias ls='exa --git --group-directories-first'
fi
alias l='ls -lh'
alias ll='ls -lah'

# Colorized cat
if type bat &>/dev/null; then
    alias cat='bat -p'
    export MANPAGER="sh -c 'col -bx | bat -l man -p'"
fi

# Git
alias gfa='git fetch --all'

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

# gradle zsh plugin provides this function
# if it is present, alias it to gw
if type gradle-or-gradlew &>/dev/null; then
    alias gw='gradle-or-gradlew'
fi

# Fast nodejs version manager
if type fnm &>/dev/null; then
    eval "$(fnm env)"
fi

case $(lsb_release -a | egrep 'Distributor ID:' | cut -f2) in
    Arch)
        alias mirrors='reflector --verbose -f 5 -c US -p https'
        alias umirrors='mirrors | sudo tee /etc/pacman.d/mirrorlist'
        alias up='paru -Syyu --noconfirm && paru -Sc --noconfirm && paru -Ps'
        alias pkgs='paru -Qett'
        alias ipkg='paru -Slq | fzf -m --preview '\''cat <(paru -Si {1}) <(paru -Fl {1} | awk "{print \$2}")'\'' | xargs -ro paru -S'
        alias upkg='paru -Qett | fzf -m --preview '\''cat <(paru -Si {1}) <(paru -Fl {1} | awk "{print \$2}")'\'' | xargs -ro paru -Rc' 
        alias clean-pkgs='paru -c'
        ;;

# TODO: add aliases specific to other distributions I use such as Ubuntu
esac

# Helpful functions
function psgrep() { ps axuf | grep -v grep | grep "$@" -i --color=auto; }
