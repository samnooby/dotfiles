{ config, pkgs, ... }:

{
  imports = [
    ./modules/hyprland
    ./modules/neovim
    ./modules/fish
    ./modules/git
    ./modules/firefox
  ];

  config = {
    home.username = "sam";
    home.homeDirectory = "/home/sam";

    home.stateVersion = "24.05"; # Please read the comment before changing.

    # Let Home Manager install and manage itself.
    programs.home-manager.enable = true;

    modules = {
      hyprland.enable = true;
      neovim.enable = true;
      fish.enable = true;
      firefox.enable = true;
      git.enable = true;
    };
  };
}
