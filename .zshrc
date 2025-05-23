export DYLD_LIBRARY_PATH=/opt/homebrew/lib/
export DYLD_FALLBACK_LIBRARY_PATH="$(brew --prefix)/lib:$DYLD_FALLBACK_LIBRARY_PATH"
export HOMEBREW_NO_AUTO_UPDATE=1

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
alias gs='git s'
alias ga='git add'
alias gaa='git add --all'
alias gc='git commit'
alias gcm='git commit -m'
alias gp='git p'
alias gpu='git push'
alias gco='git go'
alias gl='git l'
alias gd='git d'
alias grb='git rebase'
alias gsh='git stash'
alias gshp='git stash pop'
