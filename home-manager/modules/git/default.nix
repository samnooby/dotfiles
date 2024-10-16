{ config, pkgs, lib, ... }:

let
  cfg = config.applications.git;
in
{
  options.applications.git.enable = lib.mkEnableOption "Enables git package manager module";

  config = lib.mkIf cfg.enable {
    programs.git = {
      enable = true;
    };
  };
}
