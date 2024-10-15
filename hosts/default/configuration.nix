{ config, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ../../nixos
    ];

  config = {
    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    # Define a user account. Don't forget to set a password with ‘passwd’.
    users.users.sam = {
      isNormalUser = true;
      description = "Sam Newby";
      extraGroups = [ "networkmanager" "wheel" ];
    };

    nixpkgs.config.allowUnfree = true;

    environment.systemPackages = with pkgs; [
      google-chrome
      home-manager
    ];

    modules.fish.enable = true;
    modules.hyprland.enable = true;
  };
}
