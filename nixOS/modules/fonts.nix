{ config, pkgs, pkgsUnstable, ... }:

{
  environment.systemPackages = with pkgs; [
  ] ++ (with pkgsUnstable; [
    nerd-fonts.jetbrains-mono
  ]);

  fonts.packages = [
    pkgsUnstable.jetbrains-mono
  ];
}

