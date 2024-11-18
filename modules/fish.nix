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
    };
  };
}
