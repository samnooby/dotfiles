{ config, pkgs, ... }:

{
  imports = [ 
    ./nixos 
    ./hyprland
    ./neovim
    ./kitty 
    ./regreet
  ];
}
