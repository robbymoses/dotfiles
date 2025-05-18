{ config, pkgs, pkgsUnstable, ... }:

{
  imports = [
       # Copy /etc/nixos/hardware.nix 
      ./hardware-configuration.nix
      ../../modules/productivity-gui.nix
      ../../modules/development-tools.nix
      ../../modules/hyprland.nix
      ../../modules/flatpak.nix
    ];
  # intel
  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      vpl-gpu-rt
    ];
  };
  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "vulcan";
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

  environment.systemPackages = with pkgs; [
    htop
    tree
  ] ++ (with pkgsUnstable; [
    dbeaver-bin
  ]);
}

