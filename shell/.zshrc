export DYLD_LIBRARY_PATH=/opt/homebrew/lib/
export DYLD_FALLBACK_LIBRARY_PATH="$(brew --prefix)/lib:$DYLD_FALLBACK_LIBRARY_PATH"
export HOMEBREW_NO_AUTO_UPDATE=1
alias brewup='brew update && brew upgrade && brew autoremove && brew cleanup && brew doctor'

export NODE_EXTRA_CA_CERTS=~/.cacert.pem

autoload -Uz compinit
ZSH_COMPDUMP="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/zcompdump"
mkdir -pm 700 "${ZSH_COMPDUMP:h}"
compinit -d "$ZSH_COMPDUMP"

export GPG_TTY=$(tty)

eval "$(starship init zsh)"
alias fetch="fastfetch"

remove_venv_prefix() { [[ $PS1 == \(*\)* ]] && PS1="${PS1/\(*\) /}"; }
autoload -U add-zsh-hook
add-zsh-hook precmd remove_venv_prefix

alias activate="source .venv/bin/activate"
alias vim='nvim'; alias vi='nvim'
hide_nvim() { [[ $1 == vim* || $1 == nvim* || $1 == vi* ]] && printf '\033[2A\033[2K'; }
autoload -Uz add-zsh-hook
add-zsh-hook preexec hide_nvim

alias ls='ls -G'; alias lt='du -sh * | sort -rh'; alias left='ls -t -1'

alias flush="sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder"

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
