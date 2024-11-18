{ username, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    alacritty
  ];

  home-manager.users.${username} = {
    home.sessionVariables = {
      TERMINAL = "alacritty";
      TERM = "alacritty";
    };
  };
}
