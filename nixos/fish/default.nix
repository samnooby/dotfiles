{ config, pkgs, lib, ... };

let
  cfg = config.module.fish;
in
{
  options.module.fish.enable = lib.mkEnableOption "Enable fish shell module";

  config = lib.mkIf cfg.enable {
    programs.fish.enable = true;

    user.users.sam.shell = pkgs.fish;
  };
}
