{ lib, config, pkgs, ... }:

let cfg = config.module.neovim; in {
  options.module.neovim = {
    enable = lib.mkEnableOption "Enable Neovim Module";
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = [
      pkgs.neovim
    ];

    programs.neovim = {
      enable = true;
      viAlias = true;
      vimAlias = true;
    };
  };
}
