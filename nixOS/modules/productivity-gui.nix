{ config, pkgs, pkgsUnstable, ... }:

{
  environment.systemPackages = with pkgs; [
    logseq
  ] ++ (with pkgsUnstable; [
    obsidian
  ]);
}

