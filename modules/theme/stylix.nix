{ pkgs, config, ... }:

let
  nerdFonts = pkgs.nerdfonts.override { fonts = ["MartianMono" "Hack"]; };
in
{
  stylix = {
    enable = true;
    image = ./wallpaper.png;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/spaceduck.yaml";
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
}
