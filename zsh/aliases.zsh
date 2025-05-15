alias rebuild="sudo nixos-rebuild switch --flake $HOME/dotfiles/nixOS"
alias cd="z"
alias zf="__zoxide_zi"
alias dc="docker compose"
alias nixClean="nix-env --delete-generations +3 && nix-store --gc"
# Windmill Aliases
if [ "$(hostname)" = "argos" ]; then
  wmill() (
    case $1 in (sync)
      # Get the parent directory of the git repo and cd to it
      if git_dir=$(git rev-parse --show-toplevel) 2>/dev/null; then
        cd "$git_dir" || return
      fi
    esac
    command wmill "$@"
  )
fi
