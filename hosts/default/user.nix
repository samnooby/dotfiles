{ config, lib, inputs, ... }:

{
  imports = [ ../../managerModules/default.nix ];

  config.window-manager.hyprland.enable = true;
}
