{ pkgs, username, ... }:

{
  # disable all other display managers
  services.xserver.displayManager.lightdm.enable = false;
  services.xserver.displayManager.gdm.enable = false;
  services.xserver.displayManager.sddm.enable = false;

  services.xserver = {
    enable = true;
    windowManager.i3.enable = true;
  };

  services.displayManager = {
    enable = true;
    execCmd = "i3";
  };
  
  home-manager.users.${username} = {
    xsession.windowManager.i3 = {
      enable = true;
      package = pkgs.i3-gaps;
      config = {
        modifier = "Mod4";
        gaps = {
          inner = 10;
          outer = 5;
        };
      };
    };
  };
}
