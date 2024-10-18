{ config, pkgs, lib, ... }:

let
  cfg = config.applications.fish;
in
{
  options.applications.fish.enable = lib.mkEnableOption "Enable fish shell module";

  config = lib.mkIf cfg.enable {
    programs.fish.enable = true;

    users.users.sam.shell = pkgs.fish;
  };
}
