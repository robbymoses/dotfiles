{ config, pkgs, pkgsUnstable, ... }:

{
  environment.systemPackages = with pkgs; [
    obsidian
  ] ++ (with pkgsUnstable; [
    ghostty
    code-cursor
    brave
    vscode
<<<<<<< HEAD
    code-cursor
=======
    discord
>>>>>>> refs/remotes/origin/master
    firefox
  ]);
}

