{ config, inputs, pkgs, lib, ... }:

let
  cfg = config.window-manager.gnome;
in
{
  options = {
    window-manager.gnome.enabled = lib.mkEnableOption "Enable the gnome window manager module";
  };

  config = lib.mkIf cfg.enabled {

    home = {
      desktopManager.gnome = {
        enable = true;
        gdm.enable = true;
      };
    };

    # Enable the X11 windowing system.
    services.xserver.enable = true;

    # Configure keymap in X11
    services.xserver.xkb = {
      layout = "us";
      variant = "";
    };
  };
}
