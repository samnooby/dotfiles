{ config, nixpkgs, inputs, ... }:

{
  imports = [
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
