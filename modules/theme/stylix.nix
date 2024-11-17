{ pkgs, config, ... }:

{
  stylix = {
    enable = true;
    image = ./wallpaper.png;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/spaceduck.yaml";
  };
  home-manager.sharedModules = [{
    stylix = {
      fonts = {
        serif = {
          name = "Monoid Nerd Font";
    	  package = pkgs.nerdfonts;
        };
  
        sansSerif = {
          name = "Monoid Nerd Font";
  	  package = pkgs.nerdfonts;
        };
  
        monospace = {
          name = "Monoid Nerd Font";
  	  package = pkgs.nerdfonts;
        };
  
        emoji = {
          name = "Monoid Nerd Font";
  	  package = pkgs.nerdfonts;
        }; 
      };
    };
  }];
}
