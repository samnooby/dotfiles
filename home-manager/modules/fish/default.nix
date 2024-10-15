{ config, pkgs, lib, ... }:
with lib;

let
  cfg = config.modules.fish;
  hyprland-enable = config.modules.hyprland.enable;
in
{
  options.modules.fish.enable = mkEnableOption "Enable fish shell module";

  config = mkIf cfg.enable {
    programs.fish = {
      enable = true;
      loginShellInit = ''
        ${optionalString hyprland-enable "Hyprland"}
      '';
    };
  };
}
