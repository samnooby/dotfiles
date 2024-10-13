{ config, lib, inputs, ... }:

{
  imports = [ ../../modules/default.nix ];

  config.window-manager.hyprland.enable = true;
}
