# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ../../nixosModules
    ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.sam = {
    isNormalUser = true;
    description = "Sam Newby";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  programs.firefox.enable = true;
  programs.hyprland.enable = true;
  programs.hyprland.package = inputs.hyprland.packages."${pkgs.system}".hyprland;

  environment.systemPackages = with pkgs; [
    git
    google-chrome
    home-manager
  ];
}
