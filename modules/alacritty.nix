{ username, ... }:

{
  home-manager.users.${username} = {
    programs.alacritty = {
      enable = true;
    };
    home.sessionVariables = {
      TERMINAL = "alacritty";
      TERM = "alacritty";
    };
  };
}
