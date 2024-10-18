{ config, pkgs, inputs, lib, system, ... }:

let
  cfg = config.applications.hyprland;
in
{
  options.applications.hyprland.enable = lib.mkEnableOption "Enable hypland window manager module";

  config = lib.mkIf cfg.enable {
    programs.hyprland = {
      enable = true;
      package = inputs.hyprland.packages."${pkgs.system}".hyprland;
    };
    
    services.xserver.enable = false;
  };
}
