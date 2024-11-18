{ username, pkgs, ... }:

{
  programs.fish = {
    enable = true;
  };
  users.users.${username}.shell = pkgs.fish;

  environment.systemPackages = [
    pkgs.screenfetch
  ];

  home-manager.users.${username} = {
    programs.fish = {
      enable = true;
      interactiveShellInit = ''
        function fish_greeting
          screenfetch
        end
      '';
      plugins = [
        { name = "tide"; src = pkgs.fishPlugins.tide.src; }
      ];
    };
  };
}
