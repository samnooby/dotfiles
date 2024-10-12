{ config, pkgs, lib, ... }:

let cfg = config.module.kitty; in {
  options.module.kitty.enable = lib.mkEnableOption "Enable kitty terminal module";

  config = lib.mkIf cfg.enable {
    environment.systemPackages = [
      pkgs.kitty
    ];
  };
}
