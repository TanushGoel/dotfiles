if [[ "$OSTYPE" == "darwin"* ]]; then
    export DYLD_LIBRARY_PATH=/opt/homebrew/lib/
    export DYLD_FALLBACK_LIBRARY_PATH="$(brew --prefix)/lib:$DYLD_FALLBACK_LIBRARY_PATH"
    export PATH="/opt/homebrew/bin:$PATH"
    alias brewup='brew update && brew upgrade && brew autoremove && brew cleanup && brew doctor'
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    export LD_LIBRARY_PATH=/opt/homebrew/lib/:$LD_LIBRARY_PATH
    export LD_LIBRARY_PATH="$(brew --prefix)/lib:$LD_LIBRARY_PATH"
    export PATH="$HOME/.linuxbrew/bin:$PATH"
fi
export HOMEBREW_NO_AUTO_UPDATE=1
export PATH="$HOME/.pixi/bin:$PATH"

export NODE_EXTRA_CA_CERTS=~/.cacert.pem

autoload -Uz compinit
ZSH_COMPDUMP="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/zcompdump"
mkdir -pm 700 "${ZSH_COMPDUMP:h}"
compinit -d "$ZSH_COMPDUMP"

export GPG_TTY=$(tty)

eval "$(starship init zsh)"
alias fetch="fastfetch"

remove_venv_prefix() { [[ $PS1 == \(*\)* ]] && PS1="${PS1/\(*\) /}"; }
autoload -Uz add-zsh-hook
add-zsh-hook precmd remove_venv_prefix

alias activate="source .venv/bin/activate"
alias vim='nvim'; alias vi='nvim'
hide_nvim() { [[ $1 == vim* || $1 == nvim* || $1 == vi* ]] && printf '\033[2A\033[2K'; }
add-zsh-hook preexec hide_nvim

alias ls='ls --color=auto'; alias lt='du -sh * | sort -rh'; alias left='ls -t -1'

if [[ "$OSTYPE" == "darwin"* ]]; then alias flush="sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder"
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then alias flush="sudo systemctl flush-dns || sudo systemd-resolve --flush-caches" 
fi

alias g='git'
alias gl='git l'
alias gs='git s'
alias gd='git d'
alias ga='git add'
alias gaa='git add -A'
alias gc='git commit'
alias gca='git ca'
alias gcm='gc -m'
alias gcl='git cl'
alias gp='git p'
alias gpu='git push'
alias gco='git go'
alias grb='git rebase'
alias gsh='git stash'
alias gshp='gsh pop'
