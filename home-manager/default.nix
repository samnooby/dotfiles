{ config, nixpkgs, lib, allowed-unfree-packages, ... }:

{
  imports = [
    ./modules/hyprland
    ./modules/neovim
    ./modules/fish
    # ./modules/git
    ./modules/firefox
    ./modules/vscode
  ];

  nixpkgs.config = {
    allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) allowed-unfree-packages;
  };
}
