{ config, inputs, pkgs, lib, ... }:

let
  cfg = config.window-manager.gnome;
in
{
  options = {
    window-manager.gnome.enabled = lib.mkEnableOption "Enable the gnome window manager module";
  };

  config = lib.mkIf cfg.enabled {

    # Enable the X11 windowing system.
    services.xserver.enable = true;

    # Enable the GNOME Desktop Environment.
    services.xserver.displayManager.gdm.enable = true;
    services.xserver.desktopManager.gnome.enable = true;

    # Configure keymap in X11
    services.xserver.xkb = {
      layout = "us";
      variant = "";
    };
  };
}
