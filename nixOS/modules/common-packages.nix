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
  ] ++ (with pkgsUnstable; [
    helix
    bitwarden-desktop
    docker-compose
  ]);
}

