{ username, pkgs, ... }:

{
  fonts = {
    fontDir.enable = true;
    fontconfig.enable = true;
    packages = with pkgs; [
      (nerdfonts.override { fonts = [ "Monoid" ]; })
    ];
  };
}
