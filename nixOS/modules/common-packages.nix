{ config, pkgs, pkgsUnstable, ... }:

{
  environment.systemPackages = with pkgs; [
    git
    ghostty
    curl
    wget
    jq
    firefox
  ] ++ (with pkgsUnstable; [
    helix
    bitwarden-desktop
    docker-compose
  ]);
}

