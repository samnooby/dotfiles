{ lib, config, pkgs, ... }:

let
  cfg = config.applications.firefox;
in
{
  options.applications.firefox.enable = lib.mkEnableOption "Enable firefox web browser module";

  config = lib.mkIf cfg.enable {
    programs.firefox = {
      enable = true;
    };
  };
}
