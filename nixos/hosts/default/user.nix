{ config, lib, inputs, ... }:

{
  imports = [ ../../managerModules/default.nix ];

  config.window-manager.hyprland.enable = true;
  config.applications.neovim.enable = true;
}
