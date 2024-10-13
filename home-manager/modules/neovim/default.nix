{ lib, config, pkgs, inputs, ... }:

let
  cfg = config.modules.neovim;
in
{
  options.modules.neovim.enable = lib.mkEnableOption "Enable neovim text editor module";

  config = lib.mkIf cfg.enable {
    programs.neovim = {
      enable = true;
      defaultEditor = true;

      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;

      extraLuaConfig = ''
        ${builtins.readFile ./options.lua}
      '';
    };
  };
}
