{ config, pkgs, ... }:

{
  imports = [
    ./window-manager/hyprland
    ./neovim
  ];

  home.username = "sam";
  home.homeDirectory = "/home/sam";

  home.stateVersion = "24.05"; # Please read the comment before changing.

  programs.home-manager.enable = true;
}
