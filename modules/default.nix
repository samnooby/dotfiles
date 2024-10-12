{ config, pkgs, ... }:

{
  imports = [ 
    ./nixos 
    ./hyprland
    ./neovim
  ];
}
