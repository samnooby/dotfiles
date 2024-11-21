{ config, pkgs, ... }:

{
  home.username = "sam";
  home.homeDirectory = "/Users/sam";

  home.stateVersion = "24.05"; # Please read the comment before changing.

  # neovim.enable = true;

  programs.home-manager.enable = true;
}
