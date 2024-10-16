{ config, pkgs, ... }:

{
  imports = [
    ../../home-manager
  ];

  config = {
    home.username = "sam";
    home.homeDirectory = "/home/sam";

    applications = {
      hyprland.enable = true;
      neovim.enable = true;
      fish.enable = true;
      firefox.enable = true;
      git.enable = true;
      vscode.enable = true;
    };
  };
}
