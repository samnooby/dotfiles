{ config, lib, ... }:
with lib;

{
    options = {
        neovim.enable = mkEnableOption "Enable neovim text editor";
    };

    config = mkIf config.neovim.enable {
        home.packages = with pkgs; [];

        programs.neovim = {
            enable = true;
            viAlias = true;
            vimAlias = true;
            defaultEditor = true;
        };
    };
    
}