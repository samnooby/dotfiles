{ config, pkgs, lib, ... }:

let cfg = config.module.regreet; in {
  options.module.regreet.enable = lib.mkEnableOption "Enable regreet login manager module";

  config = lib.mkIf cfg.enable {
    environment.systemPackages = [
      pkgs.greetd.regreet
    ];

    programs.regreet.enable = true;
  };
}
