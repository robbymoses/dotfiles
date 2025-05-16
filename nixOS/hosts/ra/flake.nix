{ config, pkgs, pkgsUnstable, ... }:

{
  imports = [
       # Copy /etc/nixos/hardware.nix 
      ./hardware-configuration.nix
      ../../modules/development-tools.nix
      ../../modules/productivity-gui.nix
      ../../modules/hyprland.nix
      ../../modules/gaming.nix
      ../../modules/flatpak.nix
    ];

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "ra";
  networking.networkmanager.enable = true;

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  services.twingate.enable = true;

  environment.systemPackages = with pkgs; [
    htop
    tree
  ] ++ (with pkgsUnstable; [
    dbeaver-bin
  ]);
}

