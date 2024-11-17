{ pkgs, username, ... }:

{
  home-manager.users.${username} = {
    programs.kitty = {
      enable = true;
      shellIntegration.enableFishIntegration = true;
    };
    home.sessionVariables = {
      TERMINAL = "kitty";
      TERM = "kitty";
    };
  };
}
