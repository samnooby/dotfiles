{ pkgs, config, ... }:

let
  monoidFont = pkgs.nerdfonts.override { fonts = ["Monoid"]; };
in
{
  stylix = {
    enable = true;
    image = ./wallpaper.png;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/spaceduck.yaml";
    fonts = {
      monospace = {
        package = monoidFont;
        name = "Monoid Nerd Font";
      };
      sansSerif = {
        package = monoidFont;
        name = "Monoid Nerd Font";
      };
      serif = {
        package = monoidFont;
        name = "Monoid Nerd Font";
      };
    };
  };
}
