{ pkgs, lib, config, ... }:

let
  nerdFonts = pkgs.nerdfonts.override { fonts = ["MartianMono" "Hack"]; };
in
{
  options.stylix = {
    enabled = lib.mkOption {
        type = lib.types.bool;
        default = false;
    };
  };

  config = lib.mkIf config.stylix.enabled {
    stylix = {
      enable = true;
      image = ./wallpaper.png;
      base16Scheme = "${pkgs.base16-schemes}/share/themes/equilibrium-dark.yaml";
      fonts = {
      monospace = {
        package = nerdFonts;
        name = "MartianMono Nerd Font";
      };
      sansSerif = {
        package = nerdFonts;
        name = "Hack Nerd Font";
      };
      serif = {
        package = nerdFonts;
        name = "Hack Nerd Font";
      };
    };
    };
  };
}
