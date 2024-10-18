{ config, nixpkgs, lib, allowed-unfree-packages, ... }:

{
  imports = [
    ./modules/hyprland
    ./modules/neovim
    ./modules/fish
    ./modules/git
    ./modules/firefox
    ./modules/vscode
    ./modules/stylix
  ];

  nixpkgs.config = {
    allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) allowed-unfree-packages;
  };
}
