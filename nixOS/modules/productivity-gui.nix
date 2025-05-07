{ config, pkgs, pkgsUnstable, ... }:

{
  environment.systemPackages = with pkgs; [
    obsidian
  ] ++ (with pkgsUnstable; [
    ghostty
    code-cursor
    brave
    vscode
    discord
    firefox
  ]);
}

