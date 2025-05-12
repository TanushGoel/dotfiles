export DYLD_LIBRARY_PATH=/opt/homebrew/lib/
export DYLD_FALLBACK_LIBRARY_PATH="$(brew --prefix)/lib:$DYLD_FALLBACK_LIBRARY_PATH"
export HOMEBREW_NO_AUTO_UPDATE=1

autoload -Uz compinit
ZSH_COMPDUMP="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/zcompdump"
mkdir -p "$(dirname "$ZSH_COMPDUMP")"
compinit -d "$ZSH_COMPDUMP"

export GPG_TTY=$(tty)

eval "$(starship init zsh)"
alias fetch="fastfetch"

alias activate="source .venv/bin/activate"
alias vim='nvim'; alias vi='nvim'
hide_vim() {
  case "$1" in
    (vim|nvim|vi|'vim '*|'nvim '*|'vi '*) printf '\033[2A\033[2K' ;;
  esac
}
autoload -Uz add-zsh-hook
add-zsh-hook preexec hide_vim

alias ls='ls -G'; alias lt='du -sh * | sort -rh'; alias left='ls -t -1'

alias flush="sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder"

# TODO: git aliases
