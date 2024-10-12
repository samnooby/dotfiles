{ config, pkgs, ... }:

{
  imports = [ 
    ./nixos
    ./users
    ./hyprland
    ./neovim
    ./kitty 
    ./regreet
    ./git
    ./firefox
  ];
}
