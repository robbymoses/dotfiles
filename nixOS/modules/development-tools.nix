{ config, pkgs, pkgsUnstable, ... }:

{
  environment.systemPackages = with pkgs; [
    devbox
    direnv
  ] ++ (with pkgsUnstable; [
    neovim
    dbeaver-bin
    lazygit
    lazydocker
    better-commits
    bruno
  ]);
}

