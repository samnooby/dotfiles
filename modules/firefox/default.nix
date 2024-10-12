{ config, pkgs, lib, ... }:

let cfg = config.module.firefox; in {
  options.module.firefox.enable = lib.mkEnableOption "Enable firefox browser module";

  config = lib.mkIf cfg.enable {
    programs.firefox.enable = true;
  };
}
