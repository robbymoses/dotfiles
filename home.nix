{ config, pkgs, ... }:

{
  home.username = "rmoses";
  home.homeDirectory = "/home/rmoses";

  home.stateVersion = "24.05";

  programs.home-manager.enable = true;

  # Alacritty
  programs.alacritty.enable = true;
  home.file.".config/alacritty/alacritty.toml".source = ./config/alacritty/alacritty.toml;

  # ZSH
  programs.zsh.enable = true;
  home.file.".zshrc".source = ./config/zshrc/.zshrc;

  # Starship
  programs.starship.enable = true;
  home.file.".config/starship.toml".source = ./config/starship/starship.toml;

  # Neovim
  programs.neovim.enable = true;
  home.file.".config/nvim".source = ./config/nvim;

  # Git
  programs.git.enable = true;
  home.file.".gitconfig".source = ./config/git/.gitconfig;
}
