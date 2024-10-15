{ config, pkgs, lib, ... }:

let
  cfg = config.modules.fish;
in
{
  options.modules.fish.enable = lib.mkEnableOption "Enable fish shell module";

  config = lib.mkIf cfg.enable {
    programs.fish = {
      enable = true;
      loginShellInit = ''
        Hyprland
      '';
    };
  };
}
