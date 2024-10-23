# Starship Prompt
eval "$(starship init zsh)"

eval ``keychain --eval --agents ssh id_ed25519

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
