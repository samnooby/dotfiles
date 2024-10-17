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
    # Let Home Manager install and manage itself.
    programs.home-manager.enable = true;
  };
}
