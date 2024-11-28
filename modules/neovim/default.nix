{ lib, config, pkgs, ... }:

{
  options.neovim = {
    enabled = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };

  config = lib.mkIf config.neovim.enabled {
    home.packages = with pkgs; [
      nodejs_22
      gcc14
      ripgrep
      fd
      lazygit
      lua-language-server
      nixfmt-classic
      cargo
      unzip
    ];

    programs.neovim = {
      enable = true;
      viAlias = true;
      vimAlias = true;
      defaultEditor = true;
      withNodeJs = true;

      extraLuaConfig = ''
        require("config.lazy")
      '';
    };

    home.file."./.config/nvim/" = {
      source = ./config;
      recursive = true;
    };
  };
}
