{ username, pkgs, ... }:

{
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      (nerdfonts.override { fonts = [ "Monoid" ]; })
    ];

    fontconfig = {
      defaultFonts = {
        monospace = [ "Monoid" ];
        sansSerif = [ "Monoid" ];
        serif = [ "Monoid" ];
      };
    };
  };
}
