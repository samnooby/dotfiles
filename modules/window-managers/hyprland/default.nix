{ lib, config, pkgs, ... }:

let
  cfg = config.window-manager.hyprland;
in
{
  options.window-manager.hyprland.enable = lib.mkEnableOption "Enable hyprland window manager module";

  config = lib.mkIf cfg.enable {
    wayland.windowManager.hyprland = {
      enable = true;
      package = pkgs.hyprland;
      xwayland.enable = true;
  
      # Start hyprland by default
      systemd.enable = true;
    };
  };
}
