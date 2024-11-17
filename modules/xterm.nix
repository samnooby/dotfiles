{ pkgs, username, ... }:

{
  environment.systemPackages = [
    pkgs.xtermcontrol
  ];

  home-manager.users.${username} = {
    home.file."/home/${username}/.xtermcontrol" = {
      text = '' 
        font="Monoid";
      '';
    };
  };
}
