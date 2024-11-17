{ pkgs, config, ... }:

let
  monoidFont = pkgs.nerdfonts.override { fonts = ["HeavyData"]; };
in
{
  stylix = {
    enable = true;
    image = ./wallpaper.png;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/spaceduck.yaml";
    fonts = {
      monospace = {
        package = monoidFont;
        name = "HeavyData Nerd Font";
      };
      sansSerif = {
        package = monoidFont;
        name = "HeavyData Nerd Font";
      };
      serif = {
        package = monoidFont;
        name = "HeavyData Nerd Font";
      };
    };
  };
}
