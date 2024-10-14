{ config, pkgs, ... }:

{
  imports = [
    ./system
    ./fish
    ./hyprland
  ];
}
