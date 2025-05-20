{ config, pkgs, pkgsUnstable, ... }:

{
  environment.systemPackages = with pkgs; [
  ] ++ (with pkgsUnstable; [
    ghostty
    spotify
    code-cursor
    brave
    vscode
    discord
    firefox
    joplin-desktop
    obsidian
  ]);
}

