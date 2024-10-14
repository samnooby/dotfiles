{ config, pkgs, lib, ... }:

let
  cfg = config.modules.git;
in
{
  options.module.git.enable = lib.mkEnableOption "Enables git package manager module";

  config = lib.mkIf cfg.enable {
    programs.git = {
      enable = true;
    };
  };
}
