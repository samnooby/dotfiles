{ config, pkgs, lib, ... }:
with lib;

let
  cfg = config.applications.fish;
  hyprland-enable = config.applications.hyprland.enable;
in
{
  options.applications.fish.enable = mkEnableOption "Enable fish shell module";

  config = mkIf cfg.enable {
    programs.fish = {
      enable = true;
      loginShellInit = ''
        ${optionalString hyprland-enable "Hyprland"}
      '';
    };
  };
}
