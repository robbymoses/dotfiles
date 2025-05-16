{ config, pkgs, pkgsUnstable, ... }:

{

  environment.systemPackages = with pkgs; [
  ] ++ (with pkgsUnstable; [
    steam
    runelite

  ]);
}

