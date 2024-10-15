{ lib, config, pkgs, ... }:

let
  cfg = config.modules.firefox;
in
{
  options.modules.firefox.enable = lib.mkEnableOption "Enable firefox web browser module";

  config = lib.mkIf cfg.enable {
    programs.firefox = {
      enable = true;
    };
  };
}
