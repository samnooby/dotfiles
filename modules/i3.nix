{ pkgs, username, ... }:

{
  services.xserver = {
    enable = true;   
    desktopManager = {
      xterm.enable = false;
      xfce = {
        enable = true;
        noDesktop = true;
        enableXfwm = false;
      };
    };
    windowManager.i3.enable = true;
  };
  services.displayManager.defaultSession = "xfce";

  home-manager.users.${username} = {
    xsession.windowManager.i3 = {
      enable = true;
      package = pkgs.i3-gaps;
      config = {
        terminal = "alacritty";
        gaps = {
          inner = 10;
          outer = 5;
        };
      };
    };
  };
}
