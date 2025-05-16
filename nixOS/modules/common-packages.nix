{ config, pkgs, pkgsUnstable, ... }:

{
  environment.systemPackages = with pkgs; [
    git
    curl
    wget
    jq
    zsh
    stow
    gcc
    cmake
  ] ++ (with pkgsUnstable; [
    zoxide
    zellij
    yazi
    fzf
    ripgrep
    helix
    starship
    bitwarden-desktop
    docker-compose
    vim
    killall
    fish
  ]);
}

