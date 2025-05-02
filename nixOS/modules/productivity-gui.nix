{ config, pkgs, pkgsUnstable, ... }:

{
  environment.systemPackages = with pkgs; [
    obsidian
  ] ++ (with pkgsUnstable; [
    ghostty
    brave
    firefox
  ]);
}

