{ config, pkgs, ... }:

{
  home.username = "sam";
  home.homeDirectory = "/Users/sam";

  home.stateVersion = "24.05"; # Please read the comment before changing.

  neovim.enable = true;
  git.username = "Sam Newby";
  git.email = "sam@kahi.io";

  programs.home-manager.enable = true;
}
