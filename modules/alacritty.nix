{ username, pkgs, ... }:

{
  home-manager.users.${username} = {
    programs.alacritty = {
      enable = true;
      settings = {
        window = {
          decorations = "None";
          startup_mode = "Fullscreen";
        };
        terminal.shell = "fish";
      };
    };

    home.sessionVariables = {
      TERMINAL = "alacritty";
      TERM = "alacritty";
    };
  };
}
