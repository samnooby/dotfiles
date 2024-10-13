{ config, lib, inputs, ... }:

{
  imports = [ ../../modules/default.nix ];

  config.window-manager.gnome.enabled = true;
}
