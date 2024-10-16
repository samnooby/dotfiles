{ config, pkgs, inputs, lib, system, ... }:

let
  cfg = config.modules.hyprland;
in
{
  options.modules.hyprland.enable = lib.mkEnableOption "Enable hypland window manager module";

  config = lib.mkIf cfg.enable {
    programs.hyprland = {
      enable = true;
      package = inputs.hyprland.packages."${pkgs.system}".hyprland;
    };
    
    services.xserver.enable = false;
  };
}
