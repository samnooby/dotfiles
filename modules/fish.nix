{ username, pkgs, ... }:

{
  programs.fish = {
    enable = true;
  };
  users.users.${username}.shell = pkgs.fish;

  environment.systemPackages = [
    pkgs.fortune
  ];

  home-manager.users.${username} = {
    programs.fish = {
      enable = true;
      interactiveShellInit = ''
        function fish_greeting
          fortune
        end
      '';
      plugins = [
        { name = "tide"; src = pkgs.fishPlugins.tide.src; }
      ];
      functions = {
        alac = ''
          # start dbus and assign variables 
          set vars (dbus-launch)
          for line in $vars
            set splitVars (string split -m1 "=" $line)
            
          end
        '';
      };
    };
  };
}
