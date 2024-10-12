{ config, pkgs, lib, ... }:

let cfg = config.module.git; in {
  options.module.git.enable = lib.mkEnableOption "Enable git version control module";

  config = lib.mkIf cfg.enable {
    environment.systemPackages = [
      pkgs.git
    ];
  };
}
