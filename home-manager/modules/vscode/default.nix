{ lib, config, pkgs, inputs, ... }:

let
  cfg = config.modules.vscode;
in
{
  options.modules.vscode.enable = lib.mkEnableOption "Enable vscode editor module";

  config = lib.mkIf cfg.enable {
    programs.vscode = {
      enable = true;
    };
  };
}
