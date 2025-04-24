{ config, pkgs, pkgsUnstable, ... }:

{
  environment.systemPackages = with pkgs; [
    git
    ghostty
    curl
    wget
    jq
    firefox
    zsh
    stow
  ] ++ (with pkgsUnstable; [
    helix
    starship
    bitwarden-desktop
    docker-compose
  ]);
}

