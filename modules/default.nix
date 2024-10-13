{ inputs, config, pkgs, ... }:

{
  home.stateVersion = "24.05";
  imports = [
    ./windows-manager/gnome
  ];
}
