{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./modules/default.nix
    ];
  
  module = {
    hyprland.enable = true;
    neovim.enable = true;
    kitty.enable = true;
    regreet.enable = true;
    firefox.enable = true;
    git.enable = true;
    users = {
      samn.enable = true;
    };
  };
}
