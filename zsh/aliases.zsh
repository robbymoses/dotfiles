alias rebuild="sudo nixos-rebuild switch --flake $HOME/dotfiles/nixOS"
alias cd="z"
alias zf="__zoxide_zi"
alias dcu="docker compose up -d"

# Windmill Aliases
if [ "$(hostname)" = "argos" ]; then
  wmill() (
    case $1 in (sync)
      # Get the parent directory of the git repo and cd to it
      if git_dir=$(git rev-parse --show-toplevel) 2>dev>null; then
        cd "$git_dir" || return
      fi
    esac
    command wmill "$@"
  )
fi
