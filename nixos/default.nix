{ config, nixpkgs, inputs, lib, allowed-unfree-packages, ... }:

{
  imports = [
    ./stylix.nix
    ./system
    ./fish
    ./hyprland
  ];

  config = {
    nixpkgs.config = {
      allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) allowed-unfree-packages;
    };
  };
}
