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
    gnumake
  ] ++ (with pkgsUnstable; [
    zoxide
    zellij
    yazi
    bc
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

