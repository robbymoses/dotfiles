{ config, pkgs, pkgsUnstable, ... }:

{
  environment.systemPackages = with pkgs; [
    devbox
    direnv
  ] ++ (with pkgsUnstable; [
    neovim
    lazygit
    lazydocker
  ]);
}

