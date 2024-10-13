{ config, pkgs, ... }:

{
  imports = [
    ./modules/hyprland
  ];

  home.username = "sam";
  home.homeDirectory = "/home/sam";

  home.stateVersion = "24.05"; # Please read the comment before changing.

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Enabled modules for the user
  config.modules = {
    hyprland.enable = true;
    neovim.enable = true;
  };
}
