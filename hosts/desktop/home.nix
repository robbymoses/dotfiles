{ config, pkgs, ... }:

{
  home.username = "rmoses";
  home.homeDirectory = "/home/rmoses";

  imports = [
    ../../modules/user/app/git/git.nix
    ../../homeManager/startship.nix
  ]

  home.stateVersion = "24.05"; # Please read the comment before changing.

  home.packages = [
  
  ];
  home.file = {
  
  };

  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
