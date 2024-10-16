{ config, pkgs, ... }:

{
  imports = [
    ./modules/hyprland
    ./modules/neovim
    ./modules/fish
    ./modules/git
    ./modules/firefox
    ./modules/vscode
  ];

  config = {
    home.stateVersion = "24.05"; # Please read the comment before changing.

    # Let Home Manager install and manage itself.
    programs.home-manager.enable = true;
  };
}
