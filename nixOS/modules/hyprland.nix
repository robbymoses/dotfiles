{ config, pkgs, pkgsUnstable, ... }:

{
  # Enable Hyprland
  programs.hyprland = {
    enable = true;
  };

  # Required for Hyprland
  # security.pam.services.swaylock = {};

  # Common Hyprland packages
  environment.systemPackages = with pkgs; [
    # Core
    waybar
    swaylock
    #swayidle
    #wl-clipboard
    wofi
    mako
    #grim
    #slu
    #wf-recorder
    hyprpaper
    #xdg-desktop-portal-hyprland
    #xdg-desktop-portal-gtk

    # Utilities
    #brightnessctl
    #playerctl
    #pamixer
    #networkmanagerapplet
    #blueman
    gtk3
    #gsettings-desktop-schemas
  ] ++ (with pkgsUnstable; [
    # Additional packages from unstable
    kitty
  ]);

  # Enable XDG portal
  #xdg.portal = {
  #  enable = true;
  #  extraPortals = with pkgs; [
  #    xdg-desktop-portal-gtk
  #  ];
  #};

  # Enable necessary services
  # services = {
  #  dbus.enable = true;
  #  gvfs.enable = true;
  #  tumbler.enable = true;
  #  xserver = {
  #    enable = true;
      #displayManager.gdm.enable = true;
      #displayManager.gdm.wayland = true;
  #  };
  #};

  # Enable necessary environment variables
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    #XDG_CURRENT_DESKTOP = "Hyprland";
    #XDG_SESSION_TYPE = "wayland";
    #XDG_SESSION_DESKTOP = "Hyprland";
  };
} 
