{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./modules/default.nix
    ];

  module.hyprland.enable = true;
  module.neovim.enable = true;
  module.kitty.enable = true;
  module.regreet.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.samn = {
    isNormalUser = true;
    description = "Sam Newby";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      google-chrome
      git
      vscode
    ];
  };

  # Install firefox.
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
}
