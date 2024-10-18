{ lib, config, pkgs, inputs, ... }:

let
  cfg = config.applications.vscode;
in
{
  options.applications.vscode.enable = lib.mkEnableOption "Enable vscode editor module";

  config = lib.mkIf cfg.enable {
    programs.vscode = {
      enable = true;
      extensions = with pkgs.vscode-extensions; [
        bbenoist.nix
        github.copilot
        github.copilot-chat
        pkief.material-icon-theme
      ];
    };
  };
}
