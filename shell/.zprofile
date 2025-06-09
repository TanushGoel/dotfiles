if [[ "$OSTYPE" == "darwin"* ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
else
    eval "$($HOME/.linuxbrew/bin/brew shellenv)"
fi
