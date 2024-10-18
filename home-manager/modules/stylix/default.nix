{ lib, config, pkgs, ... }:
let
    cfg = config.theme;
in
{
    options.theme = {
        wallpaper = lib.mkOption {
            type = lib.types.path;
            default = "./wallpaper.jpg";
            description = "The path to the wallpaper image";
        };
        name = lib.mkOption {
            type = lib.types.str;
            description = "The base16 theme to use";
            default = "deep-oceanic-next";
        };
    };

    config = {
        stylix = {
            enable = true;
            image = cfg.wallpaper;
            base16Scheme = "${pkgs.base16-schemes}/share/themes/${cfg.name}.yaml";
        };
    };
}