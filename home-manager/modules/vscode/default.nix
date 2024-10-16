{ lib, config, pkgs, inputs, ... }:

let
  cfg = config.applications.vscode;
in
{
  options.applications.vscode.enable = lib.mkEnableOption "Enable vscode editor module";

  config = lib.mkIf cfg.enable {
    programs.vscode = {
      enable = true;
    };
  };
}
